package com.pgmanagement.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pgmanagement.model.RoomAllocation;
import com.pgmanagement.model.Student;
import com.pgmanagement.service.RentPaymentService;
import com.pgmanagement.service.RoomAllocationService;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudentDashboardController {

    private final RoomAllocationService roomAllocationService;
    private final RentPaymentService rentPaymentService;

    public StudentDashboardController(
            RoomAllocationService roomAllocationService,
            RentPaymentService rentPaymentService) {

        this.roomAllocationService =
                roomAllocationService;

        this.rentPaymentService =
                rentPaymentService;
    }

    @GetMapping("/student/dashboard")
    public String studentDashboard(
            HttpSession session,
            Model model) {

        Student student =
                (Student) session.getAttribute(
                        "student"
                );

        if (student == null) {

            return "redirect:/student/login";
        }

        List<RoomAllocation> allocations =
                roomAllocationService
                        .getAllAllocations();

        RoomAllocation currentAllocation =
                null;

        if (allocations != null) {

            for (RoomAllocation allocation
                    : allocations) {

                if (allocation.getStudentId()
                        == student.getId()
                        && "Active".equalsIgnoreCase(
                                allocation.getStatus())) {

                    currentAllocation =
                            allocation;

                    break;
                }
            }
        }

        BigDecimal monthlyRent =
                BigDecimal.ZERO;

        BigDecimal totalPaid =
                BigDecimal.ZERO;

        BigDecimal balanceDue =
                BigDecimal.ZERO;

        if (currentAllocation != null) {

            if (currentAllocation.getRentAmount()
                    != null) {

                monthlyRent =
                        currentAllocation.getRentAmount();
            }

            totalPaid =
                    rentPaymentService
                            .getTotalAmountByAllocationId(
                                    currentAllocation.getId()
                            );

            balanceDue =
                    monthlyRent.subtract(
                            totalPaid
                    );

            if (balanceDue.compareTo(
                    BigDecimal.ZERO) < 0) {

                balanceDue =
                        BigDecimal.ZERO;
            }
        }

        model.addAttribute(
                "student",
                student
        );

        model.addAttribute(
                "currentAllocation",
                currentAllocation
        );

        model.addAttribute(
                "monthlyRent",
                monthlyRent
        );

        model.addAttribute(
                "totalPaid",
                totalPaid
        );

        model.addAttribute(
                "balanceDue",
                balanceDue
        );

        return "student-dashboard";
    }
}