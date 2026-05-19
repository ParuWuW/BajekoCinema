package com.bajekocinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.bajekocinema.model.SeatModel;
import com.bajekocinema.utils.DBconfig;

public class SeatDAO {
    public LinkedHashMap<String, List<SeatModel>> getSeatsByHallGroupedByRow(int hallId, int showId) {
        LinkedHashMap<String, List<SeatModel>> seatsByRow = new LinkedHashMap<>();
        String sql =
        	    "SELECT s.seat_id, s.hall_id, s.row_label, s.seat_number, " +
        	    "  CASE WHEN b.booking_id IS NOT NULL THEN 'booked' ELSE 'available' END AS seat_status " +
        	    "FROM seat s " +
        	    "LEFT JOIN ticket_seat ts ON ts.seat_id   = s.seat_id " +
        	    "LEFT JOIN ticket      t  ON t.ticket_id  = ts.ticket_id " +
        	    "                        AND t.status     = 'active' " +
        	    "LEFT JOIN booking     b  ON b.booking_id = t.booking_id " +
        	    "                        AND b.show_id    = ? " +
        	    "                        AND b.status     IN ('pending','confirmed') " +
        	    "WHERE s.hall_id = ? " +
        	    "ORDER BY s.row_label ASC, s.seat_number ASC";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, showId);
            ps.setInt(2, hallId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    SeatModel seat = new SeatModel();
                    seat.setSeatId(rs.getInt("seat_id"));
                    seat.setHallId(rs.getInt("hall_id"));
                    seat.setRowLabel(rs.getString("row_label"));
                    seat.setSeatNumber(rs.getInt("seat_number"));
                    seatsByRow
                        .computeIfAbsent(seat.getRowLabel(), k -> new ArrayList<>())
                        .add(seat);
                }
            }
        } catch (Exception e) {
            System.out.println("SeatDAO: failed to load seats for hallId=" + hallId + " showId=" + showId);
            e.printStackTrace();
        }
        return seatsByRow;
    }

    /**
     * Flat seat list for a hall — used for POST validation.
     * Note: does NOT include seat_status. Do not use for rendering.
     */
    public List<SeatModel> getSeatsByHall(int hallId) {
        List<SeatModel> seats = new ArrayList<>();
        String sql = "SELECT seat_id, hall_id, row_label, seat_number " +
                     "FROM seat WHERE hall_id = ? " +
                     "ORDER BY row_label ASC, seat_number ASC";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, hallId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    SeatModel seat = new SeatModel();
                    seat.setSeatId(rs.getInt("seat_id"));
                    seat.setHallId(rs.getInt("hall_id"));
                    seat.setRowLabel(rs.getString("row_label"));
                    seat.setSeatNumber(rs.getInt("seat_number"));
                    seats.add(seat);
                }
            }
        } catch (Exception e) {
            System.out.println("SeatDAO: failed to load seats for hallId=" + hallId);
            e.printStackTrace();
        }
        return seats;
    }
    
    public boolean areSeatsAvailable(List<Integer> seatIds, int hallId, int showId) {
        if (seatIds == null || seatIds.isEmpty()) return false;

        StringBuilder placeholders = new StringBuilder();
        for (int i = 0; i < seatIds.size(); i++) {
            placeholders.append(i == 0 ? "?" : ",?");
        }

        String sql =
            "SELECT COUNT(*) FROM seat s " +
            "WHERE s.seat_id IN (" + placeholders + ") " +
            "AND   s.hall_id = ? " +
            "AND   s.seat_id NOT IN ( " +
            "  SELECT ts.seat_id " +
            "  FROM   ticket_seat ts " +
            "  JOIN   ticket  t ON t.ticket_id  = ts.ticket_id " +
            "  JOIN   booking b ON b.booking_id = t.booking_id " +
            "  WHERE  b.show_id = ? " +
            "  AND    b.status  IN ('pending','confirmed') " +
            "  AND    t.status  = 'active' " +
            ")";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            int idx = 1;
            for (Integer id : seatIds) ps.setInt(idx++, id);
            ps.setInt(idx++, hallId);
            ps.setInt(idx,   showId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1) == seatIds.size();
            }
        } catch (Exception e) {
            System.out.println("SeatDAO: availability check failed");
            e.printStackTrace();
        }
        return false;
    }

}
