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
    
    
    
    //SICHU LAI CHAINE HO 
    //DO NOT TOUCH

    public List<BookingModel> getBookingsByUserId(int userId) {
        List<BookingModel> bookings = new ArrayList<>();
        try {
            Connection conn = DBconfig.getConnection();

            String sql = "SELECT b.booking_id, b.booking_time, b.total_amount, b.status, " +
                         "m.title, s.show_date, s.start_time " +
                         "FROM Booking b " +
                         "JOIN Shows s ON b.show_id = s.show_id " +
                         "JOIN Movie m ON s.movie_id = m.movie_id " +
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
                b.setShowTiming(rs.getString("show_date") + " " + rs.getString("start_time"));
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
    
    //khushi ko code
    /**
     * Creates a booking with associated ticket and seats in a single transaction.
     *
     * @param userID       the user making the booking
     * @param showID       the show being booked
     * @param seatIds      list of seat IDs to book
     * @param pricePerSeat price for each seat (used to populate ticket_seat.seat_price)
     * @return new bookingId on success, -1 on any failure
     */
    public int createBookingWithSeats(int userID, int showID,
                                      List<Integer> seatIds, float pricePerSeat) {
        Connection conn = null;
        int newBookingID = -1;

        if (seatIds == null || seatIds.isEmpty()) {
            System.out.println("BookingDAO: no seats provided, aborting");
            return -1;
        }

        try {
            conn = DBconfig.getConnection();
            conn.setAutoCommit(false); // BEGIN

            float totalAmount = pricePerSeat * seatIds.size();

            // Step 1: INSERT into booking
            // booking_time defaults to CURRENT_TIMESTAMP, status defaults to 'pending'
            // explicitly set status to 'confirmed' since we're committing the booking.
            String insertBooking =
                "INSERT INTO booking (user_id, show_id, total_amount, status) " +
                "VALUES (?, ?, ?, 'confirmed')";

            try (PreparedStatement ps = conn.prepareStatement(
                    insertBooking, PreparedStatement.RETURN_GENERATED_KEYS)) {

                ps.setInt(1, userID);
                ps.setInt(2, showID);
                ps.setFloat(3, totalAmount);
                ps.executeUpdate();

                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (keys.next()) newBookingID = keys.getInt(1);
                }
            }

            if (newBookingID == -1) throw new Exception("Could not retrieve generated booking_id");

            // Step 2: INSERT into ticket (one ticket per booking — booking_id is UNIQUE)
            int newTicketID = -1;
            String insertTicket =
                "INSERT INTO ticket (booking_id, status) VALUES (?, 'active')";

            try (PreparedStatement ps = conn.prepareStatement(
                    insertTicket, PreparedStatement.RETURN_GENERATED_KEYS)) {

                ps.setInt(1, newBookingID);
                ps.executeUpdate();

                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (keys.next()) newTicketID = keys.getInt(1);
                }
            }

            if (newTicketID == -1) throw new Exception("Could not retrieve generated ticket_id");

            // Step 3: insert one row into ticket_seat per selected seat
            String insertSeat =
                "INSERT INTO ticket_seat (ticket_id, seat_id, seat_price) VALUES (?, ?, ?)";

            try (PreparedStatement ps = conn.prepareStatement(insertSeat)) {
                for (int seatId : seatIds) {
                    ps.setInt(1, newTicketID);
                    ps.setInt(2, seatId);
                    ps.setFloat(3, pricePerSeat);
                    ps.addBatch();
                }
                ps.executeBatch();
            }

            conn.commit(); // COMMIT
            System.out.println("BookingDAO: success — bookingId=" + newBookingID
                    + " ticketId=" + newTicketID + " seats=" + seatIds);

        } catch (Exception e) {
            System.out.println("BookingDAO: transaction failed, rolling back");
            e.printStackTrace();
            if (conn != null) {
                try { conn.rollback(); } catch (Exception ex) { ex.printStackTrace(); }
            }
            newBookingID = -1;

        } finally {
            if (conn != null) {
                try { conn.setAutoCommit(true); conn.close(); } catch (Exception ex) { ex.printStackTrace(); }
            }
        }

        return newBookingID;
    }
}