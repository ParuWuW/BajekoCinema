package com.bajekocinema.services;

import java.util.List;

import com.bajekocinema.dao.BookingDAO;
import com.bajekocinema.model.BookingModel;

public class PreviousBookingService {
	private BookingDAO bookingDAO = new BookingDAO();

    public List<BookingModel> getPreviousBookings(int userId) {
        return bookingDAO.getBookingsByUserId(userId);
    }

}
