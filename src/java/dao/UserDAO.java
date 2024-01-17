package dao;

import DAL.DBContext;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDAO extends DBContext{
    
    public UserDAO() {
        super();
    }
    
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM USERS WHERE Username = ? or email = ?";
        User user = new User();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));
                user.setGender(rs.getInt("gender"));
                user.setDob(rs.getString("dob"));
                user.setImg(rs.getString("img"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getInt("role"));
                user.setStatus(rs.getInt("status"));
                user.setDescription(rs.getString("description"));
                user.setWallet(rs.getDouble("wallet"));
            }
        } catch (Exception e) {
            System.out.println("getUserByUsername: " + e.getMessage());
        }
        return user;
    }

    public boolean checkExistedUserWithUsernameAndPassword(String username, String password) {
        String sql = "SELECT * FROM USERS WHERE (username = ? or email = ?) AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, username);
            ps.setString(3, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("checkExistedUserWithUsernameAndPassword: " + e.getMessage());
        }
        return false;
    }

    public boolean checkExistedUserWithUsername(String username) {
        String sql = "SELECT * FROM USERS WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("checkExistedUserWithUsername: " + e.getMessage());
        }
        return false;
    }

    public boolean checkExistedEmail(String email) {
        String sql = "select email from users where email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("checkExistedEmail: " + e.getMessage());
        }
        return false;
    }

    public void signUp(String fullName, String gender, String username, String password, String email, String dob) {
        try {
            String sql = "INSERT INTO USERS (username, dob, email,full_name,gender,password,role)"
                    + "VALUES (?, ?, ?, ?, ?, ?,?);";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, username);
            pstm.setString(2, dob);
            pstm.setString(3, email);
            pstm.setString(4, fullName);
            String genderINT = "";
            if (gender.equals("Male")) {
                genderINT = 1 + "";
            } else {
                genderINT = 0 + "";
            }
            pstm.setString(5, genderINT);
            pstm.setString(6, password);
            pstm.setString(7, "3");
            pstm.executeUpdate();
            //Close pstm
            pstm.close();
        } catch (SQLException e) {
            System.out.println("Sign up failed: " + e.getMessage());
        }
    }
}
