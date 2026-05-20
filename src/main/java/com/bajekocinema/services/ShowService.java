package com.bajekocinema.services;

import com.bajekocinema.dao.ShowDAO;
import com.bajekocinema.model.ShowModel;
import com.bajekocinema.model.HallModel;
import com.bajekocinema.model.TheatreModel;

import java.util.List;

public class ShowService {

    private ShowDAO showDAO = new ShowDAO();

    public List<ShowModel> getAllShows() throws Exception {
        return showDAO.getAllShows();
    }

    public List<ShowModel> getScheduledShows() throws Exception {
        return showDAO.getScheduledShows();
    }

    public List<ShowModel> getShowsByMovieID(int movieID) throws Exception {
        return showDAO.getShowsByMovieID(movieID);
    }

    public ShowModel getShowByID(int showID) throws Exception {
        return showDAO.getShowByID(showID);
    }

    public void scheduleShow(int movieId, int theatreId, int hallId, String showDate, String startTime, String status) throws Exception {
        showDAO.scheduleShow(movieId, theatreId, hallId, showDate, startTime, status);
    }

    public List<HallModel> getAllHalls() throws Exception {
        return showDAO.getAllHalls();
    }

    public List<HallModel> getHallsByTheatre(int theatreId) throws Exception {
        return showDAO.getHallsByTheatre(theatreId);
    }

    public List<TheatreModel> getAllTheatres() throws Exception {
        return showDAO.getAllTheatres();
    }

    public TheatreModel getTheatreById(int theatreId) throws Exception {
        return showDAO.getTheatreById(theatreId);
    }

    public List<String> getShowStatuses() throws Exception {
        return showDAO.getShowStatuses();
    }

    public boolean deleteShow(int showId) throws Exception {
        return showDAO.deleteShow(showId);
    }

    public boolean updateShow(int showId, int hallId, String showDate, String startTime, String status) throws Exception {
        return showDAO.updateShow(showId, hallId, showDate, startTime, status);
    }
}