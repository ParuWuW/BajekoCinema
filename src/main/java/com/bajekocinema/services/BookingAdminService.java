package com.bajekocinema.services;

import com.bajekocinema.dao.BookingAdminDAO;
import com.bajekocinema.model.BookingAdminModel;
import java.util.List;

public class BookingAdminService {

	private BookingAdminDAO bookingAdminDAO = new BookingAdminDAO();

	public List<BookingAdminModel> getAllBookings() throws Exception {
		return bookingAdminDAO.getAllBookings();
	}

	public List<BookingAdminModel> getBookingsByUserId(int userId) throws Exception {
		return bookingAdminDAO.getBookingsByUserId(userId);
	}

	public boolean addBookingForShow(int showId, int userId, double totalAmount) throws Exception {
		return bookingAdminDAO.addBookingForShow(showId, userId, totalAmount);
	}

	public boolean updateBookingStatus(int bookingID, String status) throws Exception {
		return bookingAdminDAO.updateBookingStatus(bookingID, status);
	}

	public boolean deleteBooking(int bookingID) throws Exception {
		return bookingAdminDAO.deleteBooking(bookingID);
	}

	public int getTotalBookings() {
		return bookingAdminDAO.getTotalBookings();
	}

	public double getTotalRevenue() {
		return bookingAdminDAO.getTotalRevenue();
	}

}