package com.bajekocinema.controller;

import com.bajekocinema.dao.BookingAdminDAO;
import com.bajekocinema.dao.MovieAdminDAO;
import com.bajekocinema.dao.UserAdminDAO;
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

    private BookingAdminDAO bookingAdminDAO = new BookingAdminDAO();
    private MovieAdminDAO   movieAdminDAO   = new MovieAdminDAO();
    private UserAdminDAO    userAdminDAO    = new UserAdminDAO();

    public DashboardServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── stat cards ────────────────────────────────────────────────────────
        try {
            request.setAttribute("totalBookings",  bookingAdminDAO.getTotalBookings());
            request.setAttribute("totalRevenue",   bookingAdminDAO.getTotalRevenue());
            request.setAttribute("activeMovies",   movieAdminDAO.getMoviesByStatus("now_showing").size());
            request.setAttribute("registeredUsers",userAdminDAO.getAllUsers().size());
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
