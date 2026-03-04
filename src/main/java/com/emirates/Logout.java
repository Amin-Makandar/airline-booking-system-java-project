package com.emirates;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		
		// Assuming you have a reference to the HttpSession object
		HttpSession session = req.getSession();

		// Call invalidate method to end the session
		session.invalidate();
		
		
		
		
		RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
		rd.forward(req, res);

	}
}

