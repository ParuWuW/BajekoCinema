package com.bajekocinema.services;

import com.bajekocinema.dao.SeatBookingDAO;
import com.bajekocinema.dao.SeatBookingDAO.BookingSummary;
import com.bajekocinema.model.SeatModel;
import com.bajekocinema.model.ShowModel;
import com.bajekocinema.model.TheatreModel;

import java.sql.Date;
import java.util.List;

public class SeatBookingService {

    public static final float SEAT_PRICE = 200f;

    private SeatBookingDAO dao = new SeatBookingDAO();

    public List<TheatreModel> getTheatresForMovie(int movieId) {
        return dao.getTheatresForMovie(movieId);
    }

    public List<Date> getDatesForMovieTheatre(int movieId, int theatreId) {
        return dao.getDatesForMovieTheatre(movieId, theatreId);
    }

    public List<ShowModel> getShowsForMovieTheatreDate(int movieId, int theatreId, Date date) {
        return dao.getShowsForMovieTheatreDate(movieId, theatreId, date);
    }

    public ShowModel getShowDetails(int showId) {
        return dao.getShowDetails(showId);
    }

    public List<SeatModel> getSeatsForShow(int hallId, int showId) {
        return dao.getSeatsForShow(hallId, showId);
    }

    public int createPendingBooking(int userId, int showId, int[] seatIds) {
        return dao.createPendingBooking(userId, showId, seatIds, SEAT_PRICE);
    }

    public boolean confirmBooking(int bookingId) {
        return dao.updateBookingStatus(bookingId, "confirmed");
    }

    public boolean cancelBooking(int bookingId) {
        return dao.updateBookingStatus(bookingId, "cancelled");
    }

    public BookingSummary getBookingSummary(int bookingId) {
        return dao.getBookingSummary(bookingId);
    }
}