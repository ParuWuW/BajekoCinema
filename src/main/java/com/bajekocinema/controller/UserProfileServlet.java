package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bajekocinema.model.UserModel;
import com.bajekocinema.services.UserProfileService;
import com.bajekocinema.utils.SessionUtil;

/**
 * Servlet implementation class UserProfileServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/userprofile" })
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private UserProfileService userProfileService = new UserProfileService();

       
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
		String email = (String) SessionUtil.getAttribute(request, "UserEmail");
		System.out.println("Email from session: " + email); //to see if session is getting email

	    if (email == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }

	    try {
	        UserModel user = userProfileService.getUserProfileByEmail(email);
	        
	        System.out.println("Username: " + user.getUsername());
	        System.out.println("Email: " + user.getUserEmail());
	        System.out.println("Phone: " + user.getUserPhoneNumber());
	        System.out.println("Image: " + user.getImage());
	        
	        request.setAttribute("user", user);
	        request.getRequestDispatcher("WEB-INF/pages/UserProfile.jsp").forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
