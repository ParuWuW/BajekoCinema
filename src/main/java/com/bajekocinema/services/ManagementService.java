package com.bajekocinema.services;

import java.util.List;
import com.bajekocinema.dao.ManagementDAO;
import com.bajekocinema.model.HallModel;
import com.bajekocinema.model.TheatreModel;

public class ManagementService {
    private ManagementDAO managementDAO = new ManagementDAO();

    public List<TheatreModel> getAllTheatres() throws Exception {
        return managementDAO.getAllTheatres();
    }

    public void addTheatre(String name) throws Exception {
        managementDAO.addTheatre(name);
    }

    public void deleteTheatre(int theatreId) throws Exception {
        managementDAO.deleteTheatre(theatreId);
    }

    public List<HallModel> getAllHalls() throws Exception {
        return managementDAO.getAllHalls();
    }

    public void addHall(int theatreId, String name) throws Exception {
        managementDAO.addHall(theatreId, name);
    }

    public void deleteHall(int hallId) throws Exception {
        managementDAO.deleteHall(hallId);
    }
}
