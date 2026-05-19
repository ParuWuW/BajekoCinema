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
    private String selectedSeatsLabel; // e.g. "A1, A2, A3"

    public int getBookingID() { return bookingID; }
    public void setBookingID(int bookingID) { this.bookingID = bookingID; }

    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }

    public int getShowID() { return showID; }
    public void setShowID(int showID) { this.showID = showID; }

    public String getBookingDate() { return bookingDate; }
    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }

    public String getBookingStatus() { return bookingStatus; }
    public void setBookingStatus(String bookingStatus) {
        if (bookingStatus != null) {
            this.bookingStatus = bookingStatus.toUpperCase();
        } else {
            this.bookingStatus = null;
        }
    }

    public float getTotalAmount() { return totalAmount; }
    public void setTotalAmount(float totalAmount) { this.totalAmount = totalAmount; }

    public String getMovieName() { return movieName; }
    public void setMovieName(String movieName) { this.movieName = movieName; }

    public String getHallName() { return hallName; }
    public void setHallName(String hallName) { this.hallName = hallName; }

    public String getTheatreName() { return theatreName; }
    public void setTheatreName(String theatreName) { this.theatreName = theatreName; }

    public String getShowTiming() { return showTiming; }
    public void setShowTiming(String showTiming) { this.showTiming = showTiming; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getMoviePoster() { return moviePoster; }
    public void setMoviePoster(String moviePoster) { this.moviePoster = moviePoster; }

    public String getSelectedSeatsLabel() { return selectedSeatsLabel; }
    public void setSelectedSeatsLabel(String selectedSeatsLabel) { this.selectedSeatsLabel = selectedSeatsLabel; }
}