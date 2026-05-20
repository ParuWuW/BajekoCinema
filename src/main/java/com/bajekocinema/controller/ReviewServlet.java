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
    	/*DEBUG: System.out.println("=== ReviewServlet hit ===");
    	System.out.println("request user attr: " + request.getAttribute("loggedInUser"));
    	System.out.println("session user attr: " + 
    	    (request.getSession(false) != null ? request.getSession(false).getAttribute("loggedInUser") : "NO SESSION"));*/

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
            response.sendRedirect(request.getContextPath() + "/home");
            return;
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