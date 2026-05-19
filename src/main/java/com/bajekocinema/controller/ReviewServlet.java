package com.bajekocinema.controller;

import com.bajekocinema.dao.SeatBookingDAO.BookingSummary;
import com.bajekocinema.model.UserModel;
import com.bajekocinema.services.SeatBookingService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/review" })
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private SeatBookingService bookingService = new SeatBookingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserModel user = (UserModel) request.getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int bookingId;
        try { bookingId = Integer.parseInt(request.getParameter("bookingId")); }
        catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        BookingSummary summary = bookingService.getBookingSummary(bookingId);
        if (summary == null || summary.userId != user.getUserID()) {
            // not yours — boot
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        request.setAttribute("summary", summary);
        request.getRequestDispatcher("/WEB-INF/pages/user/Review.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserModel user = (UserModel) request.getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int bookingId;
        try { bookingId = Integer.parseInt(request.getParameter("bookingId")); }
        catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        // verify ownership
        BookingSummary summary = bookingService.getBookingSummary(bookingId);
        if (summary == null || summary.userId != user.getUserID()) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        String action = request.getParameter("action");
        if ("confirm".equals(action)) {
            bookingService.confirmBooking(bookingId);
        } else if ("cancel".equals(action)) {
            bookingService.cancelBooking(bookingId);
        }

        // back to home after either action (simple flow)
        response.sendRedirect(request.getContextPath() + "/previousBooking");
    }
}