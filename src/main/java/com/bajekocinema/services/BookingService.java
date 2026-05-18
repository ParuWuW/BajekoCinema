package com.bajekocinema.services;

import com.bajekocinema.dao.BookingDAO;
import com.bajekocinema.dao.MovieDAO;
import com.bajekocinema.dao.SeatDAO;
import com.bajekocinema.dao.ShowDAO;
import com.bajekocinema.model.HallModel;
import com.bajekocinema.model.MovieModel;
import com.bajekocinema.model.SeatModel;
import com.bajekocinema.model.ShowModel;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

public class BookingService {

    private static final float SEAT_PRICE = 500.0f;

    private final MovieDAO  movieDAO  = new MovieDAO();
    private final ShowDAO   showDAO   = new ShowDAO();
    private final SeatDAO   seatDAO   = new SeatDAO();
    private final BookingDAO bookingDAO = new BookingDAO();

    public static float getSeatPrice() {
        return SEAT_PRICE;
    }

    public MovieModel getMovie(int movieId) {
        return movieDAO.getMovieById(movieId);
    }

    public List<HallModel> getHallsForMovie(int movieId) {
        return showDAO.getHallsByMovie(movieId);
    }

    public HallModel resolveSelectedHall(List<HallModel> halls, String hallIdParam) {
        if (hallIdParam != null && !hallIdParam.trim().isEmpty()) {
            try {
                int hallId = Integer.parseInt(hallIdParam.trim());
                for (HallModel h : halls) {
                    if (h.getHallID() == hallId) return h;
                }
            } catch (NumberFormatException ignored) {}
        }
        return halls.isEmpty() ? null : halls.get(0);
    }

    public List<ShowModel> getShowsForMovieAndHall(int movieId, int hallId) {
        return showDAO.getShowsByMovieAndHall(movieId, hallId);
    }

    public ShowModel resolveSelectedShow(List<ShowModel> shows, String showIdParam) {
        if (showIdParam != null && !showIdParam.trim().isEmpty()) {
            try {
                int showId = Integer.parseInt(showIdParam.trim());
                for (ShowModel s : shows) {
                    if (s.getShowID() == showId) return s;
                }
            } catch (NumberFormatException ignored) {}
        }
        return shows.isEmpty() ? null : shows.get(0);
    }

    public LinkedHashMap<String, List<SeatModel>> getSeatsGroupedByRow(int hallId, int showId) {
        return seatDAO.getSeatsByHallGroupedByRow(hallId, showId);
    }

    public List<SeatModel> flattenSeats(LinkedHashMap<String, List<SeatModel>> seatsByRow) {
        List<SeatModel> flat = new ArrayList<>();
        for (List<SeatModel> row : seatsByRow.values()) flat.addAll(row);
        return flat;
    }

    public ShowModel getShowById(int showId) {
        return showDAO.getShowByID(showId);
    }

    public boolean areSeatsAvailable(List<Integer> seatIds, int hallId, int showId) {
        return seatDAO.areSeatsAvailable(seatIds, hallId, showId);
    }

    public int createBooking(int userId, int movieId, int hallId, int showId, List<Integer> seatIds) {
        return bookingDAO.createBookingWithSeats(userId, movieId, hallId, showId, seatIds, SEAT_PRICE);
    }
}
