package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.bajekocinema.model.UserAdminModel;
import com.bajekocinema.services.UserAdminService;

/**
 * Handles user management operations in the admin dashboard.
 *
 * @author bajekocinema
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/admin/users"})
public class UsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserAdminService userService = new UserAdminService();

    public UsersServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<UserAdminModel> userList = userService.getAllUsers();
            request.setAttribute("userList", userList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("currentPage", "users");
        request.getRequestDispatcher("/WEB-INF/pages/admin/UsersAdmin.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Handle isVerified toggle from the admin panel checkbox
        if ("updateVerified".equals(action)) {
            try {
                int userID = Integer.parseInt(request.getParameter("userID"));
                boolean isVerified = "on".equals(request.getParameter("isVerified"));
                userService.updateVerifiedStatus(userID, isVerified);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        doGet(request, response);
    }
}