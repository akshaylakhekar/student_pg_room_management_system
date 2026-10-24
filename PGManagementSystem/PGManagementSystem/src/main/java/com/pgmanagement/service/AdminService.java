package com.pgmanagement.service;

import org.springframework.stereotype.Service;

import com.pgmanagement.dao.AdminDAO;
import com.pgmanagement.model.Admin;

@Service
public class AdminService {

    private final AdminDAO adminDAO;

    public AdminService(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    public Admin login(String username, String password) {

        return adminDAO.login(
                username,
                password
        );
    }
}