package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.bajekocinema.model.BookingModel;
import com.bajekocinema.services.PreviousBookingService;

/**
 * Servlet implementation class PreviousBookingServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/previousBooking" })
public class PreviousBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreviousBookingService previousBookingService = new PreviousBookingService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreviousBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer userId = (Integer) request.getAttribute("LoggedInUserId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<BookingModel> bookings = previousBookingService.getPreviousBookings(userId);
        request.setAttribute("previousBookings", bookings);

        request.getRequestDispatcher("/WEB-INF/pages/user/PreviousBooking.jsp")
               .forward(request, response);
    
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
