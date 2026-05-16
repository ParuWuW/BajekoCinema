package com.bajekocinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.bajekocinema.model.SessionModel;
import com.bajekocinema.utils.DBconfig;

public class SessionDAO {


	// existing session of user
	public SessionModel findByUserId(int userId) throws SQLException {
		String sql = "SELECT * FROM Sessions WHERE user_id = ? LIMIT 1";
		try (Connection conn = DBconfig.getConnection();
				PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				SessionModel s = new SessionModel();
				s.setSession_id(rs.getString("session_id"));
				s.setUser_id(rs.getInt("user_id"));
				s.setExpires_at(rs.getTimestamp("expires_at"));
				s.setIs_active(rs.getBoolean("is_active"));
				return s;
			}
		}
		return null;
	}

	// Revive old session update expiry date and mark is_active active
	public void reviveSession(String sessionId, Timestamp newExpiry) throws SQLException {
		String sql = "UPDATE Sessions SET is_active = 1, expires_at = ? WHERE session_id = ?";
		try (Connection conn = DBconfig.getConnection();
				PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setTimestamp(1, newExpiry);
			pst.setString(2, sessionId);
			pst.executeUpdate();
		}
	}

	// create new session
	public void createSession(SessionModel session) throws SQLException {
		String sql = "INSERT INTO Sessions (session_id, user_id, expires_at) VALUES (?, ?, ?)";
		try (Connection conn = DBconfig.getConnection();
				PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setString(1, session.getSession_id());
			pst.setInt(2, session.getUser_id());
			pst.setTimestamp(3, session.getExpires_at());
			pst.executeUpdate();
		}
	}

	// make inactive session on logout, lives in database to revive
	public void deactivateSession(String sessionId) throws SQLException {
		String sql = "UPDATE Sessions SET is_active = 0 WHERE session_id = ?";
		try (Connection conn = DBconfig.getConnection();
				PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setString(1, sessionId);
			pst.executeUpdate();
		}
	}

	// Validate a session_id coming from cookie
	public SessionModel validateSession(String sessionId) throws SQLException {
		String sql = "SELECT s.session_id, s.user_id, s.is_active, u.role"
				+ " FROM Sessions s JOIN `User` u ON s.user_id = u.userID"
				+ " where s.session_id = ? and s.is_active = 1 and s.expires_at > NOW()";
		try (Connection conn = DBconfig.getConnection();
				PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setString(1, sessionId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				SessionModel s = new SessionModel();
				s.setSession_id(rs.getString("session_id"));
				s.setUser_id(rs.getInt("user_id"));
				s.setIs_active(true);
				s.setRole(rs.getString("role"));
				return s;
			}
		}
		return null;
	}
}


