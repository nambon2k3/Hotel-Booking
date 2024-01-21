/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import DAL.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Rooms;

/**
 *
 * @author Admin
 */
public class RoomDAO extends  DBContext{
    public List<Rooms> getAllRooms() {
        List<Rooms> roomList = new ArrayList<>();

        try {
            String query = "SELECT * FROM Rooms";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Rooms room = new Rooms();
                room.setRID(resultSet.getInt("RID"));
                room.setSize(resultSet.getInt("Size"));
                room.setCapacity(resultSet.getInt("Capacity"));
                room.setImg(resultSet.getString("Img"));
                room.setStatus(resultSet.getInt("Status"));
                room.setBID(resultSet.getInt("BID"));
                room.setName(resultSet.getString("RoomName"));
                room.setPrice(resultSet.getDouble("Price"));
                room.setDetail(resultSet.getString("Details"));
                roomList.add(room);
            }

        } catch (SQLException e) {
            System.out.println("getAllRooms: " + e.getMessage());
        }

        return roomList;
    }
    
    
    
    
    public List<Rooms> getRoomsForPage(int pageNumber, int roomsPerPage) {
        List<Rooms> roomList = new ArrayList<>();

        try {
            int offset = (pageNumber - 1) * roomsPerPage;

            String query = "SELECT * FROM Rooms "
                         + "ORDER BY RID "
                         + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, offset);
            preparedStatement.setInt(2, roomsPerPage);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Rooms room = new Rooms();
                room.setRID(resultSet.getInt("RID"));
                room.setSize(resultSet.getInt("Size"));
                room.setCapacity(resultSet.getInt("Capacity"));
                room.setImg(resultSet.getString("Img"));
                room.setStatus(resultSet.getInt("Status"));
                room.setBID(resultSet.getInt("BID"));
                room.setName(resultSet.getString("RoomName"));
                room.setPrice(resultSet.getDouble("Price"));
                room.setDetail(resultSet.getString("Details"));
                roomList.add(room);
            }

        } catch (SQLException e) {
            System.out.println("getRoomsForPageL: " + e.getMessage());
        }

        return roomList;
    }
    
    public List<Rooms> getRandomRooms(int count) {
        List<Rooms> roomList = new ArrayList<>();

        try {
            String query = "SELECT TOP (?) * FROM ROOMS ORDER BY NEWID()";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, count);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Rooms room = new Rooms();
                room.setRID(resultSet.getInt("RID"));
                room.setSize(resultSet.getInt("Size"));
                room.setCapacity(resultSet.getInt("Capacity"));
                room.setImg(resultSet.getString("Img"));
                room.setStatus(resultSet.getInt("Status"));
                room.setBID(resultSet.getInt("BID"));
                room.setName(resultSet.getString("RoomName"));
                room.setPrice(resultSet.getDouble("Price"));
                room.setDetail(resultSet.getString("Details"));
                roomList.add(room);
            }

        } catch (SQLException e) {
            System.out.println("getRandomRooms: " + e.getMessage());
        }

        return roomList;
    }
    
    public int getNumberOfRooms() {
        int numberOfRooms = 0;

        try {
            String query = "SELECT COUNT(*) AS TotalRooms FROM Rooms";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                numberOfRooms = resultSet.getInt("TotalRooms");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return numberOfRooms;
    }
    
    public Rooms getRoomById(int roomId) {
        Rooms room = null;

        try {
            String query = "SELECT * FROM Rooms WHERE RID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, roomId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                room = new Rooms();
                room.setRID(resultSet.getInt("RID"));
                room.setSize(resultSet.getInt("Size"));
                room.setCapacity(resultSet.getInt("Capacity"));
                room.setImg(resultSet.getString("Img"));
                room.setStatus(resultSet.getInt("Status"));
                room.setBID(resultSet.getInt("BID"));
                room.setName(resultSet.getString("RoomName"));
                room.setPrice(resultSet.getDouble("Price"));
                room.setDetail(resultSet.getString("Details"));
            }

        } catch (SQLException e) {
            System.out.println("getRoomById: " + e.getMessage());
        }

        return room;
    }
    
    
    
}
