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
public class RoomDAO extends DBContext {

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

    public List<Rooms> getRoomsForPage(int pageNumber, int roomsPerPage, int userId) {
        List<Rooms> roomList = new ArrayList<>();

        try {
            int offset = (pageNumber - 1) * roomsPerPage;

            String query = "Select * from Rooms\n"
                    + "  where Rid in (select distinct RoomID from INVOICES where userid = ?)  \n"
                    + " Order by RID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, offset);
            preparedStatement.setInt(3, roomsPerPage);

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

    public int getNumberOfRooms(int userId) {
        int numberOfRooms = 0;

        try {
            String query = "select Count( distinct RoomID) as TotalRooms from INVOICES where USERid = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, userId);
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

    public int checkAvailable(int roomId, int required) {
        Rooms room = null;

        try {
            String query = "SELECT [RID]\n"
                    + "      ,[Size]\n"
                    + "      ,[Capacity]\n"
                    + "      ,[Img]\n"
                    + "      ,[Status]\n"
                    + "      ,[BID]\n"
                    + "      ,[RoomName]\n"
                    + "      ,[Price]\n"
                    + "      ,[Details]\n"
                    + "      ,CASE\n"
                    + "			WHEN [RID] =r2.RoomID THEN R.TotalRoom - r2.total\n"
                    + "			ELSE R.TotalRoom\n"
                    + "		END as RoomLeft\n"
                    + "from Rooms R LEFT JOIN (SELECT RoomID, count(RoomID) as total from INVOICES\n"
                    + "where GETDATE() < CheckOutDate\n"
                    + "group by RoomID) r2\n"
                    + "on r.RID = r2.RoomID\n"
                    + "Where R.RID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, roomId);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int total = resultSet.getInt("RoomLeft");
                return total;

            }

        } catch (SQLException e) {
            System.out.println("getRoomById: " + e.getMessage());
        }

        return -1;
    }

    public boolean addRoom(Rooms room) {
        try {
            String query = "INSERT INTO Rooms (Size, Capacity, Img, Status, BID, RoomName, Price, Details) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setInt(1, room.getSize());
            preparedStatement.setInt(2, room.getCapacity());
            preparedStatement.setString(3, room.getImg());
            preparedStatement.setInt(4, room.getStatus());
            preparedStatement.setInt(5, room.getBID());
            preparedStatement.setString(6, room.getName());
            preparedStatement.setDouble(7, room.getPrice());
            preparedStatement.setString(8, room.getDetail());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("addRoom: " + e.getMessage());
            return false;
        }
    }

    // Method to update an existing room
    public boolean updateRoom(Rooms room) {
        try {
            String query = "UPDATE Rooms SET Size=?, Capacity=?, Img=?, Status=?, BID=?, RoomName=?, Price=?, Details=? "
                    + "WHERE RID=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setInt(1, room.getSize());
            preparedStatement.setInt(2, room.getCapacity());
            preparedStatement.setString(3, room.getImg());
            preparedStatement.setInt(4, room.getStatus());
            preparedStatement.setInt(5, room.getBID());
            preparedStatement.setString(6, room.getName());
            preparedStatement.setDouble(7, room.getPrice());
            preparedStatement.setString(8, room.getDetail());
            preparedStatement.setInt(9, room.getRID());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("updateRoom: " + e.getMessage());
            return false;
        }
    }

}
