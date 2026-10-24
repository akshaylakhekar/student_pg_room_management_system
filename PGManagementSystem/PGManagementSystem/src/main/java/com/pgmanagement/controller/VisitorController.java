package com.pgmanagement.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pgmanagement.model.Student;
import com.pgmanagement.model.Visitor;
import com.pgmanagement.service.StudentService;
import com.pgmanagement.service.VisitorService;

import jakarta.servlet.http.HttpSession;

@Controller
public class VisitorController {

    private final VisitorService visitorService;
    private final StudentService studentService;

    public VisitorController(
            VisitorService visitorService,
            StudentService studentService) {

        this.visitorService = visitorService;
        this.studentService = studentService;
    }

    @GetMapping("/visitor/add")
    public String showAddVisitorForm(
            HttpSession session,
            Model model) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        Visitor visitor =
                new Visitor();

        model.addAttribute(
                "visitor",
                visitor
        );

        if ("ADMIN".equals(role)) {

            List<Student> students =
                    studentService.getAllStudents();

            model.addAttribute(
                    "students",
                    students
            );

            return "visitor-add";
        }

        Student student =
                (Student) session.getAttribute("student");

        if (student == null) {

            return "redirect:/student/login";
        }

        visitor.setStudentId(
                student.getId()
        );

        model.addAttribute(
                "loggedInStudent",
                student
        );

        return "visitor-add";
    }

    @PostMapping("/visitor/save")
    public String saveVisitor(
            @ModelAttribute Visitor visitor,
            HttpSession session) {

        String role =
                (String) session.getAttribute("role");

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                return "redirect:/student/login";
            }

            visitor.setStudentId(
                    student.getId()
            );
        }

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        if (visitor.getEntryTime() == null) {

            visitor.setEntryTime(
                    LocalDateTime.now()
            );
        }

        visitorService.addVisitor(
                visitor
        );

        if ("STUDENT".equals(role)) {

            return "redirect:/visitor/student"
                    + "?studentId="
                    + visitor.getStudentId();
        }

        return "redirect:/visitor/list";
    }

    @GetMapping("/visitor/list")
    public String listVisitors(
            HttpSession session,
            Model model) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)) {

            return "redirect:/student/login";
        }

        List<Visitor> visitors =
                visitorService.getAllVisitors();

        model.addAttribute(
                "visitors",
                visitors
        );

        return "visitor-list";
    }

    @GetMapping("/visitor/student")
    public String studentVisitors(
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

                return "redirect:/visitor/list";
            }

            model.addAttribute(
                    "student",
                    student
            );
        }

        List<Visitor> visitors =
                visitorService
                        .getVisitorsByStudentId(
                                studentId
                        );

        model.addAttribute(
                "visitors",
                visitors
        );

        model.addAttribute(
                "studentId",
                studentId
        );

        return "visitor-student-list";
    }

    @GetMapping("/visitor/edit")
    public String showEditVisitorForm(
            @RequestParam("id") int id,
            HttpSession session,
            Model model) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        Visitor visitor =
                visitorService.getVisitorById(id);

        if (visitor == null) {

            return "redirect:/student/dashboard";
        }

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                return "redirect:/student/login";
            }

            if (visitor.getStudentId()
                    != student.getId()) {

                return "redirect:/visitor/student"
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
                "visitor",
                visitor
        );

        return "visitor-edit";
    }

    @PostMapping("/visitor/update")
    public String updateVisitor(
            @ModelAttribute Visitor visitor,
            HttpSession session) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        Visitor existingVisitor =
                visitorService.getVisitorById(
                        visitor.getId()
                );

        if (existingVisitor == null) {

            return "redirect:/student/dashboard";
        }

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                return "redirect:/student/login";
            }

            if (existingVisitor.getStudentId()
                    != student.getId()) {

                return "redirect:/visitor/student"
                        + "?studentId="
                        + student.getId();
            }

            visitor.setStudentId(
                    student.getId()
            );
        }

        if (visitor.getEntryTime() == null) {

            visitor.setEntryTime(
                    existingVisitor.getEntryTime()
            );
        }

        boolean updated =
                visitorService.updateVisitor(
                        visitor
                );

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            return "redirect:/visitor/student"
                    + "?studentId="
                    + student.getId();
        }

        return "redirect:/visitor/list";
    }

    @GetMapping("/visitor/delete")
    public String deleteVisitor(
            @RequestParam("id") int id,
            HttpSession session) {

        String role =
                (String) session.getAttribute("role");

        if (!"ADMIN".equals(role)
                && !"STUDENT".equals(role)) {

            return "redirect:/student/login";
        }

        Visitor visitor =
                visitorService.getVisitorById(id);

        if (visitor == null) {

            return "redirect:/student/dashboard";
        }

        if ("STUDENT".equals(role)) {

            Student student =
                    (Student) session.getAttribute("student");

            if (student == null) {

                return "redirect:/student/login";
            }

            if (visitor.getStudentId()
                    != student.getId()) {

                return "redirect:/visitor/student"
                        + "?studentId="
                        + student.getId();
            }

            visitorService.deleteVisitor(id);

            return "redirect:/visitor/student"
                    + "?studentId="
                    + student.getId();
        }

        visitorService.deleteVisitor(id);

        return "redirect:/visitor/list";
    }
}