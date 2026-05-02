package com.bajekocinema.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bajekocinema.model.UserModel;
import com.bajekocinema.utils.DBconfig;
import com.bajekocinema.utils.PasswordUtil;


public class LoginService {
	public Boolean loginUser(UserModel userModel) {
		
	    String query = "SELECT UserEmail, Password FROM student WHERE UserEmail = ?";
	    
	    try (Connection conn = DBconfig.getConnection();
	    		PreparedStatement stat = conn.prepareStatement(query)) {
	    	
	    	stat.setString(1, userModel.getUserEmail());
	    	ResultSet rs = stat.executeQuery();
	    	
	    	if (rs.next()) {
                String dbPassword = rs.getString("password");

                return PasswordUtil.checkPassword(
                        userModel.getPassword(),
                        dbPassword
                );
            }
	    	
	    } catch (Exception e) {
            e.printStackTrace();
            return null;
	    }
	    
	    return false;
	}
	


}
