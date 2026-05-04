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
     * Get all bookings from database
     * joined with showBooking, movie, hall and shows tables
     * so we can show movie name, hall name and show timing in the admin page
     */
    public List<BookingModel> getAllBookings() {
        List<BookingModel> bookings = new ArrayList<>();
        try {
            Connection conn = DBconfig.getConnection();

            // joining booking with showBooking to get movieID, hallID, showID
            // then joining those to get the actual names and timings
            // also joining user to show who booked
            String sql = "SELECT b.BookingID, b.BookingDate, b.BookingStatus, b.TotalAmount, b.TicketID, b.PaymentID, "
                       + "m.MovieName, h.HallName, s.ShowTiming, u.Username "
                       + "FROM booking b "
                       + "LEFT JOIN showBooking sb ON b.BookingID = sb.BookingID "
                       + "LEFT JOIN movie m ON sb.MovieID = m.MovieID "
                       + "LEFT JOIN hall h ON sb.HallID = h.HallID "
                       + "LEFT JOIN shows s ON sb.ShowID = s.ShowID "
                       + "LEFT JOIN user u ON sb.UserID = u.UserID";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BookingModel b = new BookingModel();
                b.setBookingID(rs.getInt("BookingID"));
                b.setBookingDate(rs.getString("BookingDate"));
                b.setBookingStatus(rs.getString("BookingStatus"));
                b.setTotalAmount(rs.getFloat("TotalAmount"));
                b.setTicketID(rs.getInt("TicketID"));
                b.setPaymentID(rs.getInt("PaymentID"));
                // set the joined fields
                b.setMovieName(rs.getString("MovieName"));
                b.setHallName(rs.getString("HallName"));
                b.setShowTiming(rs.getString("ShowTiming"));
                b.setUsername(rs.getString("Username"));
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
     * Create a booking from a scheduled show
     * inserts into booking then links it in showBooking
     */
    public boolean addBookingForShow(int showID, int movieID, int hallID) {
        try {
            Connection conn = DBconfig.getConnection();

            // Step 1: insert into booking with today's date and PENDING status
            String insertBooking = "INSERT INTO booking (BookingDate, BookingStatus, TotalAmount) VALUES (CURDATE(), 'PENDING', 0)";
            PreparedStatement ps = conn.prepareStatement(insertBooking, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.executeUpdate();

            // Step 2: get the new BookingID
            ResultSet keys = ps.getGeneratedKeys();
            int bookingID = 0;
            if (keys.next()) {
                bookingID = keys.getInt(1);
            }

            // Step 3: link it in showBooking
            // UserID = 1 and TheatreID = 1 as defaults for now
            String insertShowBooking = "INSERT INTO showBooking (UserID, MovieID, TheatreID, HallID, ShowID, BookingID) VALUES (1, ?, 1, ?, ?, ?)";
            PreparedStatement ps2 = conn.prepareStatement(insertShowBooking);
            ps2.setInt(1, movieID);
            ps2.setInt(2, hallID);
            ps2.setInt(3, showID);
            ps2.setInt(4, bookingID);
            ps2.executeUpdate();

            System.out.println("Booking created: BookingID=" + bookingID + " ShowID=" + showID);

            keys.close();
            ps2.close();
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
     * Update booking status
     */
    public boolean updateBookingStatus(int bookingID, String status) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "UPDATE booking SET BookingStatus = ? WHERE BookingID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
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
     * Delete a booking
     */
    public boolean deleteBooking(int bookingID) {
        try {
            Connection conn = DBconfig.getConnection();

            // need to delete from showBooking first because of foreign key constraint
            String sql1 = "DELETE FROM showBooking WHERE BookingID = ?";
            PreparedStatement ps1 = conn.prepareStatement(sql1);
            ps1.setInt(1, bookingID);
            ps1.executeUpdate();
            ps1.close();

            String sql = "DELETE FROM booking WHERE BookingID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookingID);
            ps.executeUpdate();
            ps.close();
            conn.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}