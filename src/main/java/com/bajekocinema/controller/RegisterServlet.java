package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;

import java.io.IOException;

import com.bajekocinema.services.RegisterService;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/auth/Register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String Username = request.getParameter("Username");
			String UserPhoneNumber = request.getParameter("UserPhoneNumber");
			String UserEmail = request.getParameter("UserEmail");
			String Password = request.getParameter("Password");
			Part filePart = request.getPart("Image");
			String fileName = (filePart != null)? filePart.getSubmittedFileName(): null;
			
			String Image;
			if(fileName !=null && !fileName.isEmpty()) {
				Image = "resources/images/" + fileName;
			} else {
				Image = "resources/images/default.png";
			}
			// Phone number validation
		    if (UserPhoneNumber == null || !UserPhoneNumber.matches("\\d{10}")) // '\\d': 0-9 digits '{10}': 10 digits length
		    {
		        request.setAttribute("error", "Phone number must be exactly 10 digits");
		        request.getRequestDispatcher("/WEB-INF/pages/auth/Register.jsp").forward(request, response);
		        return;
		    }
			
			RegisterService service = new RegisterService();
			service.addUser(Username,UserPhoneNumber,UserEmail,Password,Image);
			
			// Redirect to login page
            response.sendRedirect(request.getContextPath() + "/login?success=registered");
			
		} catch (Exception e) {
			e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
		}
	}

}
