package com.bajekocinema.services;

import com.bajekocinema.dao.ShowAdminDAO;
import com.bajekocinema.model.ShowAdminModel;
import com.bajekocinema.model.HallAdminModel;
import com.bajekocinema.model.TheatreAdminModel;

import java.util.List;

public class ShowAdminService {

    private ShowAdminDAO showAdminDAO = new ShowAdminDAO();

    public List<ShowAdminModel> getAllShows() throws Exception {
        return showAdminDAO.getAllShows();
    }

    public List<ShowAdminModel> getScheduledShows() throws Exception {
        return showAdminDAO.getScheduledShows();
    }

    public List<ShowAdminModel> getShowsByMovieID(int movieID) throws Exception {
        return showAdminDAO.getShowsByMovieID(movieID);
    }

    public ShowAdminModel getShowByID(int showID) throws Exception {
        return showAdminDAO.getShowByID(showID);
    }

    public void scheduleShow(int movieId, int theatreId, int hallId, String showDate, String startTime, String status) throws Exception {
        showAdminDAO.scheduleShow(movieId, theatreId, hallId, showDate, startTime, status);
    }

    public List<HallAdminModel> getAllHalls() throws Exception {
        return showAdminDAO.getAllHalls();
    }

    public List<HallAdminModel> getHallsByTheatre(int theatreId) throws Exception {
        return showAdminDAO.getHallsByTheatre(theatreId);
    }

    public List<TheatreAdminModel> getAllTheatres() throws Exception {
        return showAdminDAO.getAllTheatres();
    }

    public TheatreAdminModel getTheatreById(int theatreId) throws Exception {
        return showAdminDAO.getTheatreById(theatreId);
    }

    public List<String> getShowStatuses() throws Exception {
        return showAdminDAO.getShowStatuses();
    }

    public boolean deleteShow(int showId) throws Exception {
        return showAdminDAO.deleteShow(showId);
    }

    public boolean updateShow(int showId, int hallId, String showDate, String startTime, String status) throws Exception {
        return showAdminDAO.updateShow(showId, hallId, showDate, startTime, status);
    }
}