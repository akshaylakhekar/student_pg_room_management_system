package com.pgmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pgmanagement.model.Admin;
import com.pgmanagement.service.DashboardService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DashboardController {

    private final DashboardService dashboardService;

    public DashboardController(
            DashboardService dashboardService) {

        this.dashboardService =
                dashboardService;
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboard(
            HttpSession session,
            Model model) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        int studentCount =
                dashboardService.getStudentCount();

        int propertyCount =
                dashboardService.getPropertyCount();

        int roomCount =
                dashboardService.getRoomCount();

        int activeAllocationCount =
                dashboardService.getActiveAllocationCount();

        int pendingRentCount =
                dashboardService.getPendingRentCount();

        int complaintCount =
                dashboardService.getComplaintCount();

        int visitorCount =
                dashboardService.getVisitorCount();

        model.addAttribute(
                "studentCount",
                studentCount
        );

        model.addAttribute(
                "propertyCount",
                propertyCount
        );

        model.addAttribute(
                "roomCount",
                roomCount
        );

        model.addAttribute(
                "activeAllocationCount",
                activeAllocationCount
        );

        model.addAttribute(
                "pendingRentCount",
                pendingRentCount
        );

        model.addAttribute(
                "complaintCount",
                complaintCount
        );

        model.addAttribute(
                "visitorCount",
                visitorCount
        );

        model.addAttribute(
                "admin",
                admin
        );

        return "admin-dashboard";
    }

    @GetMapping("/dashboard")
    public String oldDashboard(
            HttpSession session) {

        Admin admin =
                (Admin) session.getAttribute("admin");

        if (admin == null) {

            return "redirect:/admin/login";
        }

        return "redirect:/admin/dashboard";
    }
}