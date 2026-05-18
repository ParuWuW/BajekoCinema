package com.bajekocinema.model;

public class BookingModel {

    private int BookingID;
    private String BookingDate;
    private String BookingStatus;
    private float TotalAmount;
    private int TicketID;
    private int PaymentID;

    // added these to show movie, hall and show info in the booking table
    private String MovieName;
    private String HallName;
    private String ShowTiming;

    // who booked the show
    private String Username;

    /**
     * @return the bookingID
     */
    public int getBookingID() { return BookingID; }
    /**
     * @param bookingID the bookingID to set
     */
    public void setBookingID(int bookingID) { BookingID = bookingID; }

    /**
     * @return the bookingDate
     */
    public String getBookingDate() { return BookingDate; }
    /**
     * @param bookingDate the bookingDate to set
     */
    public void setBookingDate(String bookingDate) { BookingDate = bookingDate; }

    /**
     * @return the bookingStatus
     */
    public String getBookingStatus() { return BookingStatus; }
    /**
     * @param bookingStatus the bookingStatus to set
     */
    public void setBookingStatus(String bookingStatus) {
    	// convert to uppercase so badge comparison works in JSP
    	if (bookingStatus != null) {
    		BookingStatus = bookingStatus.toUpperCase();
    	} else {
    		BookingStatus = bookingStatus;
    	}
    }

    /**
     * @return the totalAmount
     */
    public float getTotalAmount() { return TotalAmount; }
    /**
     * @param totalAmount the totalAmount to set
     */
    public void setTotalAmount(float totalAmount) { TotalAmount = totalAmount; }

    /**
     * @return the ticketID
     */
    public int getTicketID() { return TicketID; }
    /**
     * @param ticketID the ticketID to set
     */
    public void setTicketID(int ticketID) { TicketID = ticketID; }

    /**
     * @return the paymentID
     */
    public int getPaymentID() { return PaymentID; }
    /**
     * @param paymentID the paymentID to set
     */
    public void setPaymentID(int paymentID) { PaymentID = paymentID; }

    /**
     * @return the movieName
     */
    public String getMovieName() { return MovieName; }
    /**
     * @param movieName the movieName to set
     */
    public void setMovieName(String movieName) { MovieName = movieName; }

    /**
     * @return the hallName
     */
    public String getHallName() { return HallName; }
    /**
     * @param hallName the hallName to set
     */
    public void setHallName(String hallName) { HallName = hallName; }

    /**
     * @return the showTiming
     */
    public String getShowTiming() { return ShowTiming; }
    /**
     * @param showTiming the showTiming to set
     */
    public void setShowTiming(String showTiming) { ShowTiming = showTiming; }

    /**
     * @return the username
     */
    public String getUsername() { return Username; }
    /**
     * @param username the username to set
     */
    public void setUsername(String username) { Username = username; }

}