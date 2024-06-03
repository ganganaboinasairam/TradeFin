package com.telsuko;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnectionManager {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String USER = "SAIRAM";
    private static final String PASSWORD = "SAIRAM";
    
    private static Connection connection;

    private DatabaseConnectionManager() {
        // Private constructor to prevent instantiation
    }

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed()) {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        }
        return connection;
    }
    
    public static void closeConnection() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}
