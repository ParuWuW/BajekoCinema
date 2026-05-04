package com.bajekocinema.model;

public class UserModel {

	private int UserID; // ADDED
	private String Username;
	private int UserPhoneNumber;
	private String UserEmail;
	private String Password;
	private String Image;

	/**
	 * @return the userID
	 */
	public int getUserID() { // ADDED
		return UserID;
	}
	/**
	 * @param userID the userID to set
	 */
	public void setUserID(int userID) { // ADDED
		UserID = userID;
	}
	/**
	 * @return the __username__
	 */
	public String getUsername() {
		return Username;
	}
	/**
	 * @param username the __username__ to set
	 */
	public void setUsername(String username) {
		Username = username;
	}
	/**
	 * @return the userPhoneNumber
	 */
	public int getUserPhoneNumber() {
		return UserPhoneNumber;
	}
	/**
	 * @param userPhoneNumber the userPhoneNumber to set
	 */
	public void setUserPhoneNumber(int userPhoneNumber) {
		UserPhoneNumber = userPhoneNumber;
	}
	/**
	 * @return the userEmail
	 */
	public String getUserEmail() {
		return UserEmail;
	}
	/**
	 * @param userEmail the userEmail to set
	 */
	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}
	/**
	 * @return the image
	 */
	public String getImage() {
		return Image;
	}
	/**
	 * @param image the image to set
	 */
	public void setImage(String image) {
		Image = image;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return Password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		Password = password;
	}

}