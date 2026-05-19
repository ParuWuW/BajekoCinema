package com.bajekocinema.dao;

import com.bajekocinema.model.GenreModel;
import com.bajekocinema.utils.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GenreDAO {

    public List<GenreModel> getAllGenres() {
        List<GenreModel> genres = new ArrayList<>();
        try {
            Connection conn = DBconfig.getConnection();
            String sql = "SELECT genre_name FROM genre ORDER BY genre_name ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                GenreModel g = new GenreModel();
                g.setGenreName(rs.getString("genre_name"));
                genres.add(g);
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return genres;
    }
}