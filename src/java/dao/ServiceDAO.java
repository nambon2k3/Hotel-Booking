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
import model.Servicess;

/**
 *
 * @author Admin
 */
public class ServiceDAO extends DBContext {

    public List<Servicess> getTopServices(int count) {
        List<Servicess> serviceList = new ArrayList<>();

        try {
            String query = "SELECT TOP (?) * FROM Servicess";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, count);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Servicess service = Servicess.createFromResultSet(resultSet);
                serviceList.add(service);
            }

        } catch (SQLException e) {
            System.out.println("getTopServices: " + e.getMessage());
        }

        return serviceList;
    }

    public List<Servicess> getServicesByRoomId(int roomId) {
        List<Servicess> serviceList = new ArrayList<>();

        try {
            String query = "SELECT S.* FROM Servicess S "
                    + "JOIN RoomServices RS ON S.SeID = RS.SeID "
                    + "WHERE RS.RID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, roomId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Servicess service = Servicess.createFromResultSet(resultSet);
                serviceList.add(service);
            }

        } catch (SQLException e) {
            System.out.println("getServicesByRoomId: " + e.getMessage());
        }

        return serviceList;
    }
}
