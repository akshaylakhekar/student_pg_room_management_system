package com.pgmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pgmanagement.dao.PropertyDAO;
import com.pgmanagement.model.Property;

@Service
public class PropertyService {

    private final PropertyDAO propertyDAO;

    public PropertyService(
            PropertyDAO propertyDAO) {

        this.propertyDAO = propertyDAO;
    }

    public boolean addProperty(
            Property property) {

        return propertyDAO.addProperty(
                property
        );
    }

    public List<Property> getAllProperties() {

        return propertyDAO
                .getAllProperties();
    }

    public List<Property> searchProperties(
            String keyword) {

        return propertyDAO
                .searchProperties(
                        keyword
                );
    }

    public Property getPropertyById(
            int id) {

        return propertyDAO
                .getPropertyById(id);
    }

    public boolean updateProperty(
            Property property) {

        return propertyDAO
                .updateProperty(
                        property
                );
    }

    public int getRoomCountByPropertyId(
            int propertyId) {

        return propertyDAO
                .getRoomCountByPropertyId(
                        propertyId
                );
    }

    public boolean canDeleteProperty(
            int propertyId) {

        int roomCount =
                getRoomCountByPropertyId(
                        propertyId
                );

        return roomCount == 0;
    }

    public boolean deleteProperty(
            int id) {

        if (!canDeleteProperty(id)) {

            return false;
        }

        return propertyDAO.deleteProperty(id);
    }
}