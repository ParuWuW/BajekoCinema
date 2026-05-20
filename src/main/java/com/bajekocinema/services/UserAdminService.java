package com.bajekocinema.services;

import com.bajekocinema.dao.UserAdminDAO;
import com.bajekocinema.model.UserAdminModel;
import java.util.List;

public class UserAdminService {
    private UserAdminDAO userAdminDAO = new UserAdminDAO();

    public List<UserAdminModel> getAllUsers() throws Exception {
        return userAdminDAO.getAllUsers();
    }

    // ADDED - used by UsersServlet to toggle isVerified from admin panel
    public boolean updateVerifiedStatus(int userID, boolean isVerified) throws Exception {
        return userAdminDAO.updateVerifiedStatus(userID, isVerified);
    }
}