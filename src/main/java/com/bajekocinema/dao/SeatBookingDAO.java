package com.bajekocinema.dao;

import com.bajekocinema.model.SeatModel;
import com.bajekocinema.model.ShowModel;
import com.bajekocinema.model.TheatreModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SeatBookingDAO {

    /** Theatres that have at least one scheduled show for this movie (today or later). */
    public List<TheatreModel> getTheatresForMovie(int movieId) {
        List<TheatreModel> list = new ArrayList<>();
        String sql = "SELECT DISTINCT t.theatre_id, t.theatre_name, t.address " +
                     "FROM theatre t " +
                     "JOIN shows s ON s.theatre_id = t.theatre_id " +
                     "WHERE s.movie_id = ? AND s.status = 'scheduled' AND s.show_date >= CURDATE() " +
                     "ORDER BY t.theatre_name ASC";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TheatreModel t = new TheatreModel();
                t.setTheatreID(rs.getInt("theatre_id"));
                t.setTheatreName(rs.getString("theatre_name"));
                t.setTheatreAddress(rs.getString("address"));
                list.add(t);
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /** Distinct show dates for a given movie + theatre. */
    public List<Date> getDatesForMovieTheatre(int movieId, int theatreId) {
        List<Date> dates = new ArrayList<>();
        String sql = "SELECT DISTINCT show_date FROM shows " +
                     "WHERE movie_id = ? AND theatre_id = ? " +
                     "  AND status = 'scheduled' AND show_date >= CURDATE() " +
                     "ORDER BY show_date ASC";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieId);
            ps.setInt(2, theatreId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dates.add(rs.getDate("show_date"));
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dates;
    }

    /** Shows for movie + theatre + date — returns showId, time, hallId. */
    public List<ShowModel> getShowsForMovieTheatreDate(int movieId, int theatreId, Date date) {
        List<ShowModel> shows = new ArrayList<>();
        String sql = "SELECT s.show_id, s.movie_id, s.theatre_id, s.hall_id, s.show_date, s.start_time, h.hall_name " +
                     "FROM shows s JOIN hall h ON h.hall_id = s.hall_id " +
                     "WHERE s.movie_id = ? AND s.theatre_id = ? AND s.show_date = ? AND s.status = 'scheduled' " +
                     "ORDER BY s.start_time ASC";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieId);
            ps.setInt(2, theatreId);
            ps.setDate(3, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ShowModel s = new ShowModel();
                s.setShowID(rs.getInt("show_id"));
                s.setMovieID(rs.getInt("movie_id"));
                s.setTheatreID(rs.getInt("theatre_id"));
                s.setHallID(rs.getInt("hall_id"));
                s.setShowDate(rs.getDate("show_date"));
                s.setStartTime(rs.getTime("start_time"));
                s.setHallName(rs.getString("hall_name"));
                shows.add(s);
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shows;
    }

    /** Single show by id, joined with movie/hall/theatre for summary display. */
    public ShowModel getShowDetails(int showId) {
        ShowModel s = null;
        String sql = "SELECT s.show_id, s.movie_id, s.theatre_id, s.hall_id, s.show_date, s.start_time, " +
                     "       m.title AS movie_title, h.hall_name, t.theatre_name " +
                     "FROM shows s " +
                     "JOIN movie m ON m.movie_id = s.movie_id " +
                     "JOIN hall h ON h.hall_id = s.hall_id " +
                     "JOIN theatre t ON t.theatre_id = s.theatre_id " +
                     "WHERE s.show_id = ?";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, showId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s = new ShowModel();
                s.setShowID(rs.getInt("show_id"));
                s.setMovieID(rs.getInt("movie_id"));
                s.setTheatreID(rs.getInt("theatre_id"));
                s.setHallID(rs.getInt("hall_id"));
                s.setShowDate(rs.getDate("show_date"));
                s.setStartTime(rs.getTime("start_time"));
                s.setMovieName(rs.getString("movie_title"));
                s.setHallName(rs.getString("hall_name"));
                s.setTheatreName(rs.getString("theatre_name"));
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    /**
     * All seats for a hall. is_booked is computed per-show:
     * a seat is "booked for this show" if it appears in ticket_seat for any
     * ticket attached to a CONFIRMED booking for this show.
     */
    public List<SeatModel> getSeatsForShow(int hallId, int showId) {
        List<SeatModel> seats = new ArrayList<>();
        String sql =
            "SELECT se.seat_id, se.hall_id, se.row_label, se.seat_number, " +
            "  CASE WHEN EXISTS ( " +
            "    SELECT 1 FROM ticket_seat ts " +
            "    JOIN ticket tk ON tk.ticket_id = ts.ticket_id " +
            "    JOIN booking b ON b.booking_id = tk.booking_id " +
            "    WHERE ts.seat_id = se.seat_id " +
            "      AND b.show_id = ? " +
            "      AND b.status = 'confirmed' " +
            "  ) THEN 1 ELSE 0 END AS is_booked " +
            "FROM seat se " +
            "WHERE se.hall_id = ? " +
            "ORDER BY se.row_label ASC, se.seat_number ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, showId);
            ps.setInt(2, hallId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SeatModel s = new SeatModel();
                s.setSeatID(rs.getInt("seat_id"));
                s.setHallID(rs.getInt("hall_id"));
                s.setRowLabel(rs.getString("row_label"));
                s.setSeatNumber(rs.getInt("seat_number"));
                s.setBooked(rs.getInt("is_booked") == 1);
                seats.add(s);
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return seats;
    }

    /** Create booking + ticket + ticket_seat rows. Returns new bookingId. */
    public int createPendingBooking(int userId, int showId, int[] seatIds, float pricePerSeat) {
        int bookingId = -1;
        Connection conn = null;
        try {
            conn = DBconfig.getConnection();
            conn.setAutoCommit(false);

            float total = pricePerSeat * seatIds.length;

            // 1. insert booking
            String bSql = "INSERT INTO booking (user_id, show_id, total_amount, status) VALUES (?, ?, ?, 'pending')";
            PreparedStatement bp = conn.prepareStatement(bSql, PreparedStatement.RETURN_GENERATED_KEYS);
            bp.setInt(1, userId);
            bp.setInt(2, showId);
            bp.setBigDecimal(3, java.math.BigDecimal.valueOf(total));
            bp.executeUpdate();
            ResultSet bKeys = bp.getGeneratedKeys();
            if (bKeys.next()) bookingId = bKeys.getInt(1);
            bKeys.close();
            bp.close();

            // 2. insert ticket
            String tSql = "INSERT INTO ticket (booking_id, status) VALUES (?, 'active')";
            PreparedStatement tp = conn.prepareStatement(tSql, PreparedStatement.RETURN_GENERATED_KEYS);
            tp.setInt(1, bookingId);
            tp.executeUpdate();
            ResultSet tKeys = tp.getGeneratedKeys();
            int ticketId = -1;
            if (tKeys.next()) ticketId = tKeys.getInt(1);
            tKeys.close();
            tp.close();

            // 3. insert ticket_seat rows
            String tsSql = "INSERT INTO ticket_seat (ticket_id, seat_id, seat_price) VALUES (?, ?, ?)";
            PreparedStatement tsp = conn.prepareStatement(tsSql);
            for (int seatId : seatIds) {
                tsp.setInt(1, ticketId);
                tsp.setInt(2, seatId);
                tsp.setBigDecimal(3, java.math.BigDecimal.valueOf(pricePerSeat));
                tsp.addBatch();
            }
            tsp.executeBatch();
            tsp.close();

            conn.commit();

        } catch (Exception e) {
            e.printStackTrace();
            try { if (conn != null) conn.rollback(); } catch (Exception ex) { ex.printStackTrace(); }
            bookingId = -1;
        } finally {
            try { if (conn != null) { conn.setAutoCommit(true); conn.close(); } } catch (Exception ex) { ex.printStackTrace(); }
        }
        return bookingId;
    }

    /** Update status: 'confirmed', 'cancelled', etc. */
    public boolean updateBookingStatus(int bookingId, String status) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "UPDATE booking SET status = ? WHERE booking_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, bookingId);
            int rows = ps.executeUpdate();
            ps.close(); conn.close();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /** Full booking summary for the review page. */
    public BookingSummary getBookingSummary(int bookingId) {
        BookingSummary out = null;
        String sql =
            "SELECT b.booking_id, b.user_id, b.show_id, b.booking_time, b.total_amount, b.status, " +
            "       u.fullName AS user_name, " +
            "       m.movie_id, m.title AS movie_title, m.poster_url, " +
            "       s.show_date, s.start_time, " +
            "       h.hall_id, h.hall_name, " +
            "       t.theatre_id, t.theatre_name " +
            "FROM booking b " +
            "JOIN `user` u ON u.userID = b.user_id " +
            "JOIN shows s ON s.show_id = b.show_id " +
            "JOIN movie m ON m.movie_id = s.movie_id " +
            "JOIN hall h ON h.hall_id = s.hall_id " +
            "JOIN theatre t ON t.theatre_id = s.theatre_id " +
            "WHERE b.booking_id = ?";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookingId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                out = new BookingSummary();
                out.bookingId   = rs.getInt("booking_id");
                out.userId      = rs.getInt("user_id");
                out.userName    = rs.getString("user_name");
                out.showId      = rs.getInt("show_id");
                out.movieId     = rs.getInt("movie_id");
                out.movieTitle  = rs.getString("movie_title");
                out.posterUrl   = rs.getString("poster_url");
                out.showDate    = rs.getDate("show_date");
                out.startTime   = rs.getTime("start_time");
                out.hallId      = rs.getInt("hall_id");
                out.hallName    = rs.getString("hall_name");
                out.theatreId   = rs.getInt("theatre_id");
                out.theatreName = rs.getString("theatre_name");
                out.totalAmount = rs.getFloat("total_amount");
                out.status      = rs.getString("status");
                out.bookingTime = rs.getTimestamp("booking_time");
            }
            rs.close(); ps.close();

            if (out != null) {
                // pull seats
                String seatSql =
                    "SELECT se.seat_id, se.row_label, se.seat_number " +
                    "FROM ticket_seat ts " +
                    "JOIN ticket tk ON tk.ticket_id = ts.ticket_id " +
                    "JOIN seat se ON se.seat_id = ts.seat_id " +
                    "WHERE tk.booking_id = ? " +
                    "ORDER BY se.row_label, se.seat_number";
                PreparedStatement sps = conn.prepareStatement(seatSql);
                sps.setInt(1, bookingId);
                ResultSet srs = sps.executeQuery();
                out.seats = new ArrayList<>();
                while (srs.next()) {
                    SeatModel sm = new SeatModel();
                    sm.setSeatID(srs.getInt("seat_id"));
                    sm.setRowLabel(srs.getString("row_label"));
                    sm.setSeatNumber(srs.getInt("seat_number"));
                    out.seats.add(sm);
                }
                srs.close(); sps.close();
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return out;
    }

    /** Plain DTO for the review page. */
    public static class BookingSummary {
        public int bookingId, userId, showId, movieId, hallId, theatreId;
        public String userName, movieTitle, posterUrl, hallName, theatreName, status;
        public Date showDate;
        public Time startTime;
        public Timestamp bookingTime;
        public float totalAmount;
        public List<SeatModel> seats;
    }
}