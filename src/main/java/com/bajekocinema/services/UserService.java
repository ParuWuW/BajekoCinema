package com.bajekocinema.services;

import com.bajekocinema.dao.UserDAO;
import com.bajekocinema.model.UserModel;
import java.util.List;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public List<UserModel> getAllUsers() throws Exception {
        return userDAO.getAllUsers();
    }

    // ADDED - used by UsersServlet to toggle isVerified from admin panel
    public boolean updateVerifiedStatus(int userID, boolean isVerified) throws Exception {
        return userDAO.updateVerifiedStatus(userID, isVerified);
    }
}