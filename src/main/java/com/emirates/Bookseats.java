package com.emirates;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/bookSeats")
public class Bookseats extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
			
		
		  String selectedSeatsStr = req.getParameter("selectedSeats");		    
		    // Check if selectedSeats parameter is not null
		    if (selectedSeatsStr != null && !selectedSeatsStr.isEmpty()) {
		        // Split selectedSeats string into an array
		        String[] selectedSeatsArray = selectedSeatsStr.split(",");		        
		        // Convert array to List
		        List<String> selectedSeatsList = Arrays.asList(selectedSeatsArray);		        
		        // Store selectedSeatsList in session
		        HttpSession session = req.getSession();
		        session.setAttribute("selectedSeats", selectedSeatsList);
		        // For debugging
		        System.out.println("Selected Seats: " + selectedSeatsList);
		        
		        String flighttype = (String) session.getAttribute("flighttype");
		        
		        if(flighttype != null && flighttype.equals("One-Way-Flight")) {
		        	
			        RequestDispatcher rd = req.getRequestDispatcher("onewayinformation.jsp");
			        rd.forward(req, res);
		        }
		        else if(flighttype != null && flighttype.equals("Return-Flight")) {
		        	
		        	RequestDispatcher rd = req.getRequestDispatcher("returninformation.jsp");
		        	rd.forward(req, res);
		        }
		        else if(flighttype != null && flighttype.equals("Multi-City-Flight")) {
		        	
		        	RequestDispatcher rd = req.getRequestDispatcher("multicityinformation.jsp");
		        	rd.forward(req, res);
		        }
		    } 
		    else {
		    	
		        System.out.println("No seats selected.");
		    }
	}
}
