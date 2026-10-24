package com.pgmanagement.service;

import org.springframework.stereotype.Service;

import com.pgmanagement.dao.DashboardDAO;

@Service
public class DashboardService {

    private final DashboardDAO dashboardDAO;

    public DashboardService(DashboardDAO dashboardDAO) {

        this.dashboardDAO = dashboardDAO;
    }

    public int getStudentCount() {

        return dashboardDAO.getStudentCount();
    }

    public int getPropertyCount() {

        return dashboardDAO.getPropertyCount();
    }

    public int getRoomCount() {

        return dashboardDAO.getRoomCount();
    }

    public int getActiveAllocationCount() {

        return dashboardDAO.getActiveAllocationCount();
    }

    public int getPendingRentCount() {

        return dashboardDAO.getPendingRentCount();
    }

    public int getComplaintCount() {

        return dashboardDAO.getComplaintCount();
    }

    public int getVisitorCount() {

        return dashboardDAO.getVisitorCount();
    }
}