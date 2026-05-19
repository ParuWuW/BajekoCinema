package com.bajekocinema.services;

import com.bajekocinema.dao.DashboardDAO;

public class DashboardService {

    private DashboardDAO dashboardDAO = new DashboardDAO();

    public int getTotalBookings() throws Exception {
        return dashboardDAO.getTotalBookings();
    }

    public double getTotalRevenue() throws Exception {
        return dashboardDAO.getTotalRevenue();
    }

    public int getActiveMovies() throws Exception {
        return dashboardDAO.getActiveMovies();
    }

    public int getRegisteredUsers() throws Exception {
        return dashboardDAO.getRegisteredUsers();
    }
}