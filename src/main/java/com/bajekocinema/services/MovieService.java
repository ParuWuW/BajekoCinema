package com.bajekocinema.services;

import com.bajekocinema.dao.MovieDAO;
import com.bajekocinema.model.MovieModel;
import java.util.List;

public class MovieService {
    private MovieDAO movieDAO = new MovieDAO();

    public List<MovieModel> getAllMovies() throws Exception {
        return movieDAO.getAllMovies();
    }

    public boolean deleteMovie(int movieID) throws Exception {
        return movieDAO.deleteMovie(movieID);
    }
    
    public List<MovieModel> getNowShowingMovies() {
        return movieDAO.getMoviesByStatus("now_showing");
    }

    public List<MovieModel> getUpcomingMovies() {
        return movieDAO.getMoviesByStatus("upcoming");
    }
}