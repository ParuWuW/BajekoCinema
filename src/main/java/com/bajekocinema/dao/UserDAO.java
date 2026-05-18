package com.bajekocinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bajekocinema.model.UserModel;
import com.bajekocinema.utils.DBconfig;

public class UserDAO {

	public void insertUser(String Username, String userPhoneNumber, String UserEmail, String Password, String Image) throws Exception {
		Connection con = DBconfig.getConnection();

		String sql = "INSERT INTO `User` (fullName, email, phone, password, isVerified, role, image) " + "VALUES (?,?,?,?,True,'user',?)";

		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, Username);
		pst.setString(2, UserEmail);
		pst.setString(3, userPhoneNumber);
		pst.setString(4, Password);
		pst.setString(5, Image);

		pst.executeUpdate();
		pst.close();
		con.close();
	}

	public List<UserModel> getAllUsers() throws Exception {
		List<UserModel> users = new ArrayList<>();
		Connection con = DBconfig.getConnection();

		String sql = "SELECT * FROM `User`";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
			UserModel s = new UserModel();
			s.setUserID(rs.getInt("userID"));
			s.setFullName(rs.getString("fullName"));
			s.setPhone(rs.getString("phone"));
			s.setEmail(rs.getString("email"));
			s.setRole(rs.getString("role"));
			s.setVerified(rs.getBoolean("isVerified"));
			s.setPassword(rs.getString("password"));
			s.setImage(rs.getString("image"));
			users.add(s);
		}
		rs.close();
		pst.close();
		con.close();
		return users;
	}

	// ADDED - used by LoginService
	public UserModel getUserByEmail(String email) throws Exception {
		Connection con = DBconfig.getConnection();
		String sql = "SELECT * FROM `User` WHERE email = ?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();

		UserModel user = null;
		if (rs.next()) {
			user = new UserModel();
			user.setUserID(rs.getInt("userID"));
			user.setFullName(rs.getString("fullName"));
			user.setPhone(rs.getString("phone"));
			user.setEmail(rs.getString("email"));
			user.setRole(rs.getString("role"));
			user.setVerified(rs.getBoolean("isVerified"));
			user.setPassword(rs.getString("password"));
			user.setImage(rs.getString("image"));
		}
		rs.close();
		pst.close();
		con.close();
		return user;
	}


	public UserModel getUserProfileByEmail(String email) throws Exception {
		return getUserByEmail(email);
	}

	public UserModel getUserById(int userId) throws Exception {
		// TODO Auto-generated method stub
		Connection conn = DBconfig.getConnection();
		String sql = "SELECT * FROM `User` WHERE userID = ?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, userId);
		ResultSet rs = pst.executeQuery();

		UserModel user = null;
		if (rs.next()) {
			user = new UserModel();
			user.setUserID(rs.getInt("userID"));
			user.setFullName(rs.getString("fullName"));
			user.setPhone(rs.getString("phone"));
			user.setEmail(rs.getString("email"));
			user.setRole(rs.getString("role"));
			user.setVerified(rs.getBoolean("isVerified"));
			user.setPassword(rs.getString("password"));
			user.setImage(rs.getString("image"));
		}
		rs.close();
		pst.close();
		conn.close();
		return user;
	}


	public void updateUser(int userId, String fullName, String email,
			String phone, String image, String password) throws Exception {

		Connection con = DBconfig.getConnection();
		String sql = "UPDATE `User` SET fullName=?, email=?, phone=?, image=?, password=? WHERE userID=?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, fullName);
		pst.setString(2, email);
		pst.setString(3, phone);
		pst.setString(4, image);
		pst.setString(5, password);
		pst.setInt(6, userId);
		pst.executeUpdate();
		pst.close();
		con.close();
	}
}