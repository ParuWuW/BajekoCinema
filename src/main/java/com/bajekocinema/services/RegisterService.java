package com.bajekocinema.services;

import java.sql.SQLException;

import com.bajekocinema.dao.UserDAO;
import com.bajekocinema.utils.PasswordUtil;

public class RegisterService {
	UserDAO dao = new UserDAO();
	 public void addUser(String Username, String UserPhoneNumber, String UserEmail, String Password, String Image) throws Exception {
		 
		 Password = PasswordUtil.getHashPassword(Password);
		 
		 
		 dao.insertUser(Username, UserPhoneNumber, UserEmail, Password, Image);
	
		 
	 }

	 public boolean isEmailAlreadyRegistered(String UserEmail) 
		 throws SQLException {
		        return dao.isEmailExists(UserEmail);
	 }

}
