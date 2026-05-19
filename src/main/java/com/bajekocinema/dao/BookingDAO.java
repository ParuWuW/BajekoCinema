package com.bajekocinema.dao;

import com.bajekocinema.model.BookingModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

	public List<BookingModel> getAllBookings() {
		List<BookingModel> bookings = new ArrayList<>();

		String sql = "SELECT b.booking_id, b.user_id, b.show_id, b.booking_time, b.total_amount, b.status, "
				+ "m.title AS movie_name, h.hall_name, s.show_date, s.start_time, u.fullName AS user_full_name "
				+ "FROM Booking b "
				+ "LEFT JOIN Shows s ON b.show_id = s.show_id "
				+ "LEFT JOIN Movie m ON s.movie_id = m.movie_id "
				+ "LEFT JOIN Hall h ON s.hall_id = h.hall_id "
				+ "LEFT JOIN `User` u ON b.user_id = u.userID "
				+ "ORDER BY b.booking_id DESC";

		try {
			Connection conn = DBconfig.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BookingModel b = new BookingModel();
				b.setBookingId(rs.getInt("booking_id"));
				b.setUserId(rs.getInt("user_id"));
				b.setShowId(rs.getInt("show_id"));
				b.setBookingTime(rs.getString("booking_time"));
				b.setTotalAmount(rs.getDouble("total_amount"));
				b.setStatus(rs.getString("status"));
				b.setMovieName(rs.getString("movie_name"));
				b.setHallName(rs.getString("hall_name"));
				b.setShowDate(rs.getString("show_date"));
				b.setStartTime(rs.getString("start_time"));
				b.setUserFullName(rs.getString("user_full_name"));
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

	public List<BookingModel> getBookingsByUserId(int userId) {
		List<BookingModel> bookings = new ArrayList<>();

		String sql = "SELECT b.booking_id, b.user_id, b.show_id, b.booking_time, b.total_amount, b.status, "
				+ "m.title AS movie_name, h.hall_name, s.show_date, s.start_time "
				+ "FROM Booking b "
				+ "LEFT JOIN Shows s ON b.show_id = s.show_id "
				+ "LEFT JOIN Movie m ON s.movie_id = m.movie_id "
				+ "LEFT JOIN Hall h ON s.hall_id = h.hall_id "
				+ "WHERE b.user_id = ? "
				+ "ORDER BY b.booking_id DESC";

		try {
			Connection conn = DBconfig.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BookingModel b = new BookingModel();
				b.setBookingId(rs.getInt("booking_id"));
				b.setUserId(rs.getInt("user_id"));
				b.setShowId(rs.getInt("show_id"));
				b.setBookingTime(rs.getString("booking_time"));
				b.setTotalAmount(rs.getDouble("total_amount"));
				b.setStatus(rs.getString("status"));
				b.setMovieName(rs.getString("movie_name"));
				b.setHallName(rs.getString("hall_name"));
				b.setShowDate(rs.getString("show_date"));
				b.setStartTime(rs.getString("start_time"));
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

	public boolean addBookingForShow(int showId, int userId, double totalAmount) {
		String sql = "INSERT INTO Booking (user_id, show_id, total_amount, status) VALUES (?, ?, ?, 'pending')";

		try {
			Connection conn = DBconfig.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setInt(2, showId);
			ps.setDouble(3, totalAmount);
			ps.executeUpdate();

			System.out.println("Booking created: showId=" + showId + " userId=" + userId);

			ps.close();
			conn.close();
			return true;

		} catch (Exception e) {
			System.out.println("Failed to create booking");
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateBookingStatus(int bookingId, String status) {
		String normalised = status != null ? status.toLowerCase() : "pending";
		String sql = "UPDATE Booking SET status = ? WHERE booking_id = ?";

		try {
			Connection conn = DBconfig.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, normalised);
			ps.setInt(2, bookingId);
			ps.executeUpdate();
			ps.close();
			conn.close();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteBooking(int bookingId) {
		try {
			Connection conn = DBconfig.getConnection();
			conn.setAutoCommit(false);

			// delete payment first since it has no cascade from booking
			PreparedStatement ps1 = conn.prepareStatement("DELETE FROM Payment WHERE booking_id = ?");
			ps1.setInt(1, bookingId);
			ps1.executeUpdate();
			ps1.close();

			// deleting booking cascades to ticket and ticket_seat
			PreparedStatement ps2 = conn.prepareStatement("DELETE FROM Booking WHERE booking_id = ?");
			ps2.setInt(1, bookingId);
			ps2.executeUpdate();
			ps2.close();

			conn.commit();
			conn.close();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public int getTotalBookings() {
		String sql = "SELECT COUNT(*) FROM Booking";
		try {
			Connection conn = DBconfig.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				rs.close();
				ps.close();
				conn.close();
				return count;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public double getTotalRevenue() {
		String sql = "SELECT COALESCE(SUM(total_amount), 0) FROM Booking WHERE status = 'confirmed'";
		try {
			Connection conn = DBconfig.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				double total = rs.getDouble(1);
				rs.close();
				ps.close();
				conn.close();
				return total;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}