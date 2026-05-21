package com.bajekocinema.model;

/**
 * Model class for Theatres in the admin panel.
 * 
 * @author bajekocinema
 */
public class TheatreAdminModel {

	private int theatreId;
	private String theatreName;
	private String address;
	private String phone;
	private String email;

	public int getTheatreId() {
		return theatreId;
	}

	public void setTheatreId(int theatreId) {
		this.theatreId = theatreId;
	}

	public String getTheatreName() {
		return theatreName;
	}

	public void setTheatreName(String theatreName) {
		this.theatreName = theatreName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTheatreAddress() {
		return address;
	}

	public void setTheatreAddress(String address) {
		this.address = address;
	}

}