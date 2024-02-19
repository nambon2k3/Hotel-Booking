package dao;

import DAL.DBContext;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.RoomService;

public class RoomServiceDAO extends DBContext {

    public boolean addRoomService(RoomService roomService) {
        try {
            String query = "INSERT INTO RoomServices (RID, SeID) VALUES (?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, roomService.getRID());
            preparedStatement.setInt(2, roomService.getSeID());

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("addRoomService: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteRoomService(int RID, int SeID) {
        try {
            String query = "DELETE FROM RoomServices WHERE RID = ? AND SeID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, RID);
            preparedStatement.setInt(2, SeID);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("deleteRoomService: " + e.getMessage());
            return false;
        }
    }
}
