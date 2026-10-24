package com.pgmanagement.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pgmanagement.model.RentPayment;
import com.pgmanagement.model.RoomAllocation;
import com.pgmanagement.model.Student;
import com.pgmanagement.service.RentPaymentService;
import com.pgmanagement.service.RoomAllocationService;
import com.pgmanagement.service.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class RentPaymentController {

    private final RentPaymentService paymentService;
    private final RoomAllocationService allocationService;
    private final StudentService studentService;

    public RentPaymentController(
            RentPaymentService paymentService,
            RoomAllocationService allocationService,
            StudentService studentService) {

        this.paymentService =
                paymentService;

        this.allocationService =
                allocationService;

        this.studentService =
                studentService;
    }

    private boolean isAdmin(HttpSession session) {

        return "ADMIN".equals(
                session.getAttribute("role")
        );
    }

    @GetMapping("/payment/add")
    public String showAddPaymentForm(
            HttpSession session,
            Model model) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        List<RoomAllocation> allocations =
                allocationService
                        .getAllAllocations();

        model.addAttribute(
                "payment",
                new RentPayment()
        );

        model.addAttribute(
                "allocations",
                allocations
        );

        return "payment-add";
    }

    @PostMapping("/payment/save")
    public String savePayment(
            @ModelAttribute RentPayment payment,
            HttpSession session) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        paymentService.addPayment(payment);

        return "redirect:/payment/list";
    }

    @GetMapping("/payment/list")
    public String listPayments(
            HttpSession session,
            Model model) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        List<RentPayment> payments =
                paymentService.getAllPayments();

        model.addAttribute(
                "payments",
                payments
        );

        return "payment-list";
    }

    @GetMapping("/payment/edit")
    public String showEditPaymentForm(
            @RequestParam("id") int id,
            HttpSession session,
            Model model) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        RentPayment payment =
                paymentService.getPaymentById(id);

        if (payment == null) {

            return "redirect:/payment/list";
        }

        List<RoomAllocation> allocations =
                allocationService
                        .getAllAllocations();

        model.addAttribute(
                "payment",
                payment
        );

        model.addAttribute(
                "allocations",
                allocations
        );

        return "payment-edit";
    }

    @PostMapping("/payment/update")
    public String updatePayment(
            @ModelAttribute RentPayment payment,
            HttpSession session) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        paymentService.updatePayment(payment);

        return "redirect:/payment/list";
    }

    @GetMapping("/payment/delete")
    public String deletePayment(
            @RequestParam("id") int id,
            HttpSession session) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        paymentService.deletePayment(id);

        return "redirect:/payment/list";
    }

    @GetMapping("/payment/history")
    public String paymentHistory(
            @RequestParam("allocationId")
            int allocationId,
            HttpSession session,
            Model model) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        RoomAllocation allocation =
                allocationService
                        .getAllocationById(
                                allocationId
                        );

        if (allocation == null) {

            return "redirect:/student/dashboard";
        }

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute(
                            "student"
                    );

            if (student == null) {

                return "redirect:/student/login";
            }

            if (allocation.getStudentId()
                    != student.getId()) {

                return "redirect:/student/dashboard";
            }
        }

        List<RentPayment> payments =
                paymentService
                        .getPaymentsByAllocationId(
                                allocationId
                        );

        BigDecimal monthlyRent =
                BigDecimal.ZERO;

        if (allocation.getRentAmount()
                != null) {

            monthlyRent =
                    allocation.getRentAmount();
        }

        BigDecimal totalAmount =
                paymentService
                        .getTotalAmountByAllocationId(
                                allocationId
                        );

        if (totalAmount == null) {

            totalAmount =
                    BigDecimal.ZERO;
        }

        BigDecimal balanceDue =
                monthlyRent.subtract(
                        totalAmount
                );

        if (balanceDue.compareTo(
                BigDecimal.ZERO) < 0) {

            balanceDue =
                    BigDecimal.ZERO;
        }

        model.addAttribute(
                "payments",
                payments
        );

        model.addAttribute(
                "allocation",
                allocation
        );

        model.addAttribute(
                "allocationId",
                allocationId
        );

        model.addAttribute(
                "monthlyRent",
                monthlyRent
        );

        model.addAttribute(
                "totalAmount",
                totalAmount
        );

        model.addAttribute(
                "balanceDue",
                balanceDue
        );

        return "payment-history";
    }

    @GetMapping("/payment/receipt")
    public String paymentReceipt(
            @RequestParam("id") int id,
            HttpSession session,
            Model model) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        RentPayment payment =
                paymentService.getPaymentById(id);

        if (payment == null) {

            return "redirect:/payment/list";
        }

        RoomAllocation allocation =
                allocationService
                        .getAllocationById(
                                payment.getAllocationId()
                        );

        if (allocation == null) {

            return "redirect:/payment/list";
        }

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute(
                            "student"
                    );

            if (student == null) {

                return "redirect:/student/login";
            }

            if (allocation.getStudentId()
                    != student.getId()) {

                return "redirect:/student/dashboard";
            }
        }

        BigDecimal monthlyRent =
                BigDecimal.ZERO;

        if (allocation.getRentAmount()
                != null) {

            monthlyRent =
                    allocation.getRentAmount();
        }

        BigDecimal totalAmount =
                paymentService
                        .getTotalAmountByAllocationId(
                                payment.getAllocationId()
                        );

        if (totalAmount == null) {

            totalAmount =
                    BigDecimal.ZERO;
        }

        BigDecimal balanceDue =
                monthlyRent.subtract(
                        totalAmount
                );

        if (balanceDue.compareTo(
                BigDecimal.ZERO) < 0) {

            balanceDue =
                    BigDecimal.ZERO;
        }

        model.addAttribute(
                "payment",
                payment
        );

        model.addAttribute(
                "allocation",
                allocation
        );

        model.addAttribute(
                "monthlyRent",
                monthlyRent
        );

        model.addAttribute(
                "totalAmount",
                totalAmount
        );

        model.addAttribute(
                "balanceDue",
                balanceDue
        );

        return "payment-receipt";
    }
}