package com.social;

import java.util.*;
import java.sql.*;

public class CommentManager {
    private static final String DB_URL = "jdbc:postgresql://aws-1-ap-southeast-2.pooler.supabase.com:5432/postgres?user=postgres.guaascekpywutghiviiz&password=Subzero@1235678";
    public CommentManager() {
        try {
            Class.forName("org.postgresql.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL);
                Statement stmt = conn.createStatement()) {
                String sql = "CREATE TABLE IF NOT EXISTS comments (" +
                             "id SERIAL PRIMARY KEY," +
                             "username TEXT NOT NULL," +
                             "comment_text TEXT NOT NULL," +
                             "likes INTEGER DEFAULT 0)";
                stmt.execute(sql);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addComment(Comment c) throws InvalidCommentException {

        if (c.userName == null || c.userName.isEmpty()) {
            throw new InvalidCommentException("Username cannot be empty!");
        }

        if (c.getFormattedComment().isEmpty()) {
            throw new InvalidCommentException("Comment cannot be empty!");
        }

        if (c.likes < 0) {
            throw new InvalidCommentException("Likes cannot be negative!");
        }

        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement pstmt = conn.prepareStatement("INSERT INTO comments (username, comment_text, likes) VALUES (?, ?, ?)")) {
            pstmt.setString(1, c.userName);
            pstmt.setString(2, c.getFormattedComment());
            pstmt.setInt(3, c.likes);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Comment> getComments() {
        ArrayList<Comment> comments = new ArrayList<>();
        String query = "SELECT username, comment_text, likes FROM comments";

        try (Connection conn = DriverManager.getConnection(DB_URL);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                comments.add(new Comment(
                        rs.getString("username"),
                        rs.getString("comment_text"),
                        rs.getInt("likes")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }

    public ArrayList<Comment> getSortedComments() {
        ArrayList<Comment> comments = new ArrayList<>();
        String query = "SELECT username, comment_text, likes FROM comments ORDER BY likes ASC";

        try (Connection conn = DriverManager.getConnection(DB_URL);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                comments.add(new Comment(
                        rs.getString("username"),
                        rs.getString("comment_text"),
                        rs.getInt("likes")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }
}