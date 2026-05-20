package com.bajekocinema.dao;

import com.bajekocinema.model.BookingModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    /**
     * Get all bookings from database with movie/hall/show/user info for admin page.
     * Uses the actual new schema: booking → shows → movie/hall/theatre, booking → user.
     */
    public List<BookingModel> getAllBookings() {
        List<BookingModel> bookings = new ArrayList<>();
        try {
            Connection conn = DBconfig.getConnection();

            String sql =
                "SELECT b.booking_id, b.user_id, b.show_id, b.booking_time, b.total_amount, b.status, " +
                "       m.title AS movie_title, " +
                "       h.hall_name, " +
                "       t.theatre_name, " +
                "       s.show_date, s.start_time, " +
                "       u.fullName " +
                "FROM booking b " +
                "LEFT JOIN shows s   ON s.show_id   = b.show_id " +
                "LEFT JOIN movie m   ON m.movie_id  = s.movie_id " +
                "LEFT JOIN hall h    ON h.hall_id   = s.hall_id " +
                "LEFT JOIN theatre t ON t.theatre_id = s.theatre_id " +
                "LEFT JOIN `user` u  ON u.userID    = b.user_id " +
                "ORDER BY b.booking_id DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookingModel b = new BookingModel();
                b.setBookingID(rs.getInt("booking_id"));
                b.setUserID(rs.getInt("user_id"));
                b.setShowID(rs.getInt("show_id"));
                b.setBookingDate(rs.getString("booking_time"));
                b.setBookingStatus(rs.getString("status"));
                b.setTotalAmount(rs.getFloat("total_amount"));
                b.setMovieName(rs.getString("movie_title"));
                b.setHallName(rs.getString("hall_name"));
                b.setTheatreName(rs.getString("theatre_name"));

                // Build a human-readable show timing string
                java.sql.Date sd = rs.getDate("show_date");
                java.sql.Time st = rs.getTime("start_time");
                if (sd != null && st != null) {
                    b.setShowTiming(sd.toString() + " " + st.toString());
                } else if (sd != null) {
                    b.setShowTiming(sd.toString());
                }

                b.setUsername(rs.getString("fullName"));
                bookings.add(b);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookings;
    }

    /**
     * Admin "book" action: create a placeholder pending booking for a scheduled show.
     * The new schema only stores user_id, show_id, total_amount, status — movieID/hallID
     * are derivable from show_id, so the extra parameters are accepted for backwards
     * signature compatibility but only show_id is actually inserted.
     *
     * user_id defaults to 1 (admin/placeholder) since the admin form does not pick a user.
     */
    public boolean addBookingForShow(int showID, int movieID, int hallID) {
        try {
            Connection conn = DBconfig.getConnection();

            String sql = "INSERT INTO booking (user_id, show_id, total_amount, status) "
                       + "VALUES (1, ?, 0, 'pending')";
            PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, showID);
            ps.executeUpdate();

            ResultSet keys = ps.getGeneratedKeys();
            int bookingID = 0;
            if (keys.next()) bookingID = keys.getInt(1);

            System.out.println("Booking created: BookingID=" + bookingID + " ShowID=" + showID);

            keys.close();
            ps.close();
            conn.close();
            return true;

        } catch (Exception e) {
            System.out.println("Failed to create booking");
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update booking status. The admin form may pass status in any case;
     * the booking.status column is a lowercase enum so we normalise here.
     */
    public boolean updateBookingStatus(int bookingID, String status) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "UPDATE booking SET status = ? WHERE booking_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status == null ? null : status.toLowerCase());
            ps.setInt(2, bookingID);
            ps.executeUpdate();
            ps.close();
            conn.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Delete a booking. Must clean up ticket_seat → ticket → booking in that order
     * because ticket.booking_id references booking and ticket_seat.ticket_id references ticket.
     */
    public boolean deleteBooking(int bookingID) {
        Connection conn = null;
        try {
            conn = DBconfig.getConnection();
            conn.setAutoCommit(false);

            // delete ticket_seat rows tied to any ticket for this booking
            String sqlTs = "DELETE ts FROM ticket_seat ts " +
                           "JOIN ticket tk ON tk.ticket_id = ts.ticket_id " +
                           "WHERE tk.booking_id = ?";
            PreparedStatement psTs = conn.prepareStatement(sqlTs);
            psTs.setInt(1, bookingID);
            psTs.executeUpdate();
            psTs.close();

            // delete tickets for this booking
            String sqlTk = "DELETE FROM ticket WHERE booking_id = ?";
            PreparedStatement psTk = conn.prepareStatement(sqlTk);
            psTk.setInt(1, bookingID);
            psTk.executeUpdate();
            psTk.close();

            // delete any payment row tied to this booking (unique FK)
            String sqlPay = "DELETE FROM payment WHERE booking_id = ?";
            PreparedStatement psPay = conn.prepareStatement(sqlPay);
            psPay.setInt(1, bookingID);
            psPay.executeUpdate();
            psPay.close();

            // finally the booking itself
            String sql = "DELETE FROM booking WHERE booking_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookingID);
            ps.executeUpdate();
            ps.close();

            conn.commit();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            try { if (conn != null) conn.rollback(); } catch (Exception ex) { ex.printStackTrace(); }
            return false;
        } finally {
            try { if (conn != null) { conn.setAutoCommit(true); conn.close(); } } catch (Exception ex) { ex.printStackTrace(); }
        }
    }

    /**
     * Previous bookings for a logged-in user — used by /previousBooking.
     * Uses the actual new schema column names.
     */
    public List<BookingModel> getBookingsByUserId(int userId) {
        List<BookingModel> bookings = new ArrayList<>();
        try {
            Connection conn = DBconfig.getConnection();

            String sql = "SELECT b.booking_id, b.booking_time, b.total_amount, b.status, " +
                         "       m.title, s.show_date, s.start_time " +
                         "FROM booking b " +
                         "JOIN shows s ON b.show_id = s.show_id " +
                         "JOIN movie m ON s.movie_id = m.movie_id " +
                         "WHERE b.user_id = ? " +
                         "ORDER BY b.booking_id DESC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookingModel b = new BookingModel();
                b.setBookingID(rs.getInt("booking_id"));
                b.setBookingDate(rs.getString("booking_time"));
                b.setTotalAmount(rs.getFloat("total_amount"));
                b.setBookingStatus(rs.getString("status"));
                b.setMovieName(rs.getString("title"));

                java.sql.Date sd = rs.getDate("show_date");
                java.sql.Time st = rs.getTime("start_time");
                if (sd != null && st != null) {
                    b.setShowTiming(sd.toString() + " " + st.toString());
                } else if (sd != null) {
                    b.setShowTiming(sd.toString());
                }

                bookings.add(b);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookings;
    }
}