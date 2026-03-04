package com.emirates;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
@SuppressWarnings("serial")
public class Login extends HttpServlet {
	protected void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException 
	{
		boolean isValidUser = false;
		 
		try {
			//load the register
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Runing Properly");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//establishing the connection
		String url = "jdbc:mysql://localhost:3306/airline_database";
		String username="root";
		String password="root";
		
		
		String uservalue=req.getParameter("Uservalue");
		String userpassword=req.getParameter("Userpassword");
		
	
		
		
		try {
			
	
			
			Connection con=DriverManager.getConnection(url, username, password);
			String query = "SELECT phoneno, username  FROM signup WHERE( phoneno = ? OR email = ? OR username = ?) AND pass = ?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, uservalue);
			pstmt.setString(2, uservalue);
			pstmt.setString(3, uservalue);
			pstmt.setString(4, userpassword);
			//pstmt.executeUpdate();
			ResultSet resultSet = pstmt.executeQuery();
			if(resultSet.next())
			{	
				isValidUser=true;
				req.setAttribute("errorMessage", "Login successfully");
				RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
				rd.forward(req, res);
				
				// Fetch user details and save in session
				if(isValidUser) {
		        	String query2 = "SELECT customerid, firstname, lastname, pass, username  FROM signup WHERE (phoneno = ? OR email = ? OR username = ?) AND pass = ?";
		        	PreparedStatement pstmt2 = con.prepareStatement(query2);
		        	
		        	pstmt2.setString(1, uservalue);
		    		pstmt2.setString(2, uservalue);
		    		pstmt2.setString(3, uservalue);
		    		pstmt2.setString(4, userpassword);
		    		
		    		// Execute the query
		    	    ResultSet resultSet2 = pstmt2.executeQuery();
		    	    
		    	    if (resultSet2.next()) {
		    	        String firstname = resultSet2.getString("firstname");
		    	        String lastname = resultSet2.getString("lastname");
		    	        String pass = resultSet2.getString("pass");
		    	        String user = resultSet2.getString("username");
		    	        int customerid = resultSet2.getInt("customerid");
		    	        
		    	        HttpSession session = req.getSession();
		    	        session.setAttribute("firstname", firstname);
		    	        session.setAttribute("lastname", lastname);
		    	        session.setAttribute("pass", pass);
		    	        session.setAttribute("username", user); // Add username to session
		    	        session.setAttribute("customerid",customerid);
		    	        
		    	        System.out.println("Firstname from Session: " + session.getAttribute("firstname"));
		    	        System.out.println("Lastname from Session: " + session.getAttribute("lastname"));
		    	        System.out.println("Pass from Session: "+session.getAttribute("pass"));
		    	        System.out.println("Username from Session: " + session.getAttribute("username"));
		    	        System.out.println("customerid: "+session.getAttribute("customerid"));
		    	        resultSet2.close();
		    	        pstmt2.close();
		    	    }
		        }
			
			}else {
				
				if (!isValidUser) {
			        // If login fails, set an error message attribute and forward back to login page
			        req.setAttribute("errorMessage", "Incorrect username or password.");
			        RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			        rd.forward(req, res);
			    }
				
			}
	        pstmt.close();
	        con.close();
	        
	        
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
	
	}
}








