package com.bajekocinema.model;

import java.sql.Timestamp;

public class SessionModel {
	private String session_id;
    private int user_id;
    private String role;
    private Timestamp created_at;
    private Timestamp expires_at;
    private boolean is_active;
	/**
	 * @return the session_id
	 */
	public String getSession_id() {
		return session_id;
	}
	/**
	 * @param session_id the session_id to set
	 */
	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}
	/**
	 * @return the user_id
	 */
	public int getUser_id() {
		return user_id;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	/**
	 * @return the created_at
	 */
	public Timestamp getCreated_at() {
		return created_at;
	}
	/**
	 * @param created_at the created_at to set
	 */
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	/**
	 * @return the expires_at
	 */
	public Timestamp getExpires_at() {
		return expires_at;
	}
	/**
	 * @param expires_at the expires_at to set
	 */
	public void setExpires_at(Timestamp expires_at) {
		this.expires_at = expires_at;
	}
	/**
	 * @return the is_active
	 */
	public boolean isIs_active() {
		return is_active;
	}
	/**
	 * @param is_active the is_active to set
	 */
	public void setIs_active(boolean is_active) {
		this.is_active = is_active;
	}
	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}
	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}
	// In SessionModel.java
	@Override
	public String toString() {
	    return "SessionModel[id=" + session_id + ", userId=" + user_id + ", role=" + role + "]";
	}
}
