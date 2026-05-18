package com.bajekocinema.services;

import com.bajekocinema.dao.UserDAO;
import com.bajekocinema.model.UserModel;

public class UserProfileService {
private UserDAO dao = new UserDAO();
	
	public UserModel getUserProfileByEmail(String UserEmail) throws Exception {
		return dao.getUserProfileByEmail(UserEmail);
	}

}
