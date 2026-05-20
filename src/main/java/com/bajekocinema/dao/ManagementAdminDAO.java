package com.bajekocinema.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bajekocinema.model.HallAdminModel;
import com.bajekocinema.model.TheatreAdminModel;
import com.bajekocinema.utils.DBconfig;

public class ManagementAdminDAO {

    public List<TheatreAdminModel> getAllTheatres() throws Exception {
        List<TheatreAdminModel> theatres = new ArrayList<>();
        Connection con = DBconfig.getConnection();
        String sql = "SELECT * FROM `Theatre`";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            TheatreAdminModel t = new TheatreAdminModel();
            t.setTheatreId(rs.getInt("theatre_id"));
            t.setTheatreName(rs.getString("theatre_name"));
            t.setTheatreAddress(rs.getString("address"));
            theatres.add(t);
        }
        rs.close();
        pst.close();
        con.close();
        return theatres;
    }

    public void addTheatre(String name) throws Exception {
        Connection con = DBconfig.getConnection();
        String sql = "INSERT INTO `Theatre` (theatre_name) VALUES (?)";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, name);
        pst.executeUpdate();
        pst.close();
        con.close();
    }

    public void deleteTheatre(int theatreId) throws Exception {
        Connection con = DBconfig.getConnection();
        String sql = "DELETE FROM `Theatre` WHERE theatre_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, theatreId);
        pst.executeUpdate();
        pst.close();
        con.close();
    }

    public List<HallAdminModel> getAllHalls() throws Exception {
        List<HallAdminModel> halls = new ArrayList<>();
        Connection con = DBconfig.getConnection();
        // Join with Theatre to get theatre name
        String sql = "SELECT h.*, t.theatre_name FROM `Hall` h LEFT JOIN `Theatre` t ON h.theatre_id = t.theatre_id";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            HallAdminModel h = new HallAdminModel();
            h.setHallID(rs.getInt("hall_id"));
            h.setTheatreId(rs.getInt("theatre_id"));
            h.setTheatreName(rs.getString("theatre_name"));
            h.setHallName(rs.getString("hall_name"));
            h.setHallCapacity(rs.getInt("total_seats"));
            halls.add(h);
        }
        rs.close();
        pst.close();
        con.close();
        return halls;
    }

    public void addHall(int theatreId, String name) throws Exception {
        Connection con = DBconfig.getConnection();
        // Disable auto-commit to perform a transaction
        con.setAutoCommit(false);
        try {
            int totalSeats = 150; // Hardcoded requirement
            String sql = "INSERT INTO `Hall` (theatre_id, hall_name, total_seats) VALUES (?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, theatreId);
            pst.setString(2, name);
            pst.setInt(3, totalSeats);
            pst.executeUpdate();
            
            ResultSet rs = pst.getGeneratedKeys();
            int hallId = -1;
            if (rs.next()) {
                hallId = rs.getInt(1);
            }
            rs.close();
            pst.close();
            
            if (hallId != -1) {
                // Generate 150 seats: 10 rows (A-J), 15 seats per row
                String seatSql = "INSERT INTO `Seat` (hall_id, row_label, seat_number) VALUES (?, ?, ?)";
                PreparedStatement seatPst = con.prepareStatement(seatSql);
                char[] rows = {'A','B','C','D','E','F','G','H','I','J'};
                
                for (char row : rows) {
                    for (int i = 1; i <= 15; i++) {
                        seatPst.setInt(1, hallId);
                        seatPst.setString(2, String.valueOf(row));
                        seatPst.setInt(3, i);
                        seatPst.addBatch();
                    }
                }
                seatPst.executeBatch();
                seatPst.close();
            }
            
            con.commit();
        } catch (Exception e) {
            con.rollback();
            throw e;
        } finally {
            con.setAutoCommit(true);
            con.close();
        }
    }

    public void deleteHall(int hallId) throws Exception {
        Connection con = DBconfig.getConnection();
        String sql = "DELETE FROM `Hall` WHERE hall_id = ?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, hallId);
        pst.executeUpdate();
        pst.close();
        con.close();
    }
}
