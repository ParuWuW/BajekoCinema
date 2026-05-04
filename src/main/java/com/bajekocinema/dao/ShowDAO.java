package com.bajekocinema.dao;

import com.bajekocinema.model.ShowModel;
import com.bajekocinema.model.HallModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ShowModel show = new ShowModel();
                show.setShowTiming(rs.getString("ShowTiming"));
                show.setShowDuration(rs.getString("ShowDuration"));
                show.setMovieName(rs.getString("MovieName"));
                show.setHallName(rs.getString("HallName"));
                shows.add(show);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("Failed to fetch shows");
            e.printStackTrace();
        }

        return shows;
    }

    /**
     * Gets shows with IDs included — used for the booking dropdown
     * so we can pass showID, movieID, hallID when creating a booking
     */
    public List<ShowModel> getScheduledShows() {
        List<ShowModel> shows = new ArrayList<>();

        String sql = "SELECT s.ShowID, s.ShowTiming, s.ShowDuration, " +
                     "m.MovieID, m.MovieName, h.HallID, h.HallName " +
                     "FROM shows s " +
                     "JOIN hallShow hs ON s.ShowID = hs.ShowID " +
                     "JOIN movie m ON hs.MovieID = m.MovieID " +
                     "JOIN hall h ON hs.HallID = h.HallID " +
                     "ORDER BY s.ShowTiming ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ShowModel show = new ShowModel();
                show.setShowID(rs.getInt("ShowID"));
                show.setShowTiming(rs.getString("ShowTiming"));
                show.setShowDuration(rs.getString("ShowDuration"));
                show.setMovieID(rs.getInt("MovieID"));
                show.setMovieName(rs.getString("MovieName"));
                show.setHallID(rs.getInt("HallID"));
                show.setHallName(rs.getString("HallName"));
                shows.add(show);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("Failed to fetch scheduled shows");
            e.printStackTrace();
        }

        return shows;
    }

    public List<HallModel> getAllHalls() {
        List<HallModel> halls = new ArrayList<>();

        String sql = "SELECT HallID, HallName FROM hall";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                HallModel hall = new HallModel();
                hall.setHallID(rs.getInt("HallID"));
                hall.setHallName(rs.getString("HallName"));
                halls.add(hall);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("Failed to fetch halls");
            e.printStackTrace();
        }

        return halls;
    }

    public void scheduleShow(String showTiming, String showDuration, int movieID, int hallID) {
        try {
            Connection conn = DBconfig.getConnection();

            // Step 1: insert into shows
            String insertShow = "INSERT INTO shows (ShowTiming, ShowDuration) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertShow, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, showTiming);
            ps.setString(2, showDuration);
            ps.executeUpdate();

            // Step 2: get generated ShowID
            ResultSet keys = ps.getGeneratedKeys();
            int showID = 0;
            if (keys.next()) {
                showID = keys.getInt(1);
            }

            // Step 3: insert into hallShow
            // UserID = 1 and TheatreID = 1 as defaults for now
            String insertHallShow = "INSERT INTO hallShow (UserID, MovieID, TheatreID, HallID, ShowID) VALUES (1, ?, 1, ?, ?)";
            PreparedStatement ps2 = conn.prepareStatement(insertHallShow);
            ps2.setInt(1, movieID);
            ps2.setInt(2, hallID);
            ps2.setInt(3, showID);
            ps2.executeUpdate();

            System.out.println("Show scheduled: ShowID=" + showID + " MovieID=" + movieID + " HallID=" + hallID);

            keys.close();
            ps2.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("Failed to schedule show");
            e.printStackTrace();
        }
    }

    // ADDED
    public List<ShowModel> getShowsByMovieID(int movieID) {
        List<ShowModel> shows = new ArrayList<>();

        String sql = "SELECT s.ShowID, s.ShowTiming, s.ShowDuration, "
                   + "m.MovieID, m.MovieName, h.HallID, h.HallName "
                   + "FROM shows s "
                   + "JOIN hallShow hs ON s.ShowID = hs.ShowID "
                   + "JOIN movie m ON hs.MovieID = m.MovieID "
                   + "JOIN hall h ON hs.HallID = h.HallID "
                   + "WHERE m.MovieID = ? "
                   + "ORDER BY s.ShowTiming ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ShowModel show = new ShowModel();
                show.setShowID(rs.getInt("ShowID"));
                show.setShowTiming(rs.getString("ShowTiming"));
                show.setShowDuration(rs.getString("ShowDuration"));
                show.setMovieID(rs.getInt("MovieID"));
                show.setMovieName(rs.getString("MovieName"));
                show.setHallID(rs.getInt("HallID"));
                show.setHallName(rs.getString("HallName"));
                shows.add(show);
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("Failed to fetch shows by movie");
            e.printStackTrace();
        }

        return shows;
    }

    // ADDED
    public ShowModel getShowByID(int showID) {
        ShowModel show = null;

        String sql = "SELECT s.ShowID, s.ShowTiming, s.ShowDuration, "
                   + "m.MovieID, m.MovieName, h.HallID, h.HallName "
                   + "FROM shows s "
                   + "JOIN hallShow hs ON s.ShowID = hs.ShowID "
                   + "JOIN movie m ON hs.MovieID = m.MovieID "
                   + "JOIN hall h ON hs.HallID = h.HallID "
                   + "WHERE s.ShowID = ?";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, showID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                show = new ShowModel();
                show.setShowID(rs.getInt("ShowID"));
                show.setShowTiming(rs.getString("ShowTiming"));
                show.setShowDuration(rs.getString("ShowDuration"));
                show.setMovieID(rs.getInt("MovieID"));
                show.setMovieName(rs.getString("MovieName"));
                show.setHallID(rs.getInt("HallID"));
                show.setHallName(rs.getString("HallName"));
            }

            rs.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("Failed to fetch show by ID");
            e.printStackTrace();
        }

        return show;
    }
}