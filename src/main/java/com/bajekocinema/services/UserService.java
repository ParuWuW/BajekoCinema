package com.bajekocinema.services;

import com.bajekocinema.dao.UserDAO;
import com.bajekocinema.model.UserModel;
import java.util.List;

public class UserService {
    private UserDAO userDAO = new UserDAO();

    public List<UserModel> getAllUsers() throws Exception {
        return userDAO.getAllUsers();
    }
}