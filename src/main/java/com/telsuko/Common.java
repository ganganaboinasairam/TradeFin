package com.telsuko;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Common {

    public void storeUserData(String username, String email, String password) {
        try (Connection conn = DatabaseConnectionManager.getConnection()) {
            String sql = "INSERT INTO USER_DATA (username, email, password) VALUES (?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            	System.out.println("//////////////////inside store user data method//////////////////");
                stmt.setString(1, username);
                stmt.setString(2, email);
                stmt.setString(3, password);
                stmt.executeUpdate();
                System.out.println("User data inserted successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection or insertion error
        }
    }

    public boolean validateUser(String username, String password) {
        String sql = "SELECT * FROM USER_DATA WHERE username = ? AND password = ?";
        try (Connection conn = DatabaseConnectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next(); // Returns true if a row is found
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database connection or query error
            return false;
        }
    }
}
