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

@WebServlet(asyncSupported = true, urlPatterns = { "/admin/booking" })
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BookingService bookingService = new BookingService();
    private ShowService showService = new ShowService();
    private MovieService movieService = new MovieService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<BookingModel> bookingList = bookingService.getAllBookings();
            List<ShowModel> scheduledShows = showService.getScheduledShows();
            List<MovieModel> movieList = movieService.getAllMovies();

            String selectedMovie = request.getParameter("selectedMovieID");
            List<ShowModel> filteredShows = null;
            if (selectedMovie != null && !selectedMovie.isEmpty()) {
                int movieID = Integer.parseInt(selectedMovie);
                filteredShows = showService.getShowsByMovieID(movieID);
                request.setAttribute("selectedMovieID", movieID);
            }

            request.setAttribute("bookingList", bookingList);
            request.setAttribute("scheduledShows", scheduledShows);
            request.setAttribute("movieList", movieList);
            request.setAttribute("filteredShows", filteredShows);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "Abooking");
        request.getRequestDispatcher("/WEB-INF/pages/admin/BookingAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("book".equals(action)) {
            try {
                int showID = Integer.parseInt(request.getParameter("showID"));
                ShowModel show = showService.getShowByID(showID);
                int movieID = show.getMovieID();
                int hallID = show.getHallID();
                bookingService.addBookingForShow(showID, movieID, hallID);
            } catch (Exception e) {
                System.out.println("Error in book action");
                e.printStackTrace();
            }
        } else if ("updateStatus".equals(action)) {
            try {
                int bookingID = Integer.parseInt(request.getParameter("bookingID"));
                String status = request.getParameter("bookingStatus");
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