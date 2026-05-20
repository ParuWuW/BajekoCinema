package com.bajekocinema.services;

import com.bajekocinema.dao.MovieDAO;
import com.bajekocinema.model.MovieModel;

import java.util.List;

public class MovieService {

    private MovieDAO movieDAO = new MovieDAO();

    public List<MovieModel> getAllMovies() throws Exception {
        return movieDAO.getAllMovies();
    }

    public MovieModel getMovieById(int movieId) {
        return movieDAO.getMovieById(movieId);
    }

    public boolean addMovie(MovieModel movie) throws Exception {
        return movieDAO.addMovie(movie);
    }

    public boolean updateMovie(MovieModel movie) throws Exception {
        return movieDAO.updateMovie(movie);
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

    public List<String> getMovieStatuses() {
        return movieDAO.getMovieStatuses();
    }

    public List<String> getAllGenreNames() {
        return movieDAO.getAllGenreNames();
    }

    public void addGenre(String genreName) {
        movieDAO.addGenre(genreName);
    }
}