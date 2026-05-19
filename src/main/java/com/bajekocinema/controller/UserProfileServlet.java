package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import com.bajekocinema.model.UserModel;
import com.bajekocinema.services.UserService;
import com.bajekocinema.utils.ImageUtil;

/**
 * Servlet implementation class UserProfileServlet
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/userProfile" })
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,      // 1 MB — buffer in memory before writing to disk
	    maxFileSize       = 1024 * 1024 * 5,  // 5 MB max per file
	    maxRequestSize    = 1024 * 1024 * 10  // 10 MB max total request
	)
public class UserProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	
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
		 UserModel user = (UserModel) request.getAttribute("loggedInUser");
	        if (user == null) {
	            response.sendRedirect(request.getContextPath() + "/login");
	            return;
	        }

	        // Pick up success message from session and clear it immediately
	        String success = (String) request.getSession().getAttribute("successMessage");
	        if (success != null) {
	            request.setAttribute("successMessage", success);
	            request.getSession().removeAttribute("successMessage");
	        }

	        request.setAttribute("user", user);
	        request.getRequestDispatcher("/WEB-INF/pages/user/UserProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		UserModel currentUser = (UserModel) request.getAttribute("loggedInUser");
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String fullName = request.getParameter("fullName");
        String email    = request.getParameter("email");
        String phone    = request.getParameter("phone");
        String password = request.getParameter("password");

        if (password == null || password.trim().isEmpty()) {
            password = currentUser.getPassword();
        }

        String imagePath = currentUser.getImage();
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            ImageUtil imageUtil = new ImageUtil();
            String fileName = imageUtil.getImageNameFromPart(filePart);
            imageUtil.uploadImage(filePart, "resources/images", getServletContext());
            imagePath = "resources/images/" + fileName;
        }
        try {
            userService.updateUser(currentUser.getUserID(), fullName, email, phone, imagePath, password);
            // Store success in session so it survives the redirect
            request.getSession().setAttribute("successMessage", "Profile updated successfully!");
            response.sendRedirect(request.getContextPath() + "/userProfile");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("user", currentUser);
            request.setAttribute("errorMessage", "Error: " + e.getMessage()); // show real error
            request.setAttribute("showEdit", true);
            request.getRequestDispatcher("/WEB-INF/pages/user/UserProfile.jsp").forward(request, response);
        }
	}
}
    

