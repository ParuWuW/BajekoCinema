package com.bajekocinema.services;

import com.bajekocinema.dao.UserDAO;
import com.bajekocinema.model.UserModel;

import com.bajekocinema.utils.PasswordUtil;


public class LoginService {
    private UserDAO userDAO = new UserDAO();

	public Boolean loginUser(UserModel userModel) {
			    
	    try {
            UserModel dbUser = userDAO.getUserByEmail(userModel.getEmail());

            if (dbUser == null) return false; // email not found
            if (!dbUser.isVerified()) return false;
            return PasswordUtil.checkPassword(userModel.getPassword(), dbUser.getPassword());

        } catch (Exception e) {
            e.printStackTrace();
            return null;
	    }
	    
	   
	}
	


}
