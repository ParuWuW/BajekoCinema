package com.bajekocinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bajekocinema.model.UserAdminModel;
import com.bajekocinema.utils.DBconfig;

/**
 * Admin Data Access Object for managing users.
 *
 * @author bajekocinema
 */
public class UserAdminDAO {

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

    public List<UserAdminModel> getAllUsers() throws Exception {
        List<UserAdminModel> users = new ArrayList<>();
        Connection con = DBconfig.getConnection();

        String sql = "SELECT * FROM `User`";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            UserAdminModel s = new UserAdminModel();
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

    // Used by LoginService
    public UserAdminModel getUserByEmail(String email) throws Exception {
        Connection con = DBconfig.getConnection();
        String sql = "SELECT * FROM `User` WHERE email = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, email);
        ResultSet rs = pst.executeQuery();

        UserAdminModel user = null;
        if (rs.next()) {
            user = new UserAdminModel();
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

    public UserAdminModel getUserProfileByEmail(String email) throws Exception {
        return getUserByEmail(email);
    }

    public UserAdminModel getUserById(int userId) throws Exception {
        Connection conn = DBconfig.getConnection();
        String sql = "SELECT * FROM `User` WHERE userID = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, userId);
        ResultSet rs = pst.executeQuery();

        UserAdminModel user = null;
        if (rs.next()) {
            user = new UserAdminModel();
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
        Connection conn = DBconfig.getConnection();
        String sql;
        if (password != null && !password.isEmpty()) {
            sql = "UPDATE `User` SET fullName=?, email=?, phone=?, image=?, password=? WHERE userID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, fullName);
            pst.setString(2, email);
            pst.setString(3, phone);
            pst.setString(4, image);
            pst.setString(5, password);
            pst.setInt(6, userId);
            pst.executeUpdate();
            pst.close();
        } else {
            sql = "UPDATE `User` SET fullName=?, email=?, phone=?, image=? WHERE userID=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, fullName);
            pst.setString(2, email);
            pst.setString(3, phone);
            pst.setString(4, image);
            pst.setInt(5, userId);
            pst.executeUpdate();
            pst.close();
        }
        conn.close();
    }

    public boolean deleteUser(int userId) throws Exception {
        Connection conn = DBconfig.getConnection();
        String sql = "DELETE FROM `User` WHERE userID = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setInt(1, userId);
        pst.executeUpdate();
        pst.close();
        conn.close();
        return true;
    }

    // Used by UsersServlet to toggle verification status
    public boolean updateVerifiedStatus(int userID, boolean isVerified) throws Exception {
        Connection conn = DBconfig.getConnection();
        String sql = "UPDATE `User` SET isVerified = ? WHERE userID = ?";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setBoolean(1, isVerified);
        pst.setInt(2, userID);
        int rows = pst.executeUpdate();
        pst.close();
        conn.close();
        return rows > 0;
    }
}