package com.bajekocinema.services;

import com.bajekocinema.dao.BookingDAO;
import com.bajekocinema.model.BookingModel;
import java.util.List;

public class BookingService {

	private BookingDAO bookingDAO = new BookingDAO();

	public List<BookingModel> getAllBookings() throws Exception {
		return bookingDAO.getAllBookings();
	}

	public List<BookingModel> getBookingsByUserId(int userId) throws Exception {
		return bookingDAO.getBookingsByUserId(userId);
	}

	public boolean addBookingForShow(int showId, int userId, double totalAmount) throws Exception {
		return bookingDAO.addBookingForShow(showId, userId, totalAmount);
	}

	public boolean updateBookingStatus(int bookingID, String status) throws Exception {
		return bookingDAO.updateBookingStatus(bookingID, status);
	}

	public boolean deleteBooking(int bookingID) throws Exception {
		return bookingDAO.deleteBooking(bookingID);
	}

	public int getTotalBookings() {
		return bookingDAO.getTotalBookings();
	}

	public double getTotalRevenue() {
		return bookingDAO.getTotalRevenue();
	}

}