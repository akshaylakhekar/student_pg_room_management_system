package com.pgmanagement.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.pgmanagement.model.Room;

@Repository
public class RoomDAO {

    private final JdbcTemplate jdbcTemplate;

    public RoomDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean addRoom(Room room) {

        String sql =
                "INSERT INTO rooms "
              + "(property_id, room_number, capacity, "
              + "sharing_type, rent_amount, status) "
              + "VALUES (?, ?, ?, ?, ?, ?)";

        int rows =
                jdbcTemplate.update(
                        sql,
                        room.getPropertyId(),
                        room.getRoomNumber(),
                        room.getCapacity(),
                        room.getSharingType(),
                        room.getRentAmount(),
                        room.getStatus()
                );

        return rows > 0;
    }

    public List<Room> getAllRooms() {

        String sql =
                "SELECT id, property_id, room_number, "
              + "capacity, sharing_type, rent_amount, status "
              + "FROM rooms "
              + "ORDER BY id DESC";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Room room = new Room();

                    room.setId(
                            rs.getInt("id")
                    );

                    room.setPropertyId(
                            rs.getInt("property_id")
                    );

                    room.setRoomNumber(
                            rs.getString("room_number")
                    );

                    room.setCapacity(
                            rs.getInt("capacity")
                    );

                    room.setSharingType(
                            rs.getString("sharing_type")
                    );

                    room.setRentAmount(
                            rs.getBigDecimal("rent_amount")
                    );

                    room.setStatus(
                            rs.getString("status")
                    );

                    return room;
                }
        );
    }

    public List<Room> getAvailableRooms() {

        String sql =
                "SELECT id, property_id, room_number, "
              + "capacity, sharing_type, rent_amount, status "
              + "FROM rooms "
              + "WHERE status = 'Available' "
              + "ORDER BY id DESC";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Room room = new Room();

                    room.setId(
                            rs.getInt("id")
                    );

                    room.setPropertyId(
                            rs.getInt("property_id")
                    );

                    room.setRoomNumber(
                            rs.getString("room_number")
                    );

                    room.setCapacity(
                            rs.getInt("capacity")
                    );

                    room.setSharingType(
                            rs.getString("sharing_type")
                    );

                    room.setRentAmount(
                            rs.getBigDecimal("rent_amount")
                    );

                    room.setStatus(
                            rs.getString("status")
                    );

                    return room;
                }
        );
    }

    public Room getRoomById(int id) {

        String sql =
                "SELECT id, property_id, room_number, "
              + "capacity, sharing_type, rent_amount, status "
              + "FROM rooms "
              + "WHERE id = ?";

        List<Room> rooms =
                jdbcTemplate.query(
                        sql,
                        (rs, rowNum) -> {

                            Room room = new Room();

                            room.setId(
                                    rs.getInt("id")
                            );

                            room.setPropertyId(
                                    rs.getInt("property_id")
                            );

                            room.setRoomNumber(
                                    rs.getString("room_number")
                            );

                            room.setCapacity(
                                    rs.getInt("capacity")
                            );

                            room.setSharingType(
                                    rs.getString("sharing_type")
                            );

                            room.setRentAmount(
                                    rs.getBigDecimal(
                                            "rent_amount"
                                    )
                            );

                            room.setStatus(
                                    rs.getString("status")
                            );

                            return room;
                        },
                        id
                );

        if (rooms.isEmpty()) {
            return null;
        }

        return rooms.get(0);
    }

    public boolean updateRoom(Room room) {

        String sql =
                "UPDATE rooms SET "
              + "property_id = ?, "
              + "room_number = ?, "
              + "capacity = ?, "
              + "sharing_type = ?, "
              + "rent_amount = ?, "
              + "status = ? "
              + "WHERE id = ?";

        int rows =
                jdbcTemplate.update(
                        sql,
                        room.getPropertyId(),
                        room.getRoomNumber(),
                        room.getCapacity(),
                        room.getSharingType(),
                        room.getRentAmount(),
                        room.getStatus(),
                        room.getId()
                );

        return rows > 0;
    }

    public boolean deleteRoom(int id) {

        try {

            String sql =
                    "DELETE FROM rooms "
                  + "WHERE id = ?";

            int rows =
                    jdbcTemplate.update(
                            sql,
                            id
                    );

            return rows > 0;

        } catch (Exception e) {

            return false;
        }
    }

    public List<Room> searchRooms(
            String keyword) {

        String sql =
                "SELECT id, property_id, room_number, "
              + "capacity, sharing_type, rent_amount, status "
              + "FROM rooms "
              + "WHERE room_number LIKE ? "
              + "OR sharing_type LIKE ? "
              + "OR status LIKE ? "
              + "ORDER BY id DESC";

        String search =
                "%" + keyword + "%";

        return jdbcTemplate.query(
                sql,
                (rs, rowNum) -> {

                    Room room = new Room();

                    room.setId(
                            rs.getInt("id")
                    );

                    room.setPropertyId(
                            rs.getInt("property_id")
                    );

                    room.setRoomNumber(
                            rs.getString("room_number")
                    );

                    room.setCapacity(
                            rs.getInt("capacity")
                    );

                    room.setSharingType(
                            rs.getString("sharing_type")
                    );

                    room.setRentAmount(
                            rs.getBigDecimal("rent_amount")
                    );

                    room.setStatus(
                            rs.getString("status")
                    );

                    return room;
                },
                search,
                search,
                search
        );
    }

    public int getAllocationCountByRoomId(
            int roomId) {

        String sql =
                "SELECT COUNT(*) "
              + "FROM room_allocations "
              + "WHERE room_id = ?";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        roomId
                );

        return count == null ? 0 : count;
    }

    public boolean updateRoomStatus(
            int roomId,
            String status) {

        String sql =
                "UPDATE rooms "
              + "SET status = ? "
              + "WHERE id = ?";

        int rows =
                jdbcTemplate.update(
                        sql,
                        status,
                        roomId
                );

        return rows > 0;
    }

    public boolean isRoomAvailable(
            int roomId) {

        String sql =
                "SELECT COUNT(*) "
              + "FROM rooms "
              + "WHERE id = ? "
              + "AND (status IS NULL "
              + "OR status = 'Available')";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        roomId
                );

        return count != null
                && count > 0;
    }
}