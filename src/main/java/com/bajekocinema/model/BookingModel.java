package com.bajekocinema.model;

public class BookingModel {

    private int bookingID;
    private String bookingDate;
    private String bookingStatus;
    private float totalAmount;
    private int ticketID;
    private int paymentID;

    // added these to show movie, hall and show info in the booking table
    private String movieName;
    private String hallName;
    private String showTiming;

    // who booked the show
    private String username;

    /**
     * @return the bookingID
     */
    public int getBookingID() { return bookingID; }
    /**
     * @param bookingID the bookingID to set
     */
    public void setBookingID(int bookingID) { bookingID = bookingID; }

    /**
     * @return the bookingDate
     */
    public String getBookingDate() { return bookingDate; }
    /**
     * @param bookingDate the bookingDate to set
     */
    public void setBookingDate(String bookingDate) { bookingDate = bookingDate; }

    /**
     * @return the bookingStatus
     */
    public String getBookingStatus() { return bookingStatus; }
    /**
     * @param bookingStatus the bookingStatus to set
     */
    public void setBookingStatus(String bookingStatus) {
    	// convert to uppercase so badge comparison works in JSP
    	if (bookingStatus != null) {
    		bookingStatus = bookingStatus.toUpperCase();
    	} else {
    		bookingStatus = bookingStatus;
    	}
    }

    /**
     * @return the totalAmount
     */
    public float getTotalAmount() { return totalAmount; }
    /**
     * @param totalAmount the totalAmount to set
     */
    public void setTotalAmount(float totalAmount) { totalAmount = totalAmount; }

    /**
     * @return the ticketID
     */
    public int getTicketID() { return ticketID; }
    /**
     * @param ticketID the ticketID to set
     */
    public void setTicketID(int ticketID) { ticketID = ticketID; }

    /**
     * @return the paymentID
     */
    public int getPaymentID() { return paymentID; }
    /**
     * @param paymentID the paymentID to set
     */
    public void setPaymentID(int paymentID) { paymentID = paymentID; }

    /**
     * @return the movieName
     */
    public String getMovieName() { return movieName; }
    /**
     * @param movieName the movieName to set
     */
    public void setMovieName(String movieName) { movieName = movieName; }

    /**
     * @return the hallName
     */
    public String getHallName() { return hallName; }
    /**
     * @param hallName the hallName to set
     */
    public void setHallName(String hallName) { hallName = hallName; }

    /**
     * @return the showTiming
     */
    public String getShowTiming() { return showTiming; }
    /**
     * @param showTiming the showTiming to set
     */
    public void setShowTiming(String showTiming) { showTiming = showTiming; }

    /**
     * @return the username
     */
    public String getUsername() { return username; }
    /**
     * @param username the username to set
     */
    public void setUsername(String username) { username = username; }

}