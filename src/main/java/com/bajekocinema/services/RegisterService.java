package com.bajekocinema.services;

import com.bajekocinema.dao.UserDAO;
import com.bajekocinema.utils.PasswordUtil;

public class RegisterService {
	 public void addUser(String Username, int UserPhoneNumber, String UserEmail, String Password, String Image) throws Exception {
		 
		 Password = PasswordUtil.getHashPassword(Password);
		 
		 UserDAO dao = new UserDAO();
		 dao.insertUser(Username, UserPhoneNumber, UserEmail, Password, Image);
	
		 
	 }

}
