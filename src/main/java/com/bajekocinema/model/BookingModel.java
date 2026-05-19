package com.bajekocinema.model;

public class BookingModel {

	private int bookingId;
	private int userId;
	private int showId;
	private String bookingTime;
	private double totalAmount;
	private String status;

	// joined fields for display
	private String movieName;
	private String hallName;
	private String showDate;
	private String startTime;
	private String userFullName;

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getShowId() {
		return showId;
	}

	public void setShowId(int showId) {
		this.showId = showId;
	}

	public String getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(String bookingTime) {
		this.bookingTime = bookingTime;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public String getShowDate() {
		return showDate;
	}

	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getUserFullName() {
		return userFullName;
	}

	public void setUserFullName(String userFullName) {
		this.userFullName = userFullName;
	}

	// used by admin JSP pages
	public int getBookingID() {
		return bookingId;
	}

	public void setBookingID(int bookingId) {
		this.bookingId = bookingId;
	}

	public String getBookingDate() {
		return bookingTime;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingTime = bookingDate;
	}

	public String getBookingStatus() {
		if (status != null) {
			return status.toUpperCase();
		}
		return "";
	}

	public void setBookingStatus(String bookingStatus) {
		if (bookingStatus != null) {
			this.status = bookingStatus.toLowerCase();
		}
	}

	public String getShowTiming() {
		if (showDate != null && startTime != null) {
			return showDate + " " + startTime;
		}
		if (showDate != null) {
			return showDate;
		}
		if (startTime != null) {
			return startTime;
		}
		return "";
	}

	public void setShowTiming(String showTiming) {
		this.startTime = showTiming;
	}

	public String getUsername() {
		return userFullName;
	}

	public void setUsername(String username) {
		this.userFullName = username;
	}

	public int getTicketID() {
		return 0;
	}

	public void setTicketID(int ticketId) {
		// not used in new schema
	}

	public int getPaymentID() {
		return 0;
	}

	public void setPaymentID(int paymentId) {
		// not used in new schema
	}

}