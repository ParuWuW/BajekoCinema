package com.bajekocinema.services;

import com.bajekocinema.dao.UserAdminDAO;
import com.bajekocinema.model.UserAdminModel;
import java.util.List;

public class UserAdminService {
    private UserAdminDAO userAdminDAO = new UserAdminDAO();

    public List<UserAdminModel> getAllUsers() throws Exception {
        return userAdminDAO.getAllUsers();
    }

    
    public boolean updateVerifiedStatus(int userID, boolean isVerified) throws Exception {
        return userAdminDAO.updateVerifiedStatus(userID, isVerified);
    }
}