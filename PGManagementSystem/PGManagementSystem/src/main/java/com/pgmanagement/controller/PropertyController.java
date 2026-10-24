package com.pgmanagement.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pgmanagement.model.Property;
import com.pgmanagement.service.PropertyService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PropertyController {

    private final PropertyService propertyService;

    public PropertyController(PropertyService propertyService) {
        this.propertyService = propertyService;
    }

    private boolean isAdmin(HttpSession session) {

        return "ADMIN".equals(
                session.getAttribute("role")
        );
    }

    @GetMapping("/property/add")
    public String showAddPropertyForm(
            HttpSession session,
            Model model) {

        if (!isAdmin(session)) {
            return "redirect:/admin/login";
        }

        model.addAttribute(
                "property",
                new Property()
        );

        return "property-add";
    }

    @PostMapping("/property/save")
    public String saveProperty(
            @ModelAttribute Property property,
            HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/admin/login";
        }

        propertyService.addProperty(property);

        return "redirect:/property/list";
    }

    @GetMapping("/property/list")
    public String listProperties(
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

        List<Property> properties;

        if (keyword == null
                || keyword.trim().isEmpty()) {

            properties =
                    propertyService.getAllProperties();

        } else {

            properties =
                    propertyService.searchProperties(
                            keyword.trim()
                    );
        }

        model.addAttribute(
                "properties",
                properties
        );

        model.addAttribute(
                "keyword",
                keyword
        );

        model.addAttribute(
                "errorMessage",
                errorMessage
        );

        return "property-list";
    }

    @GetMapping("/property/edit")
    public String showEditPropertyForm(
            @RequestParam("id") int id,
            HttpSession session,
            Model model) {

        if (!isAdmin(session)) {
            return "redirect:/admin/login";
        }

        Property property =
                propertyService.getPropertyById(id);

        if (property == null) {
            return "redirect:/property/list";
        }

        model.addAttribute(
                "property",
                property
        );

        return "property-edit";
    }

    @PostMapping("/property/update")
    public String updateProperty(
            @ModelAttribute Property property,
            HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/admin/login";
        }

        propertyService.updateProperty(property);

        return "redirect:/property/list";
    }

    @GetMapping("/property/delete")
    public String deleteProperty(
            @RequestParam("id") int id,
            HttpSession session) {

        if (!isAdmin(session)) {
            return "redirect:/admin/login";
        }

        boolean deleted =
                propertyService.deleteProperty(id);

        if (deleted) {

            return "redirect:/property/list";
        }

        return "redirect:/property/list"
                + "?errorMessage="
                + "Cannot delete property because related rooms exist.";
    }
}