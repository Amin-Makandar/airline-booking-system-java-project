package com.emirates;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgetpassword")
@SuppressWarnings("serial")
public class ForgetPassword extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Retrieve form field values
        String userIdentifier = req.getParameter("userIdentifier");
        String newpassword = req.getParameter("newpassword");
        
        try {
			//load the register
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Runing Properly");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Establishing the database connection
        String url = "jdbc:mysql://localhost:3306/airline_database";
        String username = "root";
        String password = "root";

        String message = null;

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Establish connection
            connection = DriverManager.getConnection(url, username, password);

            // Check if email or phoneno exists in the database
            String query = "SELECT * FROM signup WHERE email = ? OR phoneno = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, userIdentifier);
            statement.setString(2, userIdentifier);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // Email exists, update the password
                String updateQuery = "UPDATE signup SET pass = ? WHERE email = ? OR phoneno = ?";
                statement = connection.prepareStatement(updateQuery);
                statement.setString(1, newpassword);
                statement.setString(2, userIdentifier);
                statement.setString(3, userIdentifier);
                int rowsAffected = statement.executeUpdate();

                if (rowsAffected > 0) {
                    // Password updated successfully
                    message = "Password updated successfully.";
                    
                } else {
                    // Password update failed
                    message = "Failed to update password.";
                }
            } else {
                // Email not found
                message = "Email or Phone Number not found. Please sign up.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Internal server error. Please try again later.";
        } finally {
            // Close resources
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Set message attribute in request
        req.setAttribute("message", message);

        // Forward the request to the JSP page
        RequestDispatcher rd = req.getRequestDispatcher("forgetpassword.jsp");
        rd.forward(req, res);
        
        
    }
}
