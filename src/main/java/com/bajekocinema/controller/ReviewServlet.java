package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bajekocinema.dao.SeatBookingDAO.BookingSummary;
import com.bajekocinema.model.UserModel;
import com.bajekocinema.services.SeatBookingService;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/review" })
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final long BOOKING_EXPIRY_MS = 5 * 60 * 1000L; // 5 minutes
    private SeatBookingService bookingService = new SeatBookingService();

    public ReviewServlet() {
        super();
    }
    
    /**
     * If the booking is still pending and 5 minutes have elapsed since creation,
     * cancel it (booking + ticket). Returns true if the booking was auto-cancelled.
     */
    private boolean checkAndExpireBooking(HttpServletRequest request, BookingSummary summary) {
        if (summary == null) return false;
        if (!"pending".equalsIgnoreCase(summary.status)) return false;

        Long createdAt = (Long) request.getSession()
                .getAttribute("bookingCreatedAt_" + summary.bookingId);
        if (createdAt == null) return false;

        long elapsed = System.currentTimeMillis() - createdAt;
        if (elapsed >= BOOKING_EXPIRY_MS) {
            bookingService.cancelBooking(summary.bookingId);
            request.getSession().removeAttribute("bookingCreatedAt_" + summary.bookingId);
            summary.status = "cancelled"; // reflect in the in-memory summary
            return true;
        }
        return false;
    }    

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserModel user = (UserModel) request.getAttribute("LoggedInUser");
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
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        
     // Auto-cancel if 5 minutes elapsed since Buy Now
        boolean expired = checkAndExpireBooking(request, summary);
        if (expired) {
            request.setAttribute("expiredMessage",
                "This booking was automatically cancelled because the 5-minute payment window expired.");
        }

        // Explode all fields into individual request attributes for JSP EL
        request.setAttribute("bookingId",    summary.bookingId);
        request.setAttribute("userId",       summary.userId);
        request.setAttribute("userName",     summary.userName);
        request.setAttribute("movieTitle",   summary.movieTitle);
        request.setAttribute("posterUrl",    summary.posterUrl);
        request.setAttribute("showDate",     summary.showDate);
        request.setAttribute("startTime",    summary.startTime);
        request.setAttribute("hallId",       summary.hallId);
        request.setAttribute("hallName",     summary.hallName);
        request.setAttribute("theatreId",    summary.theatreId);
        request.setAttribute("theatreName",  summary.theatreName);
        request.setAttribute("totalAmount",  summary.totalAmount);
        request.setAttribute("status",       summary.status);
        request.setAttribute("seats",        summary.seats);
        request.setAttribute("seatCount",    summary.seats != null ? summary.seats.size() : 0);

        request.getRequestDispatcher("/WEB-INF/pages/user/Review.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserModel user = (UserModel) request.getAttribute("LoggedInUser");
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

        // If 5 minutes elapsed, force-cancel regardless of which button was pressed
        if (checkAndExpireBooking(request, summary)) {
            response.sendRedirect(request.getContextPath() + "/previousBooking");
            return;
        }
        
        String action = request.getParameter("action");
        if ("confirm".equals(action)) {
            bookingService.confirmBooking(bookingId);
            request.getSession().removeAttribute("bookingCreatedAt_" + bookingId);
        } else if ("cancel".equals(action)) {
            bookingService.cancelBooking(bookingId);
            request.getSession().removeAttribute("bookingCreatedAt_" + bookingId);
        }

        // back to previous bookings after either action
        response.sendRedirect(request.getContextPath() + "/previousBooking");
    }
}