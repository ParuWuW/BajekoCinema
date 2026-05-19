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

            String sql = "SELECT * FROM Movie";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

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

    // GET MOVIES BY STATUS
    public List<MovieModel> getMoviesByStatus(String status) {

        List<MovieModel> movies = new ArrayList<>();

        try {

            Connection conn = DBconfig.getConnection();

            String sql = "SELECT * FROM Movie WHERE status = ?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, status);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

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

    // ADD MOVIE
    public boolean addMovie(MovieModel movie) {

        try {

            Connection conn = DBconfig.getConnection();

            String sql = "INSERT INTO Movie (title, genre, description, duration_min, release_date, poster_url, trailer_url, imdb_score, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, movie.getTitle());
            ps.setString(2, movie.getGenre());
            ps.setString(3, movie.getDescription());
            ps.setInt(4, movie.getDurationMin());
            ps.setDate(5, new java.sql.Date(movie.getReleaseDate().getTime()));
            ps.setString(6, movie.getPosterUrl());
            ps.setString(7, movie.getTrailerUrl());
            ps.setDouble(8, movie.getImdbScore());
            ps.setString(9, movie.getStatus());

            ps.executeUpdate();

            ps.close();
            conn.close();

            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // EDIT MOVIE
    public boolean updateMovie(MovieModel movie) {

        try {

            Connection conn = DBconfig.getConnection();

            String sql;
            PreparedStatement ps;

            // only update poster/trailer if a new file was uploaded (non-empty url)
            if (movie.getPosterUrl() != null && !movie.getPosterUrl().isEmpty()
                    && movie.getTrailerUrl() != null && !movie.getTrailerUrl().isEmpty()) {

                sql = "UPDATE Movie SET title=?, genre=?, description=?, duration_min=?, release_date=?, "
                        + "poster_url=?, trailer_url=?, imdb_score=?, status=? WHERE movie_id=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, movie.getTitle());
                ps.setString(2, movie.getGenre());
                ps.setString(3, movie.getDescription());
                ps.setInt(4, movie.getDurationMin());
                ps.setDate(5, new java.sql.Date(movie.getReleaseDate().getTime()));
                ps.setString(6, movie.getPosterUrl());
                ps.setString(7, movie.getTrailerUrl());
                ps.setDouble(8, movie.getImdbScore());
                ps.setString(9, movie.getStatus());
                ps.setInt(10, movie.getMovieId());

            } else if (movie.getPosterUrl() != null && !movie.getPosterUrl().isEmpty()) {

                sql = "UPDATE Movie SET title=?, genre=?, description=?, duration_min=?, release_date=?, "
                        + "poster_url=?, imdb_score=?, status=? WHERE movie_id=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, movie.getTitle());
                ps.setString(2, movie.getGenre());
                ps.setString(3, movie.getDescription());
                ps.setInt(4, movie.getDurationMin());
                ps.setDate(5, new java.sql.Date(movie.getReleaseDate().getTime()));
                ps.setString(6, movie.getPosterUrl());
                ps.setDouble(7, movie.getImdbScore());
                ps.setString(8, movie.getStatus());
                ps.setInt(9, movie.getMovieId());

            } else if (movie.getTrailerUrl() != null && !movie.getTrailerUrl().isEmpty()) {

                sql = "UPDATE Movie SET title=?, genre=?, description=?, duration_min=?, release_date=?, "
                        + "trailer_url=?, imdb_score=?, status=? WHERE movie_id=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, movie.getTitle());
                ps.setString(2, movie.getGenre());
                ps.setString(3, movie.getDescription());
                ps.setInt(4, movie.getDurationMin());
                ps.setDate(5, new java.sql.Date(movie.getReleaseDate().getTime()));
                ps.setString(6, movie.getTrailerUrl());
                ps.setDouble(7, movie.getImdbScore());
                ps.setString(8, movie.getStatus());
                ps.setInt(9, movie.getMovieId());

            } else {

                sql = "UPDATE Movie SET title=?, genre=?, description=?, duration_min=?, release_date=?, "
                        + "imdb_score=?, status=? WHERE movie_id=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, movie.getTitle());
                ps.setString(2, movie.getGenre());
                ps.setString(3, movie.getDescription());
                ps.setInt(4, movie.getDurationMin());
                ps.setDate(5, new java.sql.Date(movie.getReleaseDate().getTime()));
                ps.setDouble(6, movie.getImdbScore());
                ps.setString(7, movie.getStatus());
                ps.setInt(8, movie.getMovieId());
            }

            ps.executeUpdate();
            ps.close();
            conn.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE MOVIE
    public boolean deleteMovie(int movieID) {

        try {

            Connection conn = DBconfig.getConnection();

            String sql = "DELETE FROM Movie WHERE movie_id = ?";

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

    // GET STATUS ENUM VALUES FROM DATABASE
    public List<String> getMovieStatuses() {

        List<String> statuses = new ArrayList<>();

        String sql = "SELECT COLUMN_TYPE FROM INFORMATION_SCHEMA.COLUMNS "
                + "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'Movie' AND COLUMN_NAME = 'status'";

        try {

            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // returns something like: enum('upcoming','now_showing','ended')
                String columnType = rs.getString("COLUMN_TYPE");
                // strip "enum(" from start and ")" from end
                columnType = columnType.substring(5, columnType.length() - 1);
                String[] parts = columnType.split(",");
                for (String part : parts) {
                    statuses.add(part.trim().replace("'", ""));
                }
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            // fallback in case query fails
            statuses.add("upcoming");
            statuses.add("now_showing");
            statuses.add("ended");
        }

        return statuses;
    }

    // GET ALL GENRE NAMES FROM GENRE TABLE
    public List<String> getAllGenreNames() {

        List<String> genres = new ArrayList<>();

        String sql = "SELECT genre_name FROM Genre ORDER BY genre_name ASC";

        try {

            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                genres.add(rs.getString("genre_name"));
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return genres;
    }

    // ADD GENRE TO GENRE TABLE
    public void addGenre(String genreName) {

        String sql = "INSERT IGNORE INTO Genre (genre_name) VALUES (?)";

        try {

            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, genreName);
            ps.executeUpdate();
            ps.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}