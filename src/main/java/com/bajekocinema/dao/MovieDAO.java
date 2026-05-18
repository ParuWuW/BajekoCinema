package com.bajekocinema.dao;

import com.bajekocinema.model.MovieModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {

    public List<MovieModel> getAllMovies() {
        List<MovieModel> movies = new ArrayList<>();
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "SELECT * FROM movie";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                MovieModel m = new MovieModel();
                m.setMovieID(rs.getInt("MovieID"));
                m.setMovieName(rs.getString("MovieName"));
                m.setMovieLanguage(rs.getString("MovieLanguage"));
                m.setMovieReleaseDate(rs.getDate("MovieReleaseDate"));
                m.setMovieDuration(rs.getString("MovieDuration"));
                m.setMovieGenre(rs.getString("MovieGenre"));
                m.setMovieDescription(rs.getString("MovieDescription"));
                movies.add(m);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    public boolean addMovie(MovieModel movie) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "INSERT INTO movie (MovieName, MovieLanguage, MovieReleaseDate, MovieDuration, MovieGenre, MovieDescription) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, movie.getMovieName());
            ps.setString(2, movie.getMovieLanguage());
            ps.setDate(3, new java.sql.Date(movie.getMovieReleaseDate().getTime()));
            ps.setString(4, movie.getMovieDuration());
            ps.setString(5, movie.getMovieGenre());
            ps.setString(6, movie.getMovieDescription());
            ps.executeUpdate();
            ps.close();
            conn.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteMovie(int movieID) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "DELETE FROM movie WHERE MovieID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieID);
            ps.executeUpdate();
            ps.close();
            conn.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}