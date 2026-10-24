package com.pgmanagement.dao;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.pgmanagement.model.RentPayment;

@Repository
public class RentPaymentDAO {

    private final JdbcTemplate jdbcTemplate;

    public RentPaymentDAO(
            JdbcTemplate jdbcTemplate) {

        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean addPayment(
            RentPayment payment) {

        String sql =
                "INSERT INTO rent_payments "
              + "(allocation_id, amount, payment_date, "
              + "month_year, payment_status) "
              + "VALUES (?, ?, ?, ?, ?)";

        Date paymentDate = null;

        if (payment.getPaymentDate() != null) {

            paymentDate =
                    Date.valueOf(
                            payment.getPaymentDate()
                    );
        }

        int rows =
                jdbcTemplate.update(
                        sql,
                        payment.getAllocationId(),
                        payment.getAmount(),
                        paymentDate,
                        payment.getMonthYear(),
                        payment.getPaymentStatus()
                );

        return rows > 0;
    }

    public boolean hasPaymentForMonth(
            int allocationId,
            String monthYear) {

        String sql =
                "SELECT COUNT(*) "
              + "FROM rent_payments "
              + "WHERE allocation_id = ? "
              + "AND month_year = ?";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        allocationId,
                        monthYear
                );

        return count != null && count > 0;
    }

    public boolean hasPaymentForMonthExceptId(
            int allocationId,
            String monthYear,
            int paymentId) {

        String sql =
                "SELECT COUNT(*) "
              + "FROM rent_payments "
              + "WHERE allocation_id = ? "
              + "AND month_year = ? "
              + "AND id <> ?";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        allocationId,
                        monthYear,
                        paymentId
                );

        return count != null && count > 0;
    }

    public boolean hasPaymentsForAllocation(
            int allocationId) {

        String sql =
                "SELECT COUNT(*) "
              + "FROM rent_payments "
              + "WHERE allocation_id = ?";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        allocationId
                );

        return count != null && count > 0;
    }

    public List<RentPayment> getAllPayments() {

        String sql =
                "SELECT rp.*, "
              + "s.name AS student_name, "
              + "r.room_number AS room_number "
              + "FROM rent_payments rp "
              + "LEFT JOIN room_allocations ra "
              + "ON rp.allocation_id = ra.id "
              + "LEFT JOIN students s "
              + "ON ra.student_id = s.id "
              + "LEFT JOIN rooms r "
              + "ON ra.room_id = r.id "
              + "ORDER BY rp.id DESC";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    RentPayment payment =
                            new RentPayment();

                    payment.setId(
                            rs.getInt("id")
                    );

                    payment.setAllocationId(
                            rs.getInt(
                                    "allocation_id"
                            )
                    );

                    payment.setAmount(
                            rs.getBigDecimal(
                                    "amount"
                            )
                    );

                    if (rs.getDate("payment_date")
                            != null) {

                        payment.setPaymentDate(
                                rs.getDate(
                                        "payment_date"
                                ).toLocalDate()
                        );
                    }

                    payment.setMonthYear(
                            rs.getString("month_year")
                    );

                    payment.setPaymentStatus(
                            rs.getString(
                                    "payment_status"
                            )
                    );

                    payment.setStudentName(
                            rs.getString(
                                    "student_name"
                            )
                    );

                    payment.setRoomNumber(
                            rs.getString(
                                    "room_number"
                            )
                    );

                    return payment;
                }
        );
    }

    public List<RentPayment>
            getPaymentsByAllocationId(
                    int allocationId) {

        String sql =
                "SELECT rp.*, "
              + "s.name AS student_name, "
              + "r.room_number AS room_number "
              + "FROM rent_payments rp "
              + "LEFT JOIN room_allocations ra "
              + "ON rp.allocation_id = ra.id "
              + "LEFT JOIN students s "
              + "ON ra.student_id = s.id "
              + "LEFT JOIN rooms r "
              + "ON ra.room_id = r.id "
              + "WHERE rp.allocation_id = ? "
              + "ORDER BY rp.payment_date DESC, "
              + "rp.id DESC";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    RentPayment payment =
                            new RentPayment();

                    payment.setId(
                            rs.getInt("id")
                    );

                    payment.setAllocationId(
                            rs.getInt(
                                    "allocation_id"
                            )
                    );

                    payment.setAmount(
                            rs.getBigDecimal(
                                    "amount"
                            )
                    );

                    if (rs.getDate("payment_date")
                            != null) {

                        payment.setPaymentDate(
                                rs.getDate(
                                        "payment_date"
                                ).toLocalDate()
                        );
                    }

                    payment.setMonthYear(
                            rs.getString("month_year")
                    );

                    payment.setPaymentStatus(
                            rs.getString(
                                    "payment_status"
                            )
                    );

                    payment.setStudentName(
                            rs.getString(
                                    "student_name"
                            )
                    );

                    payment.setRoomNumber(
                            rs.getString(
                                    "room_number"
                            )
                    );

                    return payment;
                },
                allocationId
        );
    }

    public BigDecimal
            getTotalPaidAmountByAllocationId(
                    int allocationId) {

        String sql =
                "SELECT COALESCE("
              + "SUM(amount), 0"
              + ") "
              + "FROM rent_payments "
              + "WHERE allocation_id = ? "
              + "AND payment_status = 'Paid'";

        BigDecimal total =
                jdbcTemplate.queryForObject(
                        sql,
                        BigDecimal.class,
                        allocationId
                );

        if (total == null) {
            return BigDecimal.ZERO;
        }

        return total;
    }

    public List<RentPayment>
            searchPayments(
                    String keyword) {

        String sql =
                "SELECT rp.*, "
              + "s.name AS student_name, "
              + "r.room_number AS room_number "
              + "FROM rent_payments rp "
              + "LEFT JOIN room_allocations ra "
              + "ON rp.allocation_id = ra.id "
              + "LEFT JOIN students s "
              + "ON ra.student_id = s.id "
              + "LEFT JOIN rooms r "
              + "ON ra.room_id = r.id "
              + "WHERE CAST(rp.allocation_id AS CHAR) LIKE ? "
              + "OR CAST(rp.amount AS CHAR) LIKE ? "
              + "OR rp.month_year LIKE ? "
              + "OR rp.payment_status LIKE ? "
              + "OR s.name LIKE ? "
              + "OR r.room_number LIKE ? "
              + "ORDER BY rp.id DESC";

        String searchKeyword =
                "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    RentPayment payment =
                            new RentPayment();

                    payment.setId(
                            rs.getInt("id")
                    );

                    payment.setAllocationId(
                            rs.getInt(
                                    "allocation_id"
                            )
                    );

                    payment.setAmount(
                            rs.getBigDecimal(
                                    "amount"
                            )
                    );

                    if (rs.getDate("payment_date")
                            != null) {

                        payment.setPaymentDate(
                                rs.getDate(
                                        "payment_date"
                                ).toLocalDate()
                        );
                    }

                    payment.setMonthYear(
                            rs.getString("month_year")
                    );

                    payment.setPaymentStatus(
                            rs.getString(
                                    "payment_status"
                            )
                    );

                    payment.setStudentName(
                            rs.getString(
                                    "student_name"
                            )
                    );

                    payment.setRoomNumber(
                            rs.getString(
                                    "room_number"
                            )
                    );

                    return payment;
                },
                searchKeyword,
                searchKeyword,
                searchKeyword,
                searchKeyword,
                searchKeyword,
                searchKeyword
        );
    }

    public RentPayment getPaymentById(
            int id) {

        String sql =
                "SELECT rp.*, "
              + "s.name AS student_name, "
              + "r.room_number AS room_number "
              + "FROM rent_payments rp "
              + "LEFT JOIN room_allocations ra "
              + "ON rp.allocation_id = ra.id "
              + "LEFT JOIN students s "
              + "ON ra.student_id = s.id "
              + "LEFT JOIN rooms r "
              + "ON ra.room_id = r.id "
              + "WHERE rp.id = ?";

        List<RentPayment> payments =
                jdbcTemplate.query(
                        sql,
                        (rs, rowNum) -> {

                            RentPayment payment =
                                    new RentPayment();

                            payment.setId(
                                    rs.getInt("id")
                            );

                            payment.setAllocationId(
                                    rs.getInt(
                                            "allocation_id"
                                    )
                            );

                            payment.setAmount(
                                    rs.getBigDecimal(
                                            "amount"
                                    )
                            );

                            if (rs.getDate(
                                    "payment_date"
                            ) != null) {

                                payment.setPaymentDate(
                                        rs.getDate(
                                                "payment_date"
                                        ).toLocalDate()
                                );
                            }

                            payment.setMonthYear(
                                    rs.getString(
                                            "month_year"
                                    )
                            );

                            payment.setPaymentStatus(
                                    rs.getString(
                                            "payment_status"
                                    )
                            );

                            payment.setStudentName(
                                    rs.getString(
                                            "student_name"
                                    )
                            );

                            payment.setRoomNumber(
                                    rs.getString(
                                            "room_number"
                                    )
                            );

                            return payment;
                        },
                        id
                );

        if (payments.isEmpty()) {
            return null;
        }

        return payments.get(0);
    }

    public boolean updatePayment(
            RentPayment payment) {

        String sql =
                "UPDATE rent_payments SET "
              + "allocation_id = ?, "
              + "amount = ?, "
              + "payment_date = ?, "
              + "month_year = ?, "
              + "payment_status = ? "
              + "WHERE id = ?";

        Date paymentDate = null;

        if (payment.getPaymentDate() != null) {

            paymentDate =
                    Date.valueOf(
                            payment.getPaymentDate()
                    );
        }

        int rows =
                jdbcTemplate.update(
                        sql,
                        payment.getAllocationId(),
                        payment.getAmount(),
                        paymentDate,
                        payment.getMonthYear(),
                        payment.getPaymentStatus(),
                        payment.getId()
                );

        return rows > 0;
    }

    public boolean deletePayment(
            int id) {

        String sql =
                "DELETE FROM rent_payments "
              + "WHERE id = ?";

        int rows =
                jdbcTemplate.update(
                        sql,
                        id
                );

        return rows > 0;
    }
}