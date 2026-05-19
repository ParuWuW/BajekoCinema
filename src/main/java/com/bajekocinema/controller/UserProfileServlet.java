package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bajekocinema.model.UserModel;

/**
 * Servlet implementation class UserProfileServlet
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/userProfile" })
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserModel loggedInUser = (UserModel) request.getAttribute("loggedInUser");
		System.out.println("loggedInUser from session: " + loggedInUser);
		if (loggedInUser == null) {
	        response.sendRedirect(request.getContextPath() + "/login");
	        return;
	    }
	    try {
	        
	        request.setAttribute("user", loggedInUser);
	        request.getRequestDispatcher("/WEB-INF/pages/user/UserProfile.jsp").forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
