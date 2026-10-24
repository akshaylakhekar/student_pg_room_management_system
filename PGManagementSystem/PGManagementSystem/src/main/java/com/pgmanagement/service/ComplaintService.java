package com.pgmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pgmanagement.dao.ComplaintDAO;
import com.pgmanagement.model.Complaint;

@Service
public class ComplaintService {

    private final ComplaintDAO complaintDAO;

    public ComplaintService(
            ComplaintDAO complaintDAO) {

        this.complaintDAO = complaintDAO;
    }

    public boolean addComplaint(
            Complaint complaint) {

        return complaintDAO.addComplaint(
                complaint
        );
    }

    public List<Complaint> getAllComplaints() {

        return complaintDAO
                .getAllComplaints();
    }

    public List<Complaint> searchComplaints(
            String keyword) {

        return complaintDAO
                .searchComplaints(
                        keyword
                );
    }

    public List<Complaint> getComplaintsByStudentId(
            int studentId) {

        return complaintDAO
                .getComplaintsByStudentId(
                        studentId
                );
    }

    public Complaint getComplaintById(
            int id) {

        return complaintDAO
                .getComplaintById(id);
    }

    public boolean updateComplaint(
            Complaint complaint) {

        Complaint existingComplaint =
                complaintDAO.getComplaintById(
                        complaint.getId()
                );

        if (existingComplaint == null) {

            return false;
        }

        return complaintDAO.updateComplaint(
                complaint
        );
    }

    public boolean deleteComplaint(
            int id) {

        Complaint existingComplaint =
                complaintDAO.getComplaintById(id);

        if (existingComplaint == null) {

            return false;
        }

        return complaintDAO.deleteComplaint(
                id
        );
    }
}