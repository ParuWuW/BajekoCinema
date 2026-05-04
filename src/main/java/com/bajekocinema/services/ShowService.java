package com.bajekocinema.services;

import com.bajekocinema.dao.ShowDAO;
import com.bajekocinema.model.ShowModel;
import com.bajekocinema.model.HallModel;
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

    public void scheduleShow(String showTiming, String showDuration, int movieID, int hallID) throws Exception {
        showDAO.scheduleShow(showTiming, showDuration, movieID, hallID);
    }

    public List<HallModel> getAllHalls() throws Exception {
        return showDAO.getAllHalls();
    }
}