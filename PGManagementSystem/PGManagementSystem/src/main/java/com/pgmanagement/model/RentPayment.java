package com.pgmanagement.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class RentPayment {

    private int id;

    private int allocationId;

    private BigDecimal amount;

    private LocalDate paymentDate;

    private String monthYear;

    private String paymentStatus;

    // Display ke liye extra fields
    private String studentName;

    private String roomNumber;


    public RentPayment() {
    }


    // =========================================================
    // ID
    // =========================================================

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    // =========================================================
    // ALLOCATION ID
    // =========================================================

    public int getAllocationId() {
        return allocationId;
    }

    public void setAllocationId(int allocationId) {
        this.allocationId = allocationId;
    }


    // =========================================================
    // AMOUNT
    // =========================================================

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }


    // =========================================================
    // PAYMENT DATE
    // =========================================================

    public LocalDate getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(
            LocalDate paymentDate) {

        this.paymentDate = paymentDate;
    }


    // =========================================================
    // MONTH / YEAR
    // =========================================================

    public String getMonthYear() {
        return monthYear;
    }

    public void setMonthYear(
            String monthYear) {

        this.monthYear = monthYear;
    }


    // =========================================================
    // PAYMENT STATUS
    // =========================================================

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(
            String paymentStatus) {

        this.paymentStatus = paymentStatus;
    }


    // =========================================================
    // STUDENT NAME
    // =========================================================

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(
            String studentName) {

        this.studentName = studentName;
    }


    // =========================================================
    // ROOM NUMBER
    // =========================================================

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(
            String roomNumber) {

        this.roomNumber = roomNumber;
    }
}