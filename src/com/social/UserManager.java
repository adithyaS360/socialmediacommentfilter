package com.social;

import java.sql.*;

public class UserManager {
    private static final String DB_URL = "jdbc:sqlite:comments.db";

    public UserManager() {
        try {
            Class.forName("org.sqlite.JDBC");
            try (Connection conn = DriverManager.getConnection(DB_URL);
                    Statement stmt = conn.createStatement()) {
                String sql = "CREATE TABLE IF NOT EXISTS users (" +
                        "id INTEGER PRIMARY KEY AUTOINCREMENT," +
                        "username TEXT UNIQUE NOT NULL," +
                        "password TEXT NOT NULL)";
                stmt.execute(sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean register(String username, String password) {
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            return false;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL);
                PreparedStatement pstmt = conn
                        .prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)")) {
            pstmt.setString(1, username.trim());
            pstmt.setString(2, password);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            // Probably unique constraint violation (username exists)
            e.printStackTrace();
            return false;
        }
    }

    public boolean authenticate(String username, String password) {
        if (username == null || password == null)
            return false;

        String query = "SELECT id FROM users WHERE username = ? AND password = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL);
                PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, username.trim());
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next(); // True if a match is found
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
