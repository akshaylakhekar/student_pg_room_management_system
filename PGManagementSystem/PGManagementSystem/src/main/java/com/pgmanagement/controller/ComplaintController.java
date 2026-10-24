package com.pgmanagement.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pgmanagement.model.Complaint;
import com.pgmanagement.model.Student;
import com.pgmanagement.service.ComplaintService;
import com.pgmanagement.service.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ComplaintController {

    private final ComplaintService complaintService;
    private final StudentService studentService;

    public ComplaintController(
            ComplaintService complaintService,
            StudentService studentService) {

        this.complaintService = complaintService;
        this.studentService = studentService;
    }

    @GetMapping("/complaint/add")
    public String showAddComplaintForm(
            HttpSession session,
            Model model) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        Complaint complaint =
                new Complaint();

        model.addAttribute(
                "complaint",
                complaint
        );

        if ("ADMIN".equals(role)) {

            List<Student> students =
                    studentService.getAllStudents();

            model.addAttribute(
                    "students",
                    students
            );
        }

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                return "redirect:/student/login";
            }

            complaint.setStudentId(
                    student.getId()
            );

            model.addAttribute(
                    "loggedInStudent",
                    student
            );
        }

        return "complaint-add";
    }

    @PostMapping("/complaint/save")
    public String saveComplaint(
            @ModelAttribute Complaint complaint,
            HttpSession session) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                return "redirect:/student/login";
            }

            complaint.setStudentId(
                    student.getId()
            );

            complaint.setStatus("Pending");
        }

        if (complaint.getCreatedAt() == null) {

            complaint.setCreatedAt(
                    LocalDate.now()
            );
        }

        complaintService.addComplaint(
                complaint
        );

        if ("STUDENT".equals(role)) {

            return "redirect:/complaint/student"
                    + "?studentId="
                    + complaint.getStudentId();
        }

        return "redirect:/complaint/list";
    }

    @GetMapping("/complaint/list")
    public String listComplaints(
            Model model,
            HttpSession session) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)) {

            return "redirect:/student/login";
        }

        List<Complaint> complaints =
                complaintService.getAllComplaints();

        model.addAttribute(
                "complaints",
                complaints
        );

        return "complaint-list";
    }

    @GetMapping("/complaint/student")
    public String studentComplaints(
            @RequestParam("studentId") int studentId,
            HttpSession session,
            Model model) {

        String role =
                (String) session.getAttribute("role");

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                return "redirect:/student/login";
            }

            studentId =
                    student.getId();

            model.addAttribute(
                    "student",
                    student
            );
        }

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        if ("ADMIN".equals(role)) {

            Student student =
                    studentService.getStudentById(
                            studentId
                    );

            if (student == null) {

                return "redirect:/complaint/list";
            }

            model.addAttribute(
                    "student",
                    student
            );
        }

        List<Complaint> complaints =
                complaintService
                        .getComplaintsByStudentId(
                                studentId
                        );

        model.addAttribute(
                "complaints",
                complaints
        );

        model.addAttribute(
                "studentId",
                studentId
        );

        return "complaint-student-list";
    }

    @GetMapping("/complaint/edit")
    public String showEditComplaintForm(
            @RequestParam("id") int id,
            HttpSession session,
            Model model) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        Complaint complaint =
                complaintService.getComplaintById(id);

        if (complaint == null) {

            return "redirect:/student/dashboard";
        }

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                return "redirect:/student/login";
            }

            if (complaint.getStudentId()
                    != student.getId()) {

                return "redirect:/complaint/student"
                        + "?studentId="
                        + student.getId();
            }

            model.addAttribute(
                    "loggedInStudent",
                    student
            );
        }

        if ("ADMIN".equals(role)) {

            List<Student> students =
                    studentService.getAllStudents();

            model.addAttribute(
                    "students",
                    students
            );
        }

        model.addAttribute(
                "complaint",
                complaint
        );

        return "complaint-edit";
    }

    @PostMapping("/complaint/update")
    public String updateComplaint(
            @ModelAttribute Complaint complaint,
            HttpSession session) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        Complaint existingComplaint =
                complaintService.getComplaintById(
                        complaint.getId()
                );

        if (existingComplaint == null) {

            return "redirect:/student/dashboard";
        }

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                return "redirect:/student/login";
            }

            if (existingComplaint.getStudentId()
                    != student.getId()) {

                return "redirect:/complaint/student"
                        + "?studentId="
                        + student.getId();
            }

            complaint.setStudentId(
                    student.getId()
            );
        }

        complaintService.updateComplaint(
                complaint
        );

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            return "redirect:/complaint/student"
                    + "?studentId="
                    + student.getId();
        }

        return "redirect:/complaint/list";
    }

    @GetMapping("/complaint/delete")
    public String deleteComplaint(
            @RequestParam("id") int id,
            HttpSession session) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        Complaint complaint =
                complaintService.getComplaintById(id);

        if (complaint == null) {

            return "redirect:/student/dashboard";
        }

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                return "redirect:/student/login";
            }

            if (complaint.getStudentId()
                    != student.getId()) {

                return "redirect:/complaint/student"
                        + "?studentId="
                        + student.getId();
            }

            complaintService.deleteComplaint(id);

            return "redirect:/complaint/student"
                    + "?studentId="
                    + student.getId();
        }

        complaintService.deleteComplaint(id);

        return "redirect:/complaint/list";
    }
}