package com.pgmanagement.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pgmanagement.model.Property;
import com.pgmanagement.model.Room;
import com.pgmanagement.service.PropertyService;
import com.pgmanagement.service.RoomService;

import jakarta.servlet.http.HttpSession;

@Controller
public class RoomController {

    private final RoomService roomService;
    private final PropertyService propertyService;

    public RoomController(
            RoomService roomService,
            PropertyService propertyService) {

        this.roomService = roomService;
        this.propertyService = propertyService;
    }

    private boolean isAdmin(HttpSession session) {

        return "ADMIN".equals(
                session.getAttribute("role")
        );
    }

    @GetMapping("/room/add")
    public String showAddRoomForm(
            HttpSession session,
            Model model) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        List<Property> properties =
                propertyService.getAllProperties();

        model.addAttribute(
                "room",
                new Room()
        );

        model.addAttribute(
                "properties",
                properties
        );

        return "room-add";
    }

    @PostMapping("/room/save")
    public String saveRoom(
            @ModelAttribute Room room,
            HttpSession session) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        roomService.addRoom(room);

        return "redirect:/room/list";
    }

    @GetMapping("/room/list")
    public String listRooms(
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

        List<Room> rooms;

        if (keyword == null
                || keyword.trim().isEmpty()) {

            rooms =
                    roomService.getAllRooms();

        } else {

            rooms =
                    roomService.searchRooms(
                            keyword.trim()
                    );
        }

        model.addAttribute(
                "rooms",
                rooms
        );

        model.addAttribute(
                "keyword",
                keyword
        );

        model.addAttribute(
                "errorMessage",
                errorMessage
        );

        return "room-list";
    }

    @GetMapping("/room/edit")
    public String showEditRoomForm(
            @RequestParam("id") int id,
            HttpSession session,
            Model model) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        Room room =
                roomService.getRoomById(id);

        if (room == null) {

            return "redirect:/room/list";
        }

        List<Property> properties =
                propertyService.getAllProperties();

        model.addAttribute(
                "room",
                room
        );

        model.addAttribute(
                "properties",
                properties
        );

        return "room-edit";
    }

    @PostMapping("/room/update")
    public String updateRoom(
            @ModelAttribute Room room,
            HttpSession session) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        roomService.updateRoom(room);

        return "redirect:/room/list";
    }

    @GetMapping("/room/delete")
    public String deleteRoom(
            @RequestParam("id") int id,
            HttpSession session) {

        if (!isAdmin(session)) {

            return "redirect:/admin/login";
        }

        boolean deleted =
                roomService.deleteRoom(id);

        if (deleted) {

            return "redirect:/room/list";
        }

        return "redirect:/room/list"
                + "?errorMessage="
                + "Cannot delete room because related allocation records exist.";
    }
}