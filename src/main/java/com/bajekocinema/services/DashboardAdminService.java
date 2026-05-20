package com.bajekocinema.services;

import com.bajekocinema.dao.DashboardAdminDAO;

public class DashboardAdminService {

    private DashboardAdminDAO dashboardAdminDAO = new DashboardAdminDAO();

    public int getTotalBookings() throws Exception {
        return dashboardAdminDAO.getTotalBookings();
    }

    public double getTotalRevenue() throws Exception {
        return dashboardAdminDAO.getTotalRevenue();
    }

    public int getActiveMovies() throws Exception {
        return dashboardAdminDAO.getActiveMovies();
    }

    public int getRegisteredUsers() throws Exception {
        return dashboardAdminDAO.getRegisteredUsers();
    }
}