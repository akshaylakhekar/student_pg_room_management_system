package com.pgmanagement.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DashboardDAO {

    private final JdbcTemplate jdbcTemplate;

    public DashboardDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public int getStudentCount() {

        String sql =
                "SELECT COUNT(*) FROM students";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class
        );
    }

    public int getPropertyCount() {

        String sql =
                "SELECT COUNT(*) FROM properties";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class
        );
    }

    public int getRoomCount() {

        String sql =
                "SELECT COUNT(*) FROM rooms";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class
        );
    }

    public int getActiveAllocationCount() {

        String sql =
                "SELECT COUNT(*) "
              + "FROM room_allocations "
              + "WHERE status = 'Active'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class
        );
    }

    public int getPendingRentCount() {

        String sql =
                "SELECT COUNT(*) "
              + "FROM rent_payments "
              + "WHERE payment_status = 'Pending'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class
        );
    }

    public int getComplaintCount() {

        String sql =
                "SELECT COUNT(*) "
              + "FROM complaints";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class
        );
    }

    public int getVisitorCount() {

        String sql =
                "SELECT COUNT(*) "
              + "FROM visitors";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class
        );
    }
}