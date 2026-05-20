package com.bajekocinema.services;

import com.bajekocinema.dao.MovieAdminDAO;
import com.bajekocinema.model.MovieAdminModel;

import java.util.List;

public class MovieAdminService {

    private MovieAdminDAO movieAdminDAO = new MovieAdminDAO();

    public List<MovieAdminModel> getAllMovies() throws Exception {
        return movieAdminDAO.getAllMovies();
    }

    public MovieAdminModel getMovieById(int movieId) {
        return movieAdminDAO.getMovieById(movieId);
    }

    public boolean addMovie(MovieAdminModel movie) throws Exception {
        return movieAdminDAO.addMovie(movie);
    }

    public boolean updateMovie(MovieAdminModel movie) throws Exception {
        return movieAdminDAO.updateMovie(movie);
    }

    public boolean deleteMovie(int movieID) throws Exception {
        return movieAdminDAO.deleteMovie(movieID);
    }

    public List<MovieAdminModel> getNowShowingMovies() {
        return movieAdminDAO.getMoviesByStatus("now_showing");
    }

    public List<MovieAdminModel> getUpcomingMovies() {
        return movieAdminDAO.getMoviesByStatus("upcoming");
    }

    public List<String> getMovieStatuses() {
        return movieAdminDAO.getMovieStatuses();
    }

    public List<String> getAllGenreNames() {
        return movieAdminDAO.getAllGenreNames();
    }

    public void addGenre(String genreName) {
        movieAdminDAO.addGenre(genreName);
    }
}