package com.bajekocinema.dao;

import com.bajekocinema.model.MovieModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {

    public List<MovieModel> getAllMovies() {
        List<MovieModel> movies = new ArrayList<>();
        try (Connection conn = DBconfig.getConnection()) {
            String sql = "SELECT * FROM `Movie`";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                movies.add(mapRow(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    public List<MovieModel> getMoviesByStatus(String status) {
        List<MovieModel> movies = new ArrayList<>();
        try (Connection conn = DBconfig.getConnection()) {
            String sql = "SELECT * FROM `Movie` WHERE status = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                movies.add(mapRow(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    public MovieModel getMovieById(int movieId) {
        try (Connection conn = DBconfig.getConnection()) {
            String sql = "SELECT * FROM `Movie` WHERE movie_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapRow(rs);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteMovie(int movieID) {
        try (Connection conn = DBconfig.getConnection()) {
            String sql = "DELETE FROM movie WHERE MovieID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieID);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private MovieModel mapRow(ResultSet rs) throws SQLException {
        MovieModel m = new MovieModel();
        m.setMovieId(rs.getInt("movie_id"));
        m.setTitle(rs.getString("title"));
        m.setGenre(rs.getString("genre"));
        m.setDescription(rs.getString("description"));
        m.setDurationMin(rs.getInt("duration_min"));
        m.setReleaseDate(rs.getDate("release_date"));
        m.setPosterUrl(rs.getString("poster_url"));
        m.setTrailerUrl(rs.getString("trailer_url"));
        m.setImdbScore(rs.getDouble("imdb_score"));
        m.setStatus(rs.getString("status"));
        return m;
    }
}
