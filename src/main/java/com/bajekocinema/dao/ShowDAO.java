package com.bajekocinema.dao;

import com.bajekocinema.model.HallModel;
import com.bajekocinema.model.ShowModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShowDAO {

    // ---------------------------------------------------------------
    // `show` is a reserved word in some SQL dialects — always backtick.
    // ---------------------------------------------------------------
    private static final String BASE_SELECT =
        "SELECT show_id, movie_id, theatre_id, hall_id, " +
        "       show_date, start_time, status " +
        "FROM `show` ";

    public List<ShowModel> getAllShows() {
        List<ShowModel> shows = new ArrayList<>();
        String sql = BASE_SELECT + "ORDER BY show_date ASC, start_time ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) shows.add(mapRow(rs));
        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch all shows");
            e.printStackTrace();
        }
        return shows;
    }

    public List<ShowModel> getScheduledShows() {
        List<ShowModel> shows = new ArrayList<>();
        String sql = BASE_SELECT +
                     "WHERE status = 'scheduled' " +
                     "ORDER BY show_date ASC, start_time ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) shows.add(mapRow(rs));
        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch scheduled shows");
            e.printStackTrace();
        }
        return shows;
    }

    public ShowModel getShowByID(int showID) {
        String sql = BASE_SELECT + "WHERE show_id = ?";

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

    public List<ShowModel> getShowsByMovieID(int movieID) {
        List<ShowModel> shows = new ArrayList<>();
        String sql = BASE_SELECT +
                     "WHERE movie_id = ? AND status = 'scheduled' " +
                     "ORDER BY show_date ASC, start_time ASC";

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

    public List<ShowModel> getShowsByMovieAndHall(int movieID, int hallID) {
        List<ShowModel> shows = new ArrayList<>();
        String sql = BASE_SELECT +
                     "WHERE movie_id = ? AND hall_id = ? AND status = 'scheduled' " +
                     "ORDER BY show_date ASC, start_time ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieID);
            ps.setInt(2, hallID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) shows.add(mapRow(rs));
            }
        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch shows for movieID="
                    + movieID + " hallID=" + hallID);
            e.printStackTrace();
        }
        return shows;
    }

    // ---------------------------------------------------------------
    // Hall lookups
    // ---------------------------------------------------------------
    public List<HallModel> getAllHalls() {
        List<HallModel> halls = new ArrayList<>();
        String sql = "SELECT hall_id, theatre_id, hall_name, total_seats " +
                     "FROM hall ORDER BY hall_name ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) halls.add(mapHall(rs));
        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch halls");
            e.printStackTrace();
        }
        return halls;
    }

    public List<HallModel> getHallsByMovie(int movieID) {
        List<HallModel> halls = new ArrayList<>();
        String sql = "SELECT DISTINCT h.hall_id, h.theatre_id, h.hall_name, h.total_seats " +
                     "FROM hall h " +
                     "JOIN `show` s ON s.hall_id = h.hall_id " +
                     "WHERE s.movie_id = ? AND s.status = 'scheduled' " +
                     "ORDER BY h.hall_name ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, movieID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) halls.add(mapHall(rs));
            }
        } catch (Exception e) {
            System.out.println("ShowDAO: failed to fetch halls for movieID=" + movieID);
            e.printStackTrace();
        }
        return halls;
    }

    // ---------------------------------------------------------------
    // Insert a new show
    // ---------------------------------------------------------------
    public int scheduleShow(int movieID, int theatreID, int hallID,
                            Date showDate, Time startTime) {
        String sql = "INSERT INTO `show` (movie_id, theatre_id, hall_id, show_date, start_time, status) " +
                     "VALUES (?, ?, ?, ?, ?, 'scheduled')";
        int newShowId = -1;

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, movieID);
            ps.setInt(2, theatreID);
            ps.setInt(3, hallID);
            ps.setDate(4, showDate);
            ps.setTime(5, startTime);
            ps.executeUpdate();

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) newShowId = keys.getInt(1);
            }
            System.out.println("ShowDAO: scheduled show_id=" + newShowId
                    + " movie_id=" + movieID + " hall_id=" + hallID);
        } catch (Exception e) {
            System.out.println("ShowDAO: failed to schedule show");
            e.printStackTrace();
        }
        return newShowId;
    }

    // ---------------------------------------------------------------
    // Row mappers
    // ---------------------------------------------------------------
    private ShowModel mapRow(ResultSet rs) throws SQLException {
        ShowModel show = new ShowModel();
        show.setShowID(rs.getInt("show_id"));
        show.setMovieID(rs.getInt("movie_id"));
        show.setTheatreID(rs.getInt("theatre_id"));
        show.setHallID(rs.getInt("hall_id"));
        show.setShowDate(rs.getDate("show_date"));
        show.setStartTime(rs.getTime("start_time"));
        show.setStatus(rs.getString("status"));
        return show;
    }

    private HallModel mapHall(ResultSet rs) throws SQLException {
        HallModel hall = new HallModel();
        hall.setHallID(rs.getInt("hall_id"));
        hall.setHallName(rs.getString("hall_name"));
        // If HallModel has these setters too, uncomment:
        // hall.setTheatreID(rs.getInt("theatre_id"));
        // hall.setTotalSeats(rs.getInt("total_seats"));
        return hall;
    }
}