package com.bajekocinema.controller;

import com.bajekocinema.model.HallModel;
import com.bajekocinema.model.MovieModel;
import com.bajekocinema.model.SeatModel;
import com.bajekocinema.model.ShowModel;
import com.bajekocinema.model.UserModel;
import com.bajekocinema.services.BookingService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = {"/booking"})
public class UserBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final BookingService bookingService = new BookingService();

    // =========================================================================
    // GET — load movie, halls, shows, seats and forward to Booking.jsp
    // =========================================================================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 1. Resolve movieId
        String movieIdParam = request.getParameter("movieId");
        if (movieIdParam == null || movieIdParam.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/movies");
            return;
        }

        int movieId;
        try {
            movieId = Integer.parseInt(movieIdParam.trim());
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/movies");
            return;
        }

        // 2. Load movie
        MovieModel movie = bookingService.getMovie(movieId);
        if (movie == null) {
            response.sendRedirect(request.getContextPath() + "/movies");
            return;
        }

        // 3. Load halls screening this movie
        List<HallModel> halls = bookingService.getHallsForMovie(movieId);

        // 4. Resolve selected hall (default = first)
        HallModel selectedHall = bookingService.resolveSelectedHall(
                halls, request.getParameter("hallId"));

        // 5 & 6. Load shows + resolve selected show
        List<ShowModel> shows = new ArrayList<>();
        ShowModel selectedShow = null;

        if (selectedHall != null) {
            shows = bookingService.getShowsForMovieAndHall(movieId, selectedHall.getHallID());
            selectedShow = bookingService.resolveSelectedShow(shows, request.getParameter("showId"));
        }

        // 7. Load seats for selected show
        LinkedHashMap<String, List<SeatModel>> seatsByRow = new LinkedHashMap<>();
        List<SeatModel> flatSeats = new ArrayList<>();

        if (selectedShow != null) {
            seatsByRow = bookingService.getSeatsGroupedByRow(
                    selectedShow.getHallID(), selectedShow.getShowID());
            flatSeats  = bookingService.flattenSeats(seatsByRow);
        }

        // 8. Flash messages from redirect params
        String errorParam  = request.getParameter("error");
        String bookedParam = request.getParameter("booked");
        if (errorParam  != null) request.setAttribute("errorMessage",   errorParam);
        if (bookedParam != null) request.setAttribute("successMessage",
                "Booking confirmed! Your booking ID is #" + bookedParam);

        // 9. Set request attributes for JSP
        request.setAttribute("movie",        movie);
        request.setAttribute("halls",        halls);
        request.setAttribute("selectedHall", selectedHall);
        request.setAttribute("shows",        shows);
        request.setAttribute("selectedShow", selectedShow);
        request.setAttribute("seatsByRow",   seatsByRow);
        request.setAttribute("seats",        flatSeats);
        request.setAttribute("seatPrice",    BookingService.getSeatPrice());

        request.getRequestDispatcher("/WEB-INF/pages/user/Booking.jsp")
                .forward(request, response);
    }

    // =========================================================================
    // POST — validate selected seats, create booking, redirect with result
    // =========================================================================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserModel loggedUser = (UserModel) session.getAttribute("loggedUser");
        int userId = loggedUser.getUserID();

        String showIdStr   = request.getParameter("showId");
        String movieIdStr  = request.getParameter("movieId");
        String hallIdStr   = request.getParameter("hallId");
        String[] seatIdArr = request.getParameterValues("seatIds");

        if (showIdStr == null || movieIdStr == null || hallIdStr == null
                || seatIdArr == null || seatIdArr.length == 0) {
            redirectWithError(request, response, movieIdStr, hallIdStr, null,
                    "Please select at least one seat before confirming.");
            return;
        }

        int showId, movieId, hallId;
        List<Integer> seatIds = new ArrayList<>();

        try {
            showId  = Integer.parseInt(showIdStr.trim());
            movieId = Integer.parseInt(movieIdStr.trim());
            hallId  = Integer.parseInt(hallIdStr.trim());
            for (String s : seatIdArr) seatIds.add(Integer.parseInt(s.trim()));
        } catch (NumberFormatException e) {
            redirectWithError(request, response, movieIdStr, hallIdStr, null,
                    "Invalid booking data. Please try again.");
            return;
        }

        // Validate show belongs to this movie + hall
        ShowModel show = bookingService.getShowById(showId);
        if (show == null || show.getMovieID() != movieId || show.getHallID() != hallId) {
            redirectWithError(request, response,
                    String.valueOf(movieId), String.valueOf(hallId), String.valueOf(showId),
                    "The selected show is no longer available. Please choose another.");
            return;
        }

        // Race-condition guard: confirm seats are still free
        if (!bookingService.areSeatsAvailable(seatIds, hallId, showId)) {
            redirectWithError(request, response,
                    String.valueOf(movieId), String.valueOf(hallId), String.valueOf(showId),
                    "One or more selected seats were just booked. Please reselect.");
            return;
        }

        int newBookingId = bookingService.createBooking(userId, movieId, hallId, showId, seatIds);

        if (newBookingId == -1) {
            redirectWithError(request, response,
                    String.valueOf(movieId), String.valueOf(hallId), String.valueOf(showId),
                    "Booking failed due to a server error. Please try again.");
            return;
        }

        response.sendRedirect(request.getContextPath()
                + "/booking?movieId=" + movieId
                + "&hallId="  + hallId
                + "&showId="  + showId
                + "&booked="  + newBookingId);
    }

    // =========================================================================
    // Helper: redirect to GET with an error message in the query string
    // =========================================================================
    private void redirectWithError(HttpServletRequest request,
                                   HttpServletResponse response,
                                   String movieId, String hallId, String showId,
                                   String message) throws IOException {
        StringBuilder url = new StringBuilder(request.getContextPath() + "/booking?");
        if (movieId != null) url.append("movieId=").append(movieId).append("&");
        if (hallId  != null) url.append("hallId=").append(hallId).append("&");
        if (showId  != null) url.append("showId=").append(showId).append("&");
        url.append("error=").append(java.net.URLEncoder.encode(message, "UTF-8"));
        response.sendRedirect(url.toString());
    }
}
