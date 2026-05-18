package com.bajekocinema.services;

import com.bajekocinema.dao.BookingDAO;
import com.bajekocinema.model.BookingModel;
import java.util.List;

public class BookingService {
    private BookingDAO bookingDAO = new BookingDAO();

    public List<BookingModel> getAllBookings() throws Exception {
        return bookingDAO.getAllBookings();
    }

    public boolean addBookingForShow(int showID, int movieID, int hallID) throws Exception {
        return bookingDAO.addBookingForShow(showID, movieID, hallID);
    }

    public boolean updateBookingStatus(int bookingID, String status) throws Exception {
        return bookingDAO.updateBookingStatus(bookingID, status);
    }

    public boolean deleteBooking(int bookingID) throws Exception {
        return bookingDAO.deleteBooking(bookingID);
    }
    
}