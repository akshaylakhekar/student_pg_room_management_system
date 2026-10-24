package com.pgmanagement.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.pgmanagement.dao.RentPaymentDAO;
import com.pgmanagement.model.RentPayment;

@Service
public class RentPaymentService {

    private final RentPaymentDAO rentPaymentDAO;

    public RentPaymentService(
            RentPaymentDAO rentPaymentDAO) {

        this.rentPaymentDAO =
                rentPaymentDAO;
    }

    public boolean addPayment(
            RentPayment payment) {

        if (payment == null) {

            return false;
        }

        if (payment.getAmount() == null
                || payment.getAmount()
                        .compareTo(
                                BigDecimal.ZERO
                        ) <= 0) {

            return false;
        }

        boolean alreadyPaid =
                rentPaymentDAO
                        .hasPaymentForMonth(
                                payment.getAllocationId(),
                                payment.getMonthYear()
                        );

        if (alreadyPaid) {

            return false;
        }

        return rentPaymentDAO.addPayment(
                payment
        );
    }

    public List<RentPayment> getAllPayments() {

        return rentPaymentDAO
                .getAllPayments();
    }

    public List<RentPayment>
            getPaymentsByAllocationId(
                    int allocationId) {

        return rentPaymentDAO
                .getPaymentsByAllocationId(
                        allocationId
                );
    }

    public BigDecimal
            getTotalAmountByAllocationId(
                    int allocationId) {

        BigDecimal total =
                rentPaymentDAO
                        .getTotalPaidAmountByAllocationId(
                                allocationId
                        );

        if (total == null) {

            return BigDecimal.ZERO;
        }

        return total;
    }

    public boolean hasPaymentsForAllocation(
            int allocationId) {

        return rentPaymentDAO
                .hasPaymentsForAllocation(
                        allocationId
                );
    }

    public List<RentPayment> searchPayments(
            String keyword) {

        return rentPaymentDAO
                .searchPayments(
                        keyword
                );
    }

    public RentPayment getPaymentById(
            int id) {

        return rentPaymentDAO
                .getPaymentById(id);
    }

    public boolean updatePayment(
            RentPayment payment) {

        if (payment == null) {

            return false;
        }

        RentPayment existingPayment =
                rentPaymentDAO.getPaymentById(
                        payment.getId()
                );

        if (existingPayment == null) {

            return false;
        }

        if (payment.getAmount() == null
                || payment.getAmount()
                        .compareTo(
                                BigDecimal.ZERO
                        ) <= 0) {

            return false;
        }

        boolean alreadyPaid =
                rentPaymentDAO
                        .hasPaymentForMonthExceptId(
                                payment.getAllocationId(),
                                payment.getMonthYear(),
                                payment.getId()
                        );

        if (alreadyPaid) {

            return false;
        }

        return rentPaymentDAO.updatePayment(
                payment
        );
    }

    public boolean deletePayment(
            int id) {

        RentPayment existingPayment =
                rentPaymentDAO.getPaymentById(id);

        if (existingPayment == null) {

            return false;
        }

        return rentPaymentDAO.deletePayment(
                id
        );
    }
}