package com.bajekocinema.services;

import java.security.SecureRandom;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HexFormat;

import com.bajekocinema.dao.SessionDAO;
import com.bajekocinema.model.SessionModel;

public class SessionService {
	private final SessionDAO sessionDAO = new SessionDAO();

    public static final int SESSION_MINUTES = 1440; // single source of truth

    // Called after successful login — revives or creates session
    public String loginUser(int userId) throws SQLException {
        SessionModel existing = sessionDAO.findByUserId(userId);
        Timestamp newExpiry  = new Timestamp(
                System.currentTimeMillis() + SESSION_MINUTES * 60000L); 

        if (existing != null) {
            sessionDAO.reviveSession(existing.getSession_id(), newExpiry);
            return existing.getSession_id();
        } else {
            String sessionId     = generateSessionId();
            SessionModel newSession = new SessionModel();
            newSession.setSession_id(sessionId);
            newSession.setUser_id(userId);
            newSession.setExpires_at(newExpiry);
            newSession.setIs_active(true);
            sessionDAO.createSession(newSession);
            return sessionId;
        }
    }

    // Validate cookie on every request
    public SessionModel validateSession(String sessionId) throws SQLException {
        if (sessionId == null || sessionId.isEmpty()) return null;
        return sessionDAO.validateSession(sessionId);
    }

    // Called on logout
    public void logoutUser(String sessionId) throws SQLException {
        if (sessionId != null) {
            sessionDAO.deactivateSession(sessionId);
        }
    }
    // generating session id 
    private String generateSessionId() {
        byte[] bytes = new byte[32];
        new SecureRandom().nextBytes(bytes);
        return HexFormat.of().formatHex(bytes); 
    }

}
