package com.bajekocinema.services;

import com.bajekocinema.dao.GenreDAO;
import com.bajekocinema.dao.MovieDAO;
import com.bajekocinema.model.GenreModel;
import com.bajekocinema.model.MovieModel;

import java.sql.Date;
import java.util.List;

public class MovieService {
    private MovieDAO movieDAO = new MovieDAO();
    private GenreDAO genreDAO = new GenreDAO();

    public List<MovieModel> getAllMovies() {
        return movieDAO.getAllMovies();
    }

    public List<Date> getNowShowingDates() {
        return movieDAO.getDistinctScheduledShowDates();
    }

    // Genres come straight from the genre table now
    public List<GenreModel> getAllGenres() {
        return genreDAO.getAllGenres();
    }

    // Filtered now-showing movies
    public List<MovieModel> getNowShowingMovies(String dateFilter, String genreFilter) {
        return movieDAO.getNowShowingMovies(dateFilter, genreFilter);
    }
    
    public List<MovieModel> getUpcomingMovies(String genreFilter) {
        return movieDAO.getUpcomingMovies(genreFilter);
    }
    
    public List<MovieModel> getNowShowingMovies() {
        return movieDAO.getNowShowingMovies(null, null);
    }

    public List<MovieModel> getUpcomingMovies() {
        return movieDAO.getUpcomingMovies(null);
    }
}