package com.bajekocinema.controller;

import com.bajekocinema.model.BookingAdminModel;
import com.bajekocinema.model.ShowAdminModel;
import com.bajekocinema.model.MovieAdminModel;
import com.bajekocinema.services.BookingAdminService;
import com.bajekocinema.services.ShowAdminService;
import com.bajekocinema.services.MovieAdminService;
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

    private BookingAdminService bookingAdminService = new BookingAdminService();
    private ShowAdminService    showAdminService    = new ShowAdminService();
    private MovieAdminService   movieAdminService   = new MovieAdminService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<BookingAdminModel> bookingList     = bookingAdminService.getAllBookings();
            List<ShowAdminModel>    scheduledShows  = showAdminService.getScheduledShows();
            List<MovieAdminModel>   movieList       = movieAdminService.getAllMovies();

            // Step-1 filter: admin selects a movie to see its shows
            String selectedMovie = request.getParameter("selectedMovieID");
            List<ShowAdminModel> filteredShows = null;
            if (selectedMovie != null && !selectedMovie.isEmpty()) {
                int movieID = Integer.parseInt(selectedMovie);
                filteredShows = showAdminService.getShowsByMovieID(movieID);
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

                bookingAdminService.addBookingForShow(showID, userId, 0.0);

            } catch (Exception e) {
                System.out.println("BookingServlet: error in book action");
                e.printStackTrace();
            }

        } else if ("updateStatus".equals(action)) {
            try {
                int    bookingID = Integer.parseInt(request.getParameter("bookingID"));
                String status    = request.getParameter("bookingStatus");
                bookingAdminService.updateBookingStatus(bookingID, status);
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if ("delete".equals(action)) {
            try {
                int bookingID = Integer.parseInt(request.getParameter("bookingID"));
                bookingAdminService.deleteBooking(bookingID);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(request.getContextPath() + "/Abooking");
    }
}