package com.example.servlet;

import com.example.model.User;
import com.example.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate Name
        if (!isValidName(name)) {
            response.sendRedirect("register.jsp?error=Name must start with a capital letter and have at least 3 characters.");
            return;
        }

        // Validate Password
        String passwordError = isValidPassword(password);
        if (passwordError != null) {
            response.sendRedirect("register.jsp?error=" + passwordError);
            return;
        }

        // Proceed with registration if validation passes
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            System.out.println("Executing query: " + sql);
            int rowsInserted = statement.executeUpdate();
            System.out.println(rowsInserted + " row(s) inserted.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Database error. Please try again.");
            return;
        }

        response.sendRedirect("login.jsp");
    }

    // Name validation method
    private boolean isValidName(String name) {
        if (name == null || name.length() < 3) {
            return false;
        }
        // Check if the first character is uppercase
        return Character.isUpperCase(name.charAt(0));
    }

    // Password validation method
    private String isValidPassword(String password) {
        if (password == null || password.length() < 8) {
            return "Password must have at least 8 characters.";
        }

        boolean hasUppercase = !password.equals(password.toLowerCase());
        boolean hasDigit = password.matches(".*\\d.*");
        boolean hasSpecialChar = password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*");

        // Count special characters
        long specialCharCount = password.chars().filter(ch -> !Character.isLetterOrDigit(ch)).count();

        if (!hasUppercase) {
            return "Password must contain at least 1 uppercase letter.";
        }
        if (!hasDigit) {
            return "Password must contain at least 1 numeric digit.";
        }
        if (specialCharCount != 1) {
            return "Password must contain exactly 1 special character.";
        }

        return null; // No error
    }
}