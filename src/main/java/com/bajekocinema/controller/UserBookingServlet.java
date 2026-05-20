package com.bajekocinema.controller;

import com.bajekocinema.dao.SeatBookingDAO.BookingSummary;
import com.bajekocinema.model.*;
import com.bajekocinema.services.MovieService;
import com.bajekocinema.services.SeatBookingService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/booking" })
public class UserBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private MovieService movieService = new MovieService();
    private SeatBookingService bookingService = new SeatBookingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ---- 1. Movie (required) ----
        String movieIdStr = request.getParameter("movieId");
        if (movieIdStr == null || movieIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        int movieId;
        try { movieId = Integer.parseInt(movieIdStr); }
        catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        MovieModel movie = movieService.getMovieById(movieId);
        if (movie == null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        request.setAttribute("movie", movie);

        // ---- 2. Theatres for this movie ----
        List<TheatreModel> theatres = bookingService.getTheatresForMovie(movieId);
        request.setAttribute("theatres", theatres);

        // ---- 3. If theatre selected, load dates ----
        Integer theatreId = parseIntOrNull(request.getParameter("theatreId"));
        if (theatreId != null) {
            request.setAttribute("selectedTheatreId", theatreId);
            List<Date> dates = bookingService.getDatesForMovieTheatre(movieId, theatreId);
            request.setAttribute("dates", dates);
        }

        // ---- 4. If date selected, load show times ----
        String dateStr = request.getParameter("date");
        if (theatreId != null && dateStr != null && !dateStr.isEmpty()) {
            try {
                Date d = Date.valueOf(dateStr);
                request.setAttribute("selectedDate", d);
                List<ShowModel> shows = bookingService.getShowsForMovieTheatreDate(movieId, theatreId, d);
                request.setAttribute("shows", shows);
            } catch (IllegalArgumentException ignored) {}
        }

        // ---- 5. If show selected, load seats ----
        Integer showId = parseIntOrNull(request.getParameter("showId"));
        if (showId != null) {
            ShowModel show = bookingService.getShowDetails(showId);
            if (show != null) {
                request.setAttribute("selectedShow", show);
                List<SeatModel> seats = bookingService.getSeatsForShow(show.getHallID(), showId);
                request.setAttribute("seats", seats);
                request.setAttribute("seatPrice", SeatBookingService.SEAT_PRICE);
            }
        }

        request.getRequestDispatcher("/WEB-INF/pages/user/Booking.jsp")
               .forward(request, response);
    }

    /** POST = user clicked Buy Now from the seat grid. Creates pending booking, redirects to /review. */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Must be logged in
        UserModel user = (UserModel) request.getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int showId = Integer.parseInt(request.getParameter("showId"));
            String[] seatIdParams = request.getParameterValues("seatIds");

            if (seatIdParams == null || seatIdParams.length == 0) {
                // no seats picked — bounce back to booking page with movie context
                String movieId = request.getParameter("movieId");
                response.sendRedirect(request.getContextPath() + "/booking?movieId=" + movieId
                        + "&theatreId=" + request.getParameter("theatreId")
                        + "&date=" + request.getParameter("date")
                        + "&showId=" + showId);
                return;
            }

            int[] seatIds = new int[seatIdParams.length];
            for (int i = 0; i < seatIdParams.length; i++) {
                seatIds[i] = Integer.parseInt(seatIdParams[i]);
            }

            int bookingId = bookingService.createPendingBooking(user.getUserID(), showId, seatIds);
            if (bookingId < 0) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }

            response.sendRedirect(request.getContextPath() + "/review?bookingId=" + bookingId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

    private Integer parseIntOrNull(String s) {
        if (s == null || s.isEmpty()) return null;
        try { return Integer.parseInt(s); } catch (NumberFormatException e) { return null; }
    }
}