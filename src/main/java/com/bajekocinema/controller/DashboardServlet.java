package com.bajekocinema.controller;

import com.bajekocinema.dao.BookingDAO;
import com.bajekocinema.dao.MovieDAO;
import com.bajekocinema.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * DashboardServlet — loads stat cards from the new bajekocinema-2.sql schema.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/dashboard" })
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private BookingDAO bookingDAO = new BookingDAO();
    private MovieDAO   movieDAO   = new MovieDAO();
    private UserDAO    userDAO    = new UserDAO();

    public DashboardServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── stat cards ────────────────────────────────────────────────────────
        try {
            request.setAttribute("totalBookings",  bookingDAO.getTotalBookings());
            request.setAttribute("totalRevenue",   bookingDAO.getTotalRevenue());
            request.setAttribute("activeMovies",   movieDAO.getMoviesByStatus("now_showing").size());
            request.setAttribute("registeredUsers",userDAO.getAllUsers().size());
        } catch (Exception e) {
            e.printStackTrace();
            // set zeros so EL expressions don't throw NPE
            request.setAttribute("totalBookings",  0);
            request.setAttribute("totalRevenue",   0.0);
            request.setAttribute("activeMovies",   0);
            request.setAttribute("registeredUsers",0);
        }

        request.setAttribute("currentPage", "dashboard");
        request.getRequestDispatcher("/WEB-INF/pages/admin/AdminDashboard.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
