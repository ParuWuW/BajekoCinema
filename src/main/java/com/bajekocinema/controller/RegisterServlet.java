package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;

import java.io.IOException;
import java.sql.SQLException;

import com.bajekocinema.services.RegisterService;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RegisterService userService = new RegisterService();
       
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
		request.getRequestDispatcher("WEB-INF/pages/Register.jsp").forward(request, response);
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
			if (fileName != null && !fileName.isEmpty()) {
	            // Build save path on disk
	            String uploadDir = getServletContext().getRealPath("/") + "resources" + java.io.File.separator + "images" + java.io.File.separator;
	            java.io.File uploadFolder = new java.io.File(uploadDir);
	            if (!uploadFolder.exists()) uploadFolder.mkdirs();

	            // Save file to folder
	            filePart.write(uploadDir + fileName);
	            Image = "resources/images/" + fileName;
	        } else {
	            Image = "resources/images/default.png";
	        }
			// Phone number validation
		    if (UserPhoneNumber == null || !UserPhoneNumber.matches("\\d{10}")) // '\\d': 0-9 digits '{10}': 10 digits length
		    {
		        request.setAttribute("error", "Phone number must be exactly 10 digits with digits 0-9");
		        request.getRequestDispatcher("/WEB-INF/pages/Register.jsp").forward(request, response);
		        return;
		    }
		    
		    try {
	            if (userService.isEmailAlreadyRegistered(UserEmail)) {
	                request.setAttribute("error", "This email is already registered");
	                request.getRequestDispatcher("/WEB-INF/pages/Register.jsp").forward(request, response);
	                return;
	            }

	            response.sendRedirect(request.getContextPath() + "/login");

	        } catch (SQLException e) {
	            request.setAttribute("error", "Database error. Please try again."+ e.getMessage());
	            request.getRequestDispatcher("/WEB-INF/pages/Register.jsp").forward(request, response);
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
