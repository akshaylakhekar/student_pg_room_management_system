package com.pgmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pgmanagement.dao.RoomDAO;
import com.pgmanagement.model.Room;

@Service
public class RoomService {

    private final RoomDAO roomDAO;

    public RoomService(
            RoomDAO roomDAO) {

        this.roomDAO = roomDAO;
    }

    public boolean addRoom(
            Room room) {

        if (room == null) {

            return false;
        }

        return roomDAO.addRoom(
                room
        );
    }

    public List<Room> getAllRooms() {

        return roomDAO.getAllRooms();
    }

    public List<Room> searchRooms(
            String keyword) {

        return roomDAO.searchRooms(
                keyword
        );
    }

    public List<Room> getAvailableRooms() {

        return roomDAO.getAvailableRooms();
    }

    public Room getRoomById(
            int id) {

        return roomDAO.getRoomById(id);
    }

    public boolean updateRoom(
            Room room) {

        if (room == null) {

            return false;
        }

        Room existingRoom =
                roomDAO.getRoomById(
                        room.getId()
                );

        if (existingRoom == null) {

            return false;
        }

        return roomDAO.updateRoom(
                room
        );
    }

    public int getAllocationCountByRoomId(
            int roomId) {

        return roomDAO
                .getAllocationCountByRoomId(
                        roomId
                );
    }

    public boolean canDeleteRoom(
            int roomId) {

        Room existingRoom =
                roomDAO.getRoomById(
                        roomId
                );

        if (existingRoom == null) {

            return false;
        }

        int allocationCount =
                getAllocationCountByRoomId(
                        roomId
                );

        return allocationCount == 0;
    }

    public boolean deleteRoom(
            int id) {

        if (!canDeleteRoom(id)) {

            return false;
        }

        return roomDAO.deleteRoom(id);
    }

    public boolean updateRoomStatus(
            int roomId,
            String status) {

        Room existingRoom =
                roomDAO.getRoomById(
                        roomId
                );

        if (existingRoom == null) {

            return false;
        }

        return roomDAO.updateRoomStatus(
                roomId,
                status
        );
    }
}