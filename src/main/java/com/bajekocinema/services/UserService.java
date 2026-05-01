package com.bajekocinema.services;

import com.bajekocinema.DAO.UserDAO;
import com.bajekocinema.Utils.PasswordUtil;

public class UserService {
	
	public void addUser(String Username, String UserPhoneNumber, String UserEmail, String Password, String Image) throws Exception{
		
		Password = PasswordUtil.getHashPassword(Password);
		
		UserDAO dao = new UserDAO();
		dao.insertUser(Username, UserPhoneNumber, UserEmail, Password, Image);
		
	}

}
