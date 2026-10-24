package com.pgmanagement.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pgmanagement.model.Room;
import com.pgmanagement.model.RoomAllocation;
import com.pgmanagement.model.Student;
import com.pgmanagement.service.RoomAllocationService;
import com.pgmanagement.service.RoomService;
import com.pgmanagement.service.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class RoomAllocationController {

    private final RoomAllocationService allocationService;
    private final StudentService studentService;
    private final RoomService roomService;

    public RoomAllocationController(
            RoomAllocationService allocationService,
            StudentService studentService,
            RoomService roomService) {

        this.allocationService =
                allocationService;

        this.studentService =
                studentService;

        this.roomService =
                roomService;
    }

    private boolean isAdmin(HttpSession session) {

        return "ADMIN".equals(
                session.getAttribute("role")
        );
    }

    @GetMapping("/allocation/add")
    public String showAddAllocationForm(
            HttpSession session,
            Model model) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        List<Student> students =
                studentService.getAllStudents();

        List<Room> rooms =
                roomService.getAllRooms();

        model.addAttribute(
                "allocation",
                new RoomAllocation()
        );

        model.addAttribute(
                "students",
                students
        );

        model.addAttribute(
                "rooms",
                rooms
        );

        return "allocation-add";
    }

    @PostMapping("/allocation/save")
    public String saveAllocation(
            @ModelAttribute RoomAllocation allocation,
            HttpSession session) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        boolean saved =
                allocationService.addAllocation(
                        allocation
                );

        if (saved) {

            return "redirect:/allocation/list";
        }

        return "redirect:/allocation/add"
                + "?errorMessage="
                + "Selected room is not available.";
    }

    @GetMapping("/allocation/list")
    public String listAllocations(
            @RequestParam(
                    value = "keyword",
                    required = false
            )
            String keyword,

            @RequestParam(
                    value = "errorMessage",
                    required = false
            )
            String errorMessage,

            HttpSession session,
            Model model) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        List<RoomAllocation> allocations;

        if (keyword == null
                || keyword.trim().isEmpty()) {

            allocations =
                    allocationService
                            .getAllAllocations();

        } else {

            allocations =
                    allocationService
                            .searchAllocations(
                                    keyword.trim()
                            );
        }

        model.addAttribute(
                "allocations",
                allocations
        );

        model.addAttribute(
                "keyword",
                keyword
        );

        model.addAttribute(
                "errorMessage",
                errorMessage
        );

        return "allocation-list";
    }

    @GetMapping("/allocation/edit")
    public String showEditAllocationForm(
            @RequestParam("id") int id,
            HttpSession session,
            Model model) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        RoomAllocation allocation =
                allocationService
                        .getAllocationById(id);

        if (allocation == null) {

            return "redirect:/allocation/list";
        }

        List<Student> students =
                studentService.getAllStudents();

        List<Room> rooms =
                roomService.getAllRooms();

        model.addAttribute(
                "allocation",
                allocation
        );

        model.addAttribute(
                "students",
                students
        );

        model.addAttribute(
                "rooms",
                rooms
        );

        return "allocation-edit";
    }

    @PostMapping("/allocation/update")
    public String updateAllocation(
            @ModelAttribute RoomAllocation allocation,
            HttpSession session) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        boolean updated =
                allocationService
                        .updateAllocation(
                                allocation
                        );

        if (updated) {

            return "redirect:/allocation/list";
        }

        return "redirect:/allocation/edit"
                + "?id="
                + allocation.getId()
                + "&errorMessage="
                + "Selected room is not available.";
    }

    @GetMapping("/allocation/delete")
    public String deleteAllocation(
            @RequestParam("id") int id,
            HttpSession session) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        boolean deleted =
                allocationService
                        .deleteAllocation(id);

        if (deleted) {

            return "redirect:/allocation/list";
        }

        return "redirect:/allocation/list"
                + "?errorMessage="
                + "Cannot delete allocation because payment records exist.";
    }
}