package com.emirates;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SignupServlet")
public class Signup extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handle POST (Form Submission)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("validateOtp".equals(action)) {
            validateOtp(request, response);
        }
    }

    // Handle GET (OTP generation)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("getOtp".equals(action)) {
            sendOtp(request, response);
        }
    }

    private void sendOtp(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String phoneNumber = request.getParameter("phone");
        String otp = generateOtp();

        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("phone", phoneNumber);

        System.out.println("Generated OTP: " + otp);

        response.setContentType("application/json");
        response.getWriter().write("{\"success\":true, \"otp\":\"" + otp + "\"}");
    }

    private void validateOtp(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        String userOtp = request.getParameter("otp");
        String sessionOtp = (String) session.getAttribute("otp");

        if (sessionOtp != null && sessionOtp.equals(userOtp)) {

            session.removeAttribute("otp");

            String firstName = request.getParameter("Firstname");
            String lastName = request.getParameter("Lastname");
            String birthDate = request.getParameter("Birthdate");
            String gender = request.getParameter("Gender");
            String country = request.getParameter("Countryname");
            String city = request.getParameter("Cityname");
            String email = request.getParameter("Email");
            String password = request.getParameter("Pass");
            String phone = (String) session.getAttribute("phone");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/airline_database", "root", "root");

                String checkQuery = "SELECT * FROM signup WHERE email=? OR phoneno=?";
                PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
                checkStmt.setString(1, email);
                checkStmt.setString(2, phone);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    session.setAttribute("msg", "Email or Phone already exists.");
                    response.sendRedirect("signup.jsp");
                    return;
                }

                String insertQuery = "INSERT INTO signup (firstname, lastname, birthdate, gender, countryname, cityname, email, pass, phoneno) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);

                insertStmt.setString(1, firstName);
                insertStmt.setString(2, lastName);
                insertStmt.setString(3, birthDate);
                insertStmt.setString(4, gender);
                insertStmt.setString(5, country);
                insertStmt.setString(6, city);
                insertStmt.setString(7, email);
                insertStmt.setString(8, password);
                insertStmt.setString(9, phone);

                insertStmt.executeUpdate();

                session.setAttribute("msg", "Sign up successfully. You can now login.");
                response.sendRedirect("login.jsp");

                conn.close();

            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("msg", "Database error occurred.");
                response.sendRedirect("signup.jsp");
            }

        } else {
            session.setAttribute("msg", "Invalid OTP. Try again.");
            response.sendRedirect("signup.jsp");
        }
    }

    private String generateOtp() {
        int otp = (int) (Math.random() * 900000) + 100000;
        return String.valueOf(otp);
    }
}