package com.pgmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pgmanagement.dao.StudentDAO;
import com.pgmanagement.model.Student;

@Service
public class StudentService {

    private final StudentDAO studentDAO;

    public StudentService(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }

    public boolean addStudent(Student student) {

        if (student.getPassword() == null
                || student.getPassword().trim().isEmpty()) {

            student.setPassword("student123");
        }

        return studentDAO.addStudent(student);
    }

    public List<Student> getAllStudents() {

        return studentDAO.getAllStudents();
    }

    public Student getStudentById(int id) {

        return studentDAO.getStudentById(id);
    }

    public boolean updateStudent(Student student) {

        return studentDAO.updateStudent(student);
    }

    public boolean deleteStudent(int id) {

        return studentDAO.deleteStudent(id);
    }

    public List<Student> searchStudents(
            String keyword) {

        return studentDAO.searchStudents(keyword);
    }

    public Student login(
            String email,
            String password) {

        return studentDAO.login(
                email,
                password
        );
    }
}