package com.bajekocinema.services;

import java.util.List;
import com.bajekocinema.dao.ManagementAdminDAO;
import com.bajekocinema.model.HallAdminModel;
import com.bajekocinema.model.TheatreAdminModel;

public class ManagementAdminService {
    private ManagementAdminDAO managementAdminDAO = new ManagementAdminDAO();

    public List<TheatreAdminModel> getAllTheatres() throws Exception {
        return managementAdminDAO.getAllTheatres();
    }

    public void addTheatre(String name) throws Exception {
    	managementAdminDAO.addTheatre(name);
    }

    public void deleteTheatre(int theatreId) throws Exception {
    	managementAdminDAO.deleteTheatre(theatreId);
    }

    public List<HallAdminModel> getAllHalls() throws Exception {
        return managementAdminDAO.getAllHalls();
    }

    public void addHall(int theatreId, String name) throws Exception {
    	managementAdminDAO.addHall(theatreId, name);
    }

    public void deleteHall(int hallId) throws Exception {
    	managementAdminDAO.deleteHall(hallId);
    }
}
