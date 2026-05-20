package com.bajekocinema.dao;

import com.bajekocinema.model.ShowAdminModel;
import com.bajekocinema.model.HallAdminModel;
import com.bajekocinema.model.TheatreAdminModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ShowAdminDAO {

    public List<ShowAdminModel> getAllShows() {
        List<ShowAdminModel> shows = new ArrayList<>();
        String sql = "SELECT s.show_id, s.movie_id, s.theatre_id, s.hall_id, "
                + "s.show_date, s.start_time, s.status, "
                + "m.title AS movie_title, h.hall_name, t.theatre_name "
                + "FROM Shows s "
                + "JOIN Movie m ON s.movie_id = m.movie_id "
                + "JOIN Hall h ON s.hall_id = h.hall_id "
                + "JOIN Theatre t ON s.theatre_id = t.theatre_id "
                + "ORDER BY s.show_date ASC, s.start_time ASC";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ShowAdminModel show = new ShowAdminModel();
                show.setShowId(rs.getInt("show_id"));
                show.setMovieId(rs.getInt("movie_id"));
                show.setTheatreId(rs.getInt("theatre_id"));
                show.setHallId(rs.getInt("hall_id"));
                show.setShowDate(rs.getString("show_date"));
                show.setStartTime(rs.getString("start_time"));
                show.setStatus(rs.getString("status"));
                show.setMovieTitle(rs.getString("movie_title"));
                show.setHallName(rs.getString("hall_name"));
                show.setTheatreName(rs.getString("theatre_name"));
                shows.add(show);
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            System.out.println("Failed to fetch shows");
            e.printStackTrace();
        }
        return shows;
    }

    public List<ShowAdminModel> getScheduledShows() {
        List<ShowAdminModel> shows = new ArrayList<>();
        String sql = "SELECT s.show_id, s.movie_id, s.theatre_id, s.hall_id, "
                + "s.show_date, s.start_time, s.status, "
                + "m.title AS movie_title, h.hall_name, t.theatre_name "
                + "FROM Shows s "
                + "JOIN Movie m ON s.movie_id = m.movie_id "
                + "JOIN Hall h ON s.hall_id = h.hall_id "
                + "JOIN Theatre t ON s.theatre_id = t.theatre_id "
                + "WHERE s.status = 'scheduled' "
                + "ORDER BY s.show_date ASC, s.start_time ASC";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ShowAdminModel show = new ShowAdminModel();
                show.setShowId(rs.getInt("show_id"));
                show.setMovieId(rs.getInt("movie_id"));
                show.setTheatreId(rs.getInt("theatre_id"));
                show.setHallId(rs.getInt("hall_id"));
                show.setShowDate(rs.getString("show_date"));
                show.setStartTime(rs.getString("start_time"));
                show.setStatus(rs.getString("status"));
                show.setMovieTitle(rs.getString("movie_title"));
                show.setHallName(rs.getString("hall_name"));
                show.setTheatreName(rs.getString("theatre_name"));
                shows.add(show);
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            System.out.println("Failed to fetch scheduled shows");
            e.printStackTrace();
        }
        return shows;
    }

    public List<ShowAdminModel> getShowsByMovieID(int movieID) {
        List<ShowAdminModel> shows = new ArrayList<>();
        String sql = "SELECT s.show_id, s.movie_id, s.theatre_id, s.hall_id, "
                + "s.show_date, s.start_time, s.status, "
                + "m.title AS movie_title, h.hall_name, t.theatre_name "
                + "FROM Shows s "
                + "JOIN Movie m ON s.movie_id = m.movie_id "
                + "JOIN Hall h ON s.hall_id = h.hall_id "
                + "JOIN Theatre t ON s.theatre_id = t.theatre_id "
                + "WHERE s.movie_id = ? "
                + "ORDER BY s.show_date ASC, s.start_time ASC";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ShowAdminModel show = new ShowAdminModel();
                show.setShowId(rs.getInt("show_id"));
                show.setMovieId(rs.getInt("movie_id"));
                show.setTheatreId(rs.getInt("theatre_id"));
                show.setHallId(rs.getInt("hall_id"));
                show.setShowDate(rs.getString("show_date"));
                show.setStartTime(rs.getString("start_time"));
                show.setStatus(rs.getString("status"));
                show.setMovieTitle(rs.getString("movie_title"));
                show.setHallName(rs.getString("hall_name"));
                show.setTheatreName(rs.getString("theatre_name"));
                shows.add(show);
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            System.out.println("Failed to fetch shows by movie");
            e.printStackTrace();
        }
        return shows;
    }

    public ShowAdminModel getShowByID(int showID) {
        ShowAdminModel show = null;
        String sql = "SELECT s.show_id, s.movie_id, s.theatre_id, s.hall_id, "
                + "s.show_date, s.start_time, s.status, "
                + "m.title AS movie_title, h.hall_name, t.theatre_name "
                + "FROM Shows s "
                + "JOIN Movie m ON s.movie_id = m.movie_id "
                + "JOIN Hall h ON s.hall_id = h.hall_id "
                + "JOIN Theatre t ON s.theatre_id = t.theatre_id "
                + "WHERE s.show_id = ?";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, showID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                show = new ShowAdminModel();
                show.setShowId(rs.getInt("show_id"));
                show.setMovieId(rs.getInt("movie_id"));
                show.setTheatreId(rs.getInt("theatre_id"));
                show.setHallId(rs.getInt("hall_id"));
                show.setShowDate(rs.getString("show_date"));
                show.setStartTime(rs.getString("start_time"));
                show.setStatus(rs.getString("status"));
                show.setMovieTitle(rs.getString("movie_title"));
                show.setHallName(rs.getString("hall_name"));
                show.setTheatreName(rs.getString("theatre_name"));
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            System.out.println("Failed to fetch show by ID");
            e.printStackTrace();
        }
        return show;
    }

    // ── Theatre methods ───────────────────────────────────────────────────────

    public List<TheatreAdminModel> getAllTheatres() {
        List<TheatreAdminModel> theatres = new ArrayList<>();
        String sql = "SELECT theatre_id, theatre_name, address, phone, email FROM Theatre ORDER BY theatre_name ASC";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TheatreAdminModel t = new TheatreAdminModel();
                t.setTheatreId(rs.getInt("theatre_id"));
                t.setTheatreName(rs.getString("theatre_name"));
                t.setAddress(rs.getString("address"));
                t.setPhone(rs.getString("phone"));
                t.setEmail(rs.getString("email"));
                theatres.add(t);
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            System.out.println("Failed to fetch theatres");
            e.printStackTrace();
        }
        return theatres;
    }

    public TheatreAdminModel getTheatreById(int theatreId) {
        TheatreAdminModel t = null;
        String sql = "SELECT theatre_id, theatre_name, address, phone, email FROM Theatre WHERE theatre_id = ?";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, theatreId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                t = new TheatreAdminModel();
                t.setTheatreId(rs.getInt("theatre_id"));
                t.setTheatreName(rs.getString("theatre_name"));
                t.setAddress(rs.getString("address"));
                t.setPhone(rs.getString("phone"));
                t.setEmail(rs.getString("email"));
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            System.out.println("Failed to fetch theatre by ID");
            e.printStackTrace();
        }
        return t;
    }

    public boolean addTheatre(String name, String address, String phone, String email) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "INSERT INTO Theatre (theatre_name, address, phone, email) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone == null || phone.isEmpty() ? null : phone);
            ps.setString(4, email == null || email.isEmpty() ? null : email);
            ps.executeUpdate();
            ps.close(); conn.close();
            return true;
        } catch (Exception e) {
            System.out.println("Failed to add theatre");
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateTheatre(int theatreId, String name, String address, String phone, String email) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "UPDATE Theatre SET theatre_name = ?, address = ?, phone = ?, email = ? WHERE theatre_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone == null || phone.isEmpty() ? null : phone);
            ps.setString(4, email == null || email.isEmpty() ? null : email);
            ps.setInt(5, theatreId);
            ps.executeUpdate();
            ps.close(); conn.close();
            return true;
        } catch (Exception e) {
            System.out.println("Failed to update theatre");
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteTheatre(int theatreId) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "DELETE FROM Theatre WHERE theatre_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, theatreId);
            ps.executeUpdate();
            ps.close(); conn.close();
            return true;
        } catch (Exception e) {
            System.out.println("Failed to delete theatre");
            e.printStackTrace();
            return false;
        }
    }

    // ── Hall methods ──────────────────────────────────────────────────────────

    public List<HallAdminModel> getAllHalls() {
        List<HallAdminModel> halls = new ArrayList<>();
        String sql = "SELECT h.hall_id, h.theatre_id, t.theatre_name, h.hall_name, h.total_seats "
                + "FROM Hall h "
                + "JOIN Theatre t ON h.theatre_id = t.theatre_id "
                + "ORDER BY t.theatre_name ASC, h.hall_name ASC";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HallAdminModel hall = new HallAdminModel();
                hall.setHallId(rs.getInt("hall_id"));
                hall.setTheatreId(rs.getInt("theatre_id"));
                hall.setTheatreName(rs.getString("theatre_name"));
                hall.setHallName(rs.getString("hall_name"));
                hall.setTotalSeats(rs.getInt("total_seats"));
                halls.add(hall);
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            System.out.println("Failed to fetch halls");
            e.printStackTrace();
        }
        return halls;
    }

    public List<HallAdminModel> getHallsByTheatre(int theatreId) {
        List<HallAdminModel> halls = new ArrayList<>();
        String sql = "SELECT h.hall_id, h.theatre_id, t.theatre_name, h.hall_name, h.total_seats "
                + "FROM Hall h "
                + "JOIN Theatre t ON h.theatre_id = t.theatre_id "
                + "WHERE h.theatre_id = ? "
                + "ORDER BY h.hall_name ASC";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, theatreId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HallAdminModel hall = new HallAdminModel();
                hall.setHallId(rs.getInt("hall_id"));
                hall.setTheatreId(rs.getInt("theatre_id"));
                hall.setTheatreName(rs.getString("theatre_name"));
                hall.setHallName(rs.getString("hall_name"));
                hall.setTotalSeats(rs.getInt("total_seats"));
                halls.add(hall);
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            System.out.println("Failed to fetch halls by theatre");
            e.printStackTrace();
        }
        return halls;
    }

    public HallAdminModel getHallById(int hallId) {
        HallAdminModel hall = null;
        String sql = "SELECT h.hall_id, h.theatre_id, t.theatre_name, h.hall_name, h.total_seats "
                + "FROM Hall h "
                + "JOIN Theatre t ON h.theatre_id = t.theatre_id "
                + "WHERE h.hall_id = ?";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, hallId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                hall = new HallAdminModel();
                hall.setHallId(rs.getInt("hall_id"));
                hall.setTheatreId(rs.getInt("theatre_id"));
                hall.setTheatreName(rs.getString("theatre_name"));
                hall.setHallName(rs.getString("hall_name"));
                hall.setTotalSeats(rs.getInt("total_seats"));
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            System.out.println("Failed to fetch hall by ID");
            e.printStackTrace();
        }
        return hall;
    }

    public boolean addHall(int theatreId, String hallName, int totalSeats) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "INSERT INTO Hall (theatre_id, hall_name, total_seats) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, theatreId);
            ps.setString(2, hallName);
            ps.setInt(3, totalSeats);
            ps.executeUpdate();
            ps.close(); conn.close();
            return true;
        } catch (Exception e) {
            System.out.println("Failed to add hall");
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateHall(int hallId, String hallName, int totalSeats) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "UPDATE Hall SET hall_name = ?, total_seats = ? WHERE hall_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, hallName);
            ps.setInt(2, totalSeats);
            ps.setInt(3, hallId);
            ps.executeUpdate();
            ps.close(); conn.close();
            return true;
        } catch (Exception e) {
            System.out.println("Failed to update hall");
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteHall(int hallId) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "DELETE FROM Hall WHERE hall_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, hallId);
            ps.executeUpdate();
            ps.close(); conn.close();
            return true;
        } catch (Exception e) {
            System.out.println("Failed to delete hall");
            e.printStackTrace();
            return false;
        }
    }

    public List<String> getShowStatuses() {
        List<String> statuses = new ArrayList<>();
        String sql = "SELECT COLUMN_TYPE FROM INFORMATION_SCHEMA.COLUMNS "
                + "WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'Shows' AND COLUMN_NAME = 'status'";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String columnType = rs.getString("COLUMN_TYPE");
                columnType = columnType.substring(5, columnType.length() - 1);
                String[] parts = columnType.split(",");
                for (String part : parts) {
                    statuses.add(part.trim().replace("'", ""));
                }
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            statuses.add("scheduled");
            statuses.add("cancelled");
            statuses.add("completed");
        }
        return statuses;
    }

    public void scheduleShow(int movieId, int theatreId, int hallId, String showDate, String startTime, String status) {
        String sql = "INSERT INTO Shows (movie_id, theatre_id, hall_id, show_date, start_time, status) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieId);
            ps.setInt(2, theatreId);
            ps.setInt(3, hallId);
            ps.setString(4, showDate);
            ps.setString(5, startTime);
            ps.setString(6, status != null && !status.isEmpty() ? status : "scheduled");
            ps.executeUpdate();
            ps.close(); conn.close();
        } catch (Exception e) {
            System.out.println("Failed to schedule show");
            e.printStackTrace();
        }
    }

    public boolean deleteShow(int showId) {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "DELETE FROM Shows WHERE show_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, showId);
            ps.executeUpdate();
            ps.close(); conn.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateShow(int showId, int hallId, String showDate, String startTime, String status) {
        String sql = "UPDATE Shows SET hall_id = ?, show_date = ?, start_time = ?, status = ? WHERE show_id = ?";
        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, hallId);
            ps.setString(2, showDate);
            ps.setString(3, startTime);
            ps.setString(4, status);
            ps.setInt(5, showId);
            ps.executeUpdate();
            ps.close(); conn.close();
            return true;
        } catch (Exception e) {
            System.out.println("Failed to update show");
            e.printStackTrace();
            return false;
        }
    }
}