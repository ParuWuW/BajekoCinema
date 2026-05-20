package com.bajekocinema.model;

public class BookingModel {

    private int bookingID;
    private int userID;
    private int showID;
    private String bookingDate;
    private String bookingStatus;
    private float totalAmount;

    // joined / display fields
    private String movieName;
    private String hallName;
    private String theatreName;
    private String showTiming;
    private String username;
    private String moviePoster;

    // selected seats (for review page summary)
    private String selectedSeatsLabel;

	/**
	 * @return the bookingID
	 */
	public int getBookingID() {
		return bookingID;
	}

	/**
	 * @param bookingID the bookingID to set
	 */
	public void setBookingID(int bookingID) {
		this.bookingID = bookingID;
	}

	/**
	 * @return the userID
	 */
	public int getUserID() {
		return userID;
	}

	/**
	 * @param userID the userID to set
	 */
	public void setUserID(int userID) {
		this.userID = userID;
	}

	/**
	 * @return the showID
	 */
	public int getShowID() {
		return showID;
	}

	/**
	 * @param showID the showID to set
	 */
	public void setShowID(int showID) {
		this.showID = showID;
	}

	/**
	 * @return the bookingDate
	 */
	public String getBookingDate() {
		return bookingDate;
	}

	/**
	 * @param bookingDate the bookingDate to set
	 */
	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	/**
	 * @return the bookingStatus
	 */
	public String getBookingStatus() {
		return bookingStatus;
	}

	/**
	 * @param bookingStatus the bookingStatus to set
	 */
	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}

	/**
	 * @return the totalAmount
	 */
	public float getTotalAmount() {
		return totalAmount;
	}

	/**
	 * @param totalAmount the totalAmount to set
	 */
	public void setTotalAmount(float totalAmount) {
		this.totalAmount = totalAmount;
	}

	/**
	 * @return the movieName
	 */
	public String getMovieName() {
		return movieName;
	}

	/**
	 * @param movieName the movieName to set
	 */
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	/**
	 * @return the hallName
	 */
	public String getHallName() {
		return hallName;
	}

	/**
	 * @param hallName the hallName to set
	 */
	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	/**
	 * @return the theatreName
	 */
	public String getTheatreName() {
		return theatreName;
	}

	/**
	 * @param theatreName the theatreName to set
	 */
	public void setTheatreName(String theatreName) {
		this.theatreName = theatreName;
	}

	/**
	 * @return the showTiming
	 */
	public String getShowTiming() {
		return showTiming;
	}

	/**
	 * @param showTiming the showTiming to set
	 */
	public void setShowTiming(String showTiming) {
		this.showTiming = showTiming;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the moviePoster
	 */
	public String getMoviePoster() {
		return moviePoster;
	}

	/**
	 * @param moviePoster the moviePoster to set
	 */
	public void setMoviePoster(String moviePoster) {
		this.moviePoster = moviePoster;
	}

	/**
	 * @return the selectedSeatsLabel
	 */
	public String getSelectedSeatsLabel() {
		return selectedSeatsLabel;
	}

	/**
	 * @param selectedSeatsLabel the selectedSeatsLabel to set
	 */
	public void setSelectedSeatsLabel(String selectedSeatsLabel) {
		this.selectedSeatsLabel = selectedSeatsLabel;
	}

}