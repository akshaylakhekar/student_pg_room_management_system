package com.pgmanagement.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.pgmanagement.model.Property;

@Repository
public class PropertyDAO {

    private final JdbcTemplate jdbcTemplate;

    public PropertyDAO(
            JdbcTemplate jdbcTemplate) {

        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean addProperty(
            Property property) {

        String sql =
                "INSERT INTO properties "
              + "(property_name, address, owner_name, "
              + "contact_number) "
              + "VALUES (?, ?, ?, ?)";

        int rows =
                jdbcTemplate.update(
                        sql,
                        property.getPropertyName(),
                        property.getAddress(),
                        property.getOwnerName(),
                        property.getContactNumber()
                );

        return rows > 0;
    }

    public List<Property> getAllProperties() {

        String sql =
                "SELECT * "
              + "FROM properties "
              + "ORDER BY id DESC";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Property property =
                            new Property();

                    property.setId(
                            rs.getInt("id")
                    );

                    property.setPropertyName(
                            rs.getString(
                                    "property_name"
                            )
                    );

                    property.setAddress(
                            rs.getString("address")
                    );

                    property.setOwnerName(
                            rs.getString(
                                    "owner_name"
                            )
                    );

                    property.setContactNumber(
                            rs.getString(
                                    "contact_number"
                            )
                    );

                    return property;
                }
        );
    }

    public List<Property> searchProperties(
            String keyword) {

        String sql =
                "SELECT * "
              + "FROM properties "
              + "WHERE property_name LIKE ? "
              + "OR address LIKE ? "
              + "OR owner_name LIKE ? "
              + "OR contact_number LIKE ? "
              + "ORDER BY id DESC";

        String searchKeyword =
                "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Property property =
                            new Property();

                    property.setId(
                            rs.getInt("id")
                    );

                    property.setPropertyName(
                            rs.getString(
                                    "property_name"
                            )
                    );

                    property.setAddress(
                            rs.getString("address")
                    );

                    property.setOwnerName(
                            rs.getString(
                                    "owner_name"
                            )
                    );

                    property.setContactNumber(
                            rs.getString(
                                    "contact_number"
                            )
                    );

                    return property;
                },
                searchKeyword,
                searchKeyword,
                searchKeyword,
                searchKeyword
        );
    }

    public Property getPropertyById(
            int id) {

        String sql =
                "SELECT * "
              + "FROM properties "
              + "WHERE id = ?";

        List<Property> properties =
                jdbcTemplate.query(
                        sql,
                        (rs, rowNum) -> {

                            Property property =
                                    new Property();

                            property.setId(
                                    rs.getInt("id")
                            );

                            property.setPropertyName(
                                    rs.getString(
                                            "property_name"
                                    )
                            );

                            property.setAddress(
                                    rs.getString(
                                            "address"
                                    )
                            );

                            property.setOwnerName(
                                    rs.getString(
                                            "owner_name"
                                    )
                            );

                            property.setContactNumber(
                                    rs.getString(
                                            "contact_number"
                                    )
                            );

                            return property;
                        },
                        id
                );

        if (properties.isEmpty()) {
            return null;
        }

        return properties.get(0);
    }

    public boolean updateProperty(
            Property property) {

        String sql =
                "UPDATE properties SET "
              + "property_name = ?, "
              + "address = ?, "
              + "owner_name = ?, "
              + "contact_number = ? "
              + "WHERE id = ?";

        int rows =
                jdbcTemplate.update(
                        sql,
                        property.getPropertyName(),
                        property.getAddress(),
                        property.getOwnerName(),
                        property.getContactNumber(),
                        property.getId()
                );

        return rows > 0;
    }

    public int getRoomCountByPropertyId(
            int propertyId) {

        String sql =
                "SELECT COUNT(*) "
              + "FROM rooms "
              + "WHERE property_id = ?";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        propertyId
                );

        return count == null ? 0 : count;
    }

    public boolean deleteProperty(
            int id) {

        String sql =
                "DELETE FROM properties "
              + "WHERE id = ?";

        int rows =
                jdbcTemplate.update(
                        sql,
                        id
                );

        return rows > 0;
    }
}