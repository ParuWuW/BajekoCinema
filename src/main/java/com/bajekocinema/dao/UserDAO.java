package com.bajekocinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bajekocinema.model.UserModel;
import com.bajekocinema.utils.DBconfig;

public class UserDAO {

    public void insertUser(String Username, int userPhoneNumber, String UserEmail, String Password, String Image) throws Exception {
        Connection con = DBconfig.getConnection();

        String sql = "INSERT INTO user (Username, UserPhoneNumber, UserEmail, Password, Image)" + "VALUES (?,?,?,?,?)";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, Username);
        pst.setInt(2, userPhoneNumber);
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

        while (rs.next()) {
            UserModel s = new UserModel();
            s.setUserID(rs.getInt("UserID")); // ADDED
            s.setUsername(rs.getString("Username"));
            s.setUserPhoneNumber(rs.getInt("UserPhoneNumber"));
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

    // ADDED - used by LoginService
    public UserModel getUserByEmail(String email) throws Exception {
        Connection con = DBconfig.getConnection();
        String sql = "SELECT * FROM user WHERE UserEmail = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, email);
        ResultSet rs = pst.executeQuery();

        UserModel user = null;
        if (rs.next()) {
            user = new UserModel();
            user.setUserID(rs.getInt("UserID"));
            user.setUsername(rs.getString("Username"));
            user.setUserEmail(rs.getString("UserEmail"));
            user.setUserPhoneNumber(rs.getInt("UserPhoneNumber"));
            user.setPassword(rs.getString("Password"));
            user.setImage(rs.getString("Image"));
        }
        rs.close();
        pst.close();
        con.close();
        return user;
    }

    // ADDED - used by UserProfileService
    public UserModel getUserProfileByEmail(String email) throws Exception {
        return getUserByEmail(email);
    }
}