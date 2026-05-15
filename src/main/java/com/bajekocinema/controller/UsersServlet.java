package com.bajekocinema.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.bajekocinema.model.UserModel;
import com.bajekocinema.services.UserService; // CHANGED

/**
 * Servlet implementation class UsersServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/user"})
public class UsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserService userService = new UserService(); // CHANGED

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            List<UserModel> userList = userService.getAllUsers(); // CHANGED
            request.setAttribute("userList", userList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("currentPage", "users");
        request.getRequestDispatcher("WEB-INF/pages/admin/UsersAdmin.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}