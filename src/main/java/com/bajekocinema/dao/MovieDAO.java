package com.bajekocinema.dao;

import com.bajekocinema.model.MovieModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
	
	public MovieModel getMovieById(int movieId) {
	    MovieModel m = null;
	    try {
	        Connection conn = DBconfig.getConnection();
	        String sql = "SELECT * FROM movie WHERE movie_id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, movieId);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) m = mapMovie(rs);
	        rs.close(); ps.close(); conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return m;
	}

    public List<MovieModel> getAllMovies() {
        List<MovieModel> movies = new ArrayList<>();
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "SELECT * FROM `Movie`";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                movies.add(mapMovie(rs));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    public List<MovieModel> getMoviesByStatus(String status) {
        List<MovieModel> movies = new ArrayList<>();
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "SELECT * FROM `Movie` WHERE status = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                movies.add(mapMovie(rs));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    /**
     * Distinct scheduled show dates (today onward) for movies that are
     * currently 'now_showing'.
     */
    public List<Date> getDistinctScheduledShowDates() {
        List<Date> dates = new ArrayList<>();
        try {
            Connection conn = DBconfig.getConnection();
            String sql =
                "SELECT DISTINCT s.show_date " +
                "FROM shows s " +
                "JOIN movie m ON m.movie_id = s.movie_id " +
                "WHERE s.status = 'scheduled' " +
                "  AND m.status = 'now_showing' " +
                "  AND s.show_date >= CURDATE() " +
                "ORDER BY s.show_date ASC";

            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dates.add(rs.getDate("show_date"));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dates;
    }

    /**
     * Now-showing movies, optionally filtered by date and/or genre.
     */
    public List<MovieModel> getNowShowingMovies(String dateFilter, String genreFilter) {
        List<MovieModel> movies = new ArrayList<>();

        // Build SQL with plain concatenation. Both filters are optional.
        String sql = "SELECT DISTINCT m.* FROM movie m " +
                     "JOIN shows s ON s.movie_id = m.movie_id " +
                     "WHERE m.status = 'now_showing' " +
                     "  AND s.status = 'scheduled' " +
                     "  AND s.show_date >= CURDATE()";

        if (dateFilter != null && !dateFilter.isEmpty()) {
            sql += " AND s.show_date = ?";
        }
        if (genreFilter != null && !genreFilter.isEmpty()) {
            sql += " AND m.genre = ?";
        }
        sql += " ORDER BY m.title ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            int idx = 1;
            if (dateFilter != null && !dateFilter.isEmpty()) {
                ps.setDate(idx++, Date.valueOf(dateFilter));
            }
            if (genreFilter != null && !genreFilter.isEmpty()) {
                ps.setString(idx++, genreFilter);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                movies.add(mapMovie(rs));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }
    
    /**
     * Upcoming movies, optionally filtered by genre.
     */
    public List<MovieModel> getUpcomingMovies(String genreFilter) {
        List<MovieModel> movies = new ArrayList<>();

        String sql = "SELECT * FROM movie WHERE status = 'upcoming'";

        if (genreFilter != null && !genreFilter.isEmpty()) {
            sql += " AND genre = ?";
        }
        sql += " ORDER BY release_date ASC, title ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            if (genreFilter != null && !genreFilter.isEmpty()) {
                ps.setString(1, genreFilter);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                movies.add(mapMovie(rs));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    // Small helper to avoid repeating the row->model mapping
    private MovieModel mapMovie(ResultSet rs) throws SQLException {
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
    
    /**
     * Now-showing movies whose title matches the search keyword.
     * Only returns movies that have at least one scheduled show today or later.
     */
    public List<MovieModel> searchNowShowingByTitle(String keyword) {
        List<MovieModel> movies = new ArrayList<>();

        String sql = "SELECT DISTINCT m.* FROM movie m " +
                     "JOIN shows s ON s.movie_id = m.movie_id " +
                     "WHERE m.status = 'now_showing' " +
                     "  AND s.status = 'scheduled' " +
                     "  AND s.show_date >= CURDATE() " +
                     "  AND m.title LIKE ? " +
                     "ORDER BY m.title ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                movies.add(mapMovie(rs));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }

    /**
     * Upcoming movies whose title matches the search keyword.
     */
    public List<MovieModel> searchUpcomingByTitle(String keyword) {
        List<MovieModel> movies = new ArrayList<>();

        String sql = "SELECT * FROM movie " +
                     "WHERE status = 'upcoming' " +
                     "  AND title LIKE ? " +
                     "ORDER BY release_date ASC, title ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                movies.add(mapMovie(rs));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }
}