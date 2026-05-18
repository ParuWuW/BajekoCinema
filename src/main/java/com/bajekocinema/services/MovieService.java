package com.bajekocinema.services;

import com.bajekocinema.dao.MovieDAO;
import com.bajekocinema.model.MovieModel;
import java.util.List;

public class MovieService {
    private MovieDAO movieDAO = new MovieDAO();

    public List<MovieModel> getAllMovies() throws Exception {
        return movieDAO.getAllMovies();
    }

    public boolean addMovie(MovieModel movie) throws Exception {
        return movieDAO.addMovie(movie);
    }

    public boolean deleteMovie(int movieID) throws Exception {
        return movieDAO.deleteMovie(movieID);
    }
}