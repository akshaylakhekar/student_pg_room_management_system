package com.pgmanagement.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.pgmanagement.model.Admin;

@Repository
public class AdminDAO {

    private final JdbcTemplate jdbcTemplate;

    public AdminDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public Admin login(String username, String password) {

        String sql =
                "SELECT id, name, username, email, password "
              + "FROM admins "
              + "WHERE username = ? AND password = ?";

        try {

            return jdbcTemplate.queryForObject(
                    sql,
                    (rs, rowNum) -> {

                        Admin admin = new Admin();

                        admin.setId(
                                rs.getInt("id")
                        );

                        admin.setName(
                                rs.getString("name")
                        );

                        admin.setUsername(
                                rs.getString("username")
                        );

                        admin.setEmail(
                                rs.getString("email")
                        );

                        admin.setPassword(
                                rs.getString("password")
                        );

                        return admin;
                    },
                    username,
                    password
            );

        } catch (Exception e) {

            return null;
        }
    }
}