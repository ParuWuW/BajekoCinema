package com.bajekocinema.controller;

import com.bajekocinema.model.BookingModel;
import com.bajekocinema.model.ShowModel;
import com.bajekocinema.model.MovieModel;
import com.bajekocinema.services.BookingService;
import com.bajekocinema.services.ShowService;
import com.bajekocinema.services.MovieService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * BookingServlet — updated for new bajekocinema-2.sql schema.
 *
 * New Booking table: booking_id | user_id | show_id | booking_time | total_amount | status
 * No showBooking junction table — user_id and show_id are stored directly.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/booking", "/Abooking" })
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BookingService bookingService = new BookingService();
    private ShowService    showService    = new ShowService();
    private MovieService   movieService   = new MovieService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<BookingModel> bookingList     = bookingService.getAllBookings();
            List<ShowModel>    scheduledShows  = showService.getScheduledShows();
            List<MovieModel>   movieList       = movieService.getAllMovies();

            // Step-1 filter: admin selects a movie to see its shows
            String selectedMovie = request.getParameter("selectedMovieID");
            List<ShowModel> filteredShows = null;
            if (selectedMovie != null && !selectedMovie.isEmpty()) {
                int movieID = Integer.parseInt(selectedMovie);
                filteredShows = showService.getShowsByMovieID(movieID);
                request.setAttribute("selectedMovieID", movieID);
            }

            request.setAttribute("bookingList",    bookingList);
            request.setAttribute("scheduledShows", scheduledShows);
            request.setAttribute("movieList",      movieList);
            request.setAttribute("filteredShows",  filteredShows);

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "Abooking");
        request.getRequestDispatcher("/WEB-INF/pages/admin/BookingAdmin.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("book".equals(action)) {
            try {
                int showID = Integer.parseInt(request.getParameter("showID"));

                // Resolve userId from session (fall back to 1 for admin-side bookings)
                Integer userId = (Integer) request.getSession().getAttribute("userId");
                if (userId == null) userId = 1;

                bookingService.addBookingForShow(showID, userId, 0.0);

            } catch (Exception e) {
                System.out.println("BookingServlet: error in book action");
                e.printStackTrace();
            }

        } else if ("updateStatus".equals(action)) {
            try {
                int    bookingID = Integer.parseInt(request.getParameter("bookingID"));
                String status    = request.getParameter("bookingStatus");
                bookingService.updateBookingStatus(bookingID, status);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if ("delete".equals(action)) {
            try {
                int bookingID = Integer.parseInt(request.getParameter("bookingID"));
                bookingService.deleteBooking(bookingID);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/Abooking");
    }
}