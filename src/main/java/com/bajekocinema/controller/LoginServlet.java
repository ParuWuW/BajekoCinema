package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bajekocinema.model.UserModel;
import com.bajekocinema.services.LoginService;
import com.bajekocinema.utils.CookieUtil;
import com.bajekocinema.utils.SessionUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private LoginService loginService = new LoginService();
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/auth/Login.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String UserEmail = request.getParameter("UserEmail");
        String Password = request.getParameter("Password");

        // validation
        if (UserEmail == null || Password == null || UserEmail.isEmpty() || Password.isEmpty()) {
        	request.setAttribute("error", "Email and Password are required");
        	request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
            return;
        }

        UserModel user = new UserModel();
        user.setEmail(UserEmail.trim());
        user.setPassword(Password.trim());

        Boolean status = loginService.loginUser(user);

        if (Boolean.TRUE.equals(status)) {

            // SESSION
            SessionUtil.setAttribute(request, "UserEmail", UserEmail);

            // cookie and redirection
            if ("admin".equalsIgnoreCase(UserEmail)) {
                CookieUtil.addCookie(response, "role", "admin", 60 * 60);
                response.sendRedirect(request.getContextPath() + "/dashboard");
            } else {
                CookieUtil.addCookie(response, "role", "user", 60 * 60);
                response.sendRedirect(request.getContextPath() + "/home");
            }

        } else {
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("/WEB-INF/pages/Login.jsp").forward(request, response);
        }
	}

}
