package com.example.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.login.model.User;

public class UserDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/login_app";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "2250ueki";

    private static final String SELECT_USER_BY_USERNAME_PASSWORD = "SELECT * FROM users WHERE username = ? AND password = ?";

    public User getUserByUsernameAndPassword(String username, String password) {

        User user = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                 PreparedStatement stmt = conn.prepareStatement(SELECT_USER_BY_USERNAME_PASSWORD)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                System. out. println(stmt); 

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
