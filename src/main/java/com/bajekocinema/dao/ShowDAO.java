package com.bajekocinema.dao;

import com.bajekocinema.model.ShowModel;
import com.bajekocinema.model.HallModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class ShowDAO {

    /**
     * Map a row from `shows` joined with movie/hall (and optionally theatre) into a ShowModel.
     * The JSPs read showDate + startTime directly and format them with fmt:formatDate,
     * so no synthesised showTiming string is needed.
     */
    private ShowModel mapShow(ResultSet rs, boolean hasTheatre) throws java.sql.SQLException {
        ShowModel show = new ShowModel();
        show.setShowID(rs.getInt("show_id"));
        show.setMovieID(rs.getInt("movie_id"));
        show.setHallID(rs.getInt("hall_id"));

        Date sd = rs.getDate("show_date");
        Time st = rs.getTime("start_time");
        show.setShowDate(sd);
        show.setStartTime(st);

        show.setMovieName(rs.getString("title"));
        show.setHallName(rs.getString("hall_name"));

        if (hasTheatre) {
            show.setTheatreID(rs.getInt("theatre_id"));
            show.setTheatreName(rs.getString("theatre_name"));
        }
        return show;
    }

    public List<ShowModel> getAllShows() {
        List<ShowModel> shows = new ArrayList<>();

        String sql = "SELECT s.show_id, s.movie_id, s.hall_id, s.theatre_id, " +
                     "       s.show_date, s.start_time, " +
                     "       m.title, h.hall_name, t.theatre_name " +
                     "FROM shows s " +
                     "JOIN movie m   ON m.movie_id   = s.movie_id " +
                     "JOIN hall h    ON h.hall_id    = s.hall_id " +
                     "JOIN theatre t ON t.theatre_id = s.theatre_id " +
                     "ORDER BY s.show_date ASC, s.start_time ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                shows.add(mapShow(rs, true));
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
     * Used by the admin booking dropdown — only future/scheduled shows.
     */
    public List<ShowModel> getScheduledShows() {
        List<ShowModel> shows = new ArrayList<>();

        String sql = "SELECT s.show_id, s.movie_id, s.hall_id, s.theatre_id, " +
                     "       s.show_date, s.start_time, " +
                     "       m.title, h.hall_name, t.theatre_name " +
                     "FROM shows s " +
                     "JOIN movie m   ON m.movie_id   = s.movie_id " +
                     "JOIN hall h    ON h.hall_id    = s.hall_id " +
                     "JOIN theatre t ON t.theatre_id = s.theatre_id " +
                     "WHERE s.status = 'scheduled' " +
                     "ORDER BY s.show_date ASC, s.start_time ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                shows.add(mapShow(rs, true));
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

        String sql = "SELECT hall_id, theatre_id, hall_name, total_seats FROM hall ORDER BY hall_id ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HallModel hall = new HallModel();
                hall.setHallID(rs.getInt("hall_id"));
                hall.setHallName(rs.getString("hall_name"));
                hall.setHallCapacity(rs.getInt("total_seats"));
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

    /**
     * Schedule a new show.
     *
     * showTiming may arrive as either "yyyy-MM-dd HH:mm[:ss]" (text input) or
     * "yyyy-MM-ddTHH:mm" (HTML datetime-local input). Both forms are accepted.
     *
     * showDuration is ignored — duration lives on the movie row.
     * theatre_id is looked up from the chosen hall, since each hall belongs to one theatre.
     */
    public void scheduleShow(String showTiming, String showDuration, int movieID, int hallID) {
        try {
            Connection conn = DBconfig.getConnection();

            // 1. Find theatre_id for the chosen hall
            int theatreID = -1;
            String hallSql = "SELECT theatre_id FROM hall WHERE hall_id = ?";
            PreparedStatement hps = conn.prepareStatement(hallSql);
            hps.setInt(1, hallID);
            ResultSet hrs = hps.executeQuery();
            if (hrs.next()) theatreID = hrs.getInt("theatre_id");
            hrs.close();
            hps.close();

            if (theatreID < 0) {
                System.out.println("Cannot schedule show: hall " + hallID + " not found");
                conn.close();
                return;
            }

            // 2. Parse showTiming into a date + time
            String normalised = showTiming == null ? "" : showTiming.trim().replace('T', ' ');
            // Accept "yyyy-MM-dd HH:mm" or "yyyy-MM-dd HH:mm:ss"
            String datePart;
            String timePart;
            int spaceIdx = normalised.indexOf(' ');
            if (spaceIdx > 0) {
                datePart = normalised.substring(0, spaceIdx);
                timePart = normalised.substring(spaceIdx + 1);
                // pad to HH:mm:ss if only HH:mm
                if (timePart.length() == 5) timePart = timePart + ":00";
            } else {
                System.out.println("Cannot parse showTiming: " + showTiming);
                conn.close();
                return;
            }

            Date showDate = Date.valueOf(datePart);
            Time startTime = Time.valueOf(timePart);

            // 3. Insert into shows
            String insertSql = "INSERT INTO shows (movie_id, theatre_id, hall_id, show_date, start_time, status) " +
                               "VALUES (?, ?, ?, ?, ?, 'scheduled')";
            PreparedStatement ps = conn.prepareStatement(insertSql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, movieID);
            ps.setInt(2, theatreID);
            ps.setInt(3, hallID);
            ps.setDate(4, showDate);
            ps.setTime(5, startTime);
            ps.executeUpdate();

            ResultSet keys = ps.getGeneratedKeys();
            int showID = 0;
            if (keys.next()) showID = keys.getInt(1);

            System.out.println("Show scheduled: ShowID=" + showID + " MovieID=" + movieID
                    + " HallID=" + hallID + " TheatreID=" + theatreID);

            keys.close();
            ps.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("Failed to schedule show");
            e.printStackTrace();
        }
    }

    public List<ShowModel> getShowsByMovieID(int movieID) {
        List<ShowModel> shows = new ArrayList<>();

        String sql = "SELECT s.show_id, s.movie_id, s.hall_id, s.theatre_id, " +
                     "       s.show_date, s.start_time, " +
                     "       m.title, h.hall_name, t.theatre_name " +
                     "FROM shows s " +
                     "JOIN movie m   ON m.movie_id   = s.movie_id " +
                     "JOIN hall h    ON h.hall_id    = s.hall_id " +
                     "JOIN theatre t ON t.theatre_id = s.theatre_id " +
                     "WHERE s.movie_id = ? " +
                     "ORDER BY s.show_date ASC, s.start_time ASC";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, movieID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                shows.add(mapShow(rs, true));
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

    public ShowModel getShowByID(int showID) {
        ShowModel show = null;

        String sql = "SELECT s.show_id, s.movie_id, s.hall_id, s.theatre_id, " +
                     "       s.show_date, s.start_time, " +
                     "       m.title, h.hall_name, t.theatre_name " +
                     "FROM shows s " +
                     "JOIN movie m   ON m.movie_id   = s.movie_id " +
                     "JOIN hall h    ON h.hall_id    = s.hall_id " +
                     "JOIN theatre t ON t.theatre_id = s.theatre_id " +
                     "WHERE s.show_id = ?";

        try {
            Connection conn = DBconfig.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, showID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                show = mapShow(rs, true);
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