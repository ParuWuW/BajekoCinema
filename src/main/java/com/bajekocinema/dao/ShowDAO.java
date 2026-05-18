package com.bajekocinema.dao;

import com.bajekocinema.model.HallModel;
import com.bajekocinema.model.ShowModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShowDAO {

    public List<ShowModel> getAllShows() {
        List<ShowModel> shows = new ArrayList<>();

        String sql = "SELECT s.ShowTiming, s.ShowDuration, m.MovieName, h.HallName " +
                     "FROM shows s " +
                     "JOIN hallShow hs ON s.ShowID = hs.ShowID " +
                     "JOIN movie m ON hs.MovieID = m.MovieID " +
                     "JOIN hall h ON hs.HallID = h.HallID";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ShowModel show = new ShowModel();
                show.setShowTiming(rs.getString("ShowTiming"));
                show.setShowDuration(rs.getString("ShowDuration"));
                show.setMovieName(rs.getString("MovieName"));
                show.setHallName(rs.getString("HallName"));
                shows.add(show);
            }

        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch all shows");
            e.printStackTrace();
        }

        return shows;
    }

    public List<ShowModel> getScheduledShows() {
        List<ShowModel> shows = new ArrayList<>();

        String sql = "SELECT s.ShowID, s.ShowTiming, s.ShowDuration, " +
                     "m.MovieID, m.MovieName, h.HallID, h.HallName " +
                     "FROM shows s " +
                     "JOIN hallShow hs ON s.ShowID = hs.ShowID " +
                     "JOIN movie m ON hs.MovieID = m.MovieID " +
                     "JOIN hall h ON hs.HallID = h.HallID " +
                     "ORDER BY s.ShowTiming ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                shows.add(mapRow(rs));
            }

        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch scheduled shows");
            e.printStackTrace();
        }

        return shows;
    }

    public List<HallModel> getAllHalls() {
        List<HallModel> halls = new ArrayList<>();

        String sql = "SELECT HallID, HallName FROM hall";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                HallModel hall = new HallModel();
                hall.setHallID(rs.getInt("HallID"));
                hall.setHallName(rs.getString("HallName"));
                halls.add(hall);
            }

        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch halls");
            e.printStackTrace();
        }

        return halls;
    }

    public void scheduleShow(String showTiming, String showDuration, int movieID, int hallID) {
        try (Connection conn = DBconfig.getConnection()) {

            String insertShow = "INSERT INTO shows (ShowTiming, ShowDuration) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertShow, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, showTiming);
            ps.setString(2, showDuration);
            ps.executeUpdate();

            ResultSet keys = ps.getGeneratedKeys();
            int showID = 0;
            if (keys.next()) showID = keys.getInt(1);

            String insertHallShow = "INSERT INTO hallShow (UserID, MovieID, TheatreID, HallID, ShowID) VALUES (1, ?, 1, ?, ?)";
            PreparedStatement ps2 = conn.prepareStatement(insertHallShow);
            ps2.setInt(1, movieID);
            ps2.setInt(2, hallID);
            ps2.setInt(3, showID);
            ps2.executeUpdate();

            System.out.println("ShowDAO: scheduled ShowID=" + showID + " MovieID=" + movieID + " HallID=" + hallID);

        } catch (Exception e) {
            System.out.println("ShowDAO: failed to schedule show");
            e.printStackTrace();
        }
    }

    public List<ShowModel> getShowsByMovieID(int movieID) {
        List<ShowModel> shows = new ArrayList<>();

        String sql = "SELECT s.ShowID, s.ShowTiming, s.ShowDuration, " +
                     "m.MovieID, m.MovieName, h.HallID, h.HallName " +
                     "FROM shows s " +
                     "JOIN hallShow hs ON s.ShowID = hs.ShowID " +
                     "JOIN movie m ON hs.MovieID = m.MovieID " +
                     "JOIN hall h ON hs.HallID = h.HallID " +
                     "WHERE m.MovieID = ? " +
                     "ORDER BY s.ShowTiming ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, movieID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) shows.add(mapRow(rs));
            }

        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch shows by movieID=" + movieID);
            e.printStackTrace();
        }

        return shows;
    }

    public ShowModel getShowByID(int showID) {
        String sql = "SELECT s.ShowID, s.ShowTiming, s.ShowDuration, " +
                     "m.MovieID, m.MovieName, h.HallID, h.HallName " +
                     "FROM shows s " +
                     "JOIN hallShow hs ON s.ShowID = hs.ShowID " +
                     "JOIN movie m ON hs.MovieID = m.MovieID " +
                     "JOIN hall h ON hs.HallID = h.HallID " +
                     "WHERE s.ShowID = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, showID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }

        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch showID=" + showID);
            e.printStackTrace();
        }

        return null;
    }

    public List<HallModel> getHallsByMovie(int movieID) {
        List<HallModel> halls = new ArrayList<>();

        String sql = "SELECT DISTINCT h.HallID, h.HallName " +
                     "FROM hall h " +
                     "JOIN hallShow hs ON hs.HallID = h.HallID " +
                     "WHERE hs.MovieID = ? " +
                     "ORDER BY h.HallName ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, movieID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    HallModel hall = new HallModel();
                    hall.setHallID(rs.getInt("HallID"));
                    hall.setHallName(rs.getString("HallName"));
                    halls.add(hall);
                }
            }

        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch halls for movieID=" + movieID);
            e.printStackTrace();
        }

        return halls;
    }

    public List<ShowModel> getShowsByMovieAndHall(int movieID, int hallID) {
        List<ShowModel> shows = new ArrayList<>();

        String sql = "SELECT s.ShowID, s.ShowTiming, s.ShowDuration, " +
                     "m.MovieID, m.MovieName, h.HallID, h.HallName " +
                     "FROM shows s " +
                     "JOIN hallShow hs ON hs.ShowID = s.ShowID " +
                     "JOIN movie m     ON hs.MovieID = m.MovieID " +
                     "JOIN hall h      ON hs.HallID  = h.HallID " +
                     "WHERE m.MovieID = ? AND h.HallID = ? " +
                     "ORDER BY s.ShowTiming ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, movieID);
            ps.setInt(2, hallID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) shows.add(mapRow(rs));
            }

        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch shows for movieID=" + movieID + " hallID=" + hallID);
            e.printStackTrace();
        }

        return shows;
    }

    private ShowModel mapRow(ResultSet rs) throws SQLException {
        ShowModel show = new ShowModel();
        show.setShowID(rs.getInt("ShowID"));
        show.setShowTiming(rs.getString("ShowTiming"));
        show.setShowDuration(rs.getString("ShowDuration"));
        show.setMovieID(rs.getInt("MovieID"));
        show.setMovieName(rs.getString("MovieName"));
        show.setHallID(rs.getInt("HallID"));
        show.setHallName(rs.getString("HallName"));

        Timestamp ts = rs.getTimestamp("ShowTiming");
        if (ts != null) {
            show.setShowDate(new java.util.Date(ts.getTime()));
            show.setStartTime(new java.util.Date(ts.getTime()));
        }
        show.setStatus("scheduled");

        return show;
    }
}
