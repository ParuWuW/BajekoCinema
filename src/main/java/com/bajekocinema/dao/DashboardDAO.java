package com.bajekocinema.dao;

import com.bajekocinema.utils.DBconfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardDAO {

    public int getTotalBookings() {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "SELECT COUNT(*) FROM Booking WHERE status != 'cancelled'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                rs.close(); ps.close(); conn.close();
                return count;
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public double getTotalRevenue() {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "SELECT COALESCE(SUM(amount), 0) FROM Payment";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                double total = rs.getDouble(1);
                rs.close(); ps.close(); conn.close();
                return total;
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    public int getActiveMovies() {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "SELECT COUNT(*) FROM Movie WHERE status = 'now_showing'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                rs.close(); ps.close(); conn.close();
                return count;
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getRegisteredUsers() {
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "SELECT COUNT(*) FROM User";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                rs.close(); ps.close(); conn.close();
                return count;
            }
            rs.close(); ps.close(); conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}