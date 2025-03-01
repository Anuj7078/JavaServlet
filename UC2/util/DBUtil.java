package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/registration_db";
    private static final String USER = "root";
    private static final String PASSWORD = "Anuj7078";

    static {
        try {
            // Explicitly load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL JDBC Driver loaded successfully.");
        } catch (ClassNotFoundException e) {
            System.err.println("Failed to load MySQL JDBC Driver: " + e.getMessage());
            throw new RuntimeException("Failed to load MySQL JDBC Driver", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        System.out.println("Connecting to database...");
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        System.out.println("Connected to database!");
        return conn;
    }
}