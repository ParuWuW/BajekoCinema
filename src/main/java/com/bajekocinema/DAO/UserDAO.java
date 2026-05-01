package com.bajekocinema.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bajekocinema.Utils.DBconfig;
import com.bajekocinema.model.UserModel;

public class UserDAO {
	
	public void insertUser(String Username, String UserPhoneNumber, String UserEmail, String Password, String Image) throws Exception {
		Connection con = DBconfig.getConnection();
		
		String sql = "INSERT INTO user (Username, UserPhoneNumber, UserEmail, Password, Image)" + "VALUES (?,?,?,?,?,)";
		
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, Username);
        pst.setString(2, UserPhoneNumber);
        pst.setString(3, UserEmail);
        pst.setString(4, Password);
        pst.setString(5, Image);
        
        pst.executeUpdate();
        pst.close();
        con.close();

	}
	public List<UserModel> getAllUsers() throws Exception {
		List<UserModel> users = new ArrayList<>();
		Connection con = DBconfig.getConnection();
		
		String sql = "SELECT * FROM user";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			UserModel s = new UserModel();
			s.setUsername(rs.getString("Username"));
			s.setUserPhoneNumber(rs.getString("UserPhoneNumber"));
			s.setUserEmail(rs.getString("UserEmail"));
			s.setPassword(rs.getString("Password"));
			s.setImage(rs.getString("Image"));
			users.add(s);
		}
		rs.close();
		pst.close();
		con.close();
		return users;
	}

}
