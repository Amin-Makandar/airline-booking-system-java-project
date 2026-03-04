package com.emirates;

import java.io.IOException;
import java.util.Enumeration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/returnflightvalues")
public class ReturnFlightValues extends HttpServlet {
	
		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	        String flightId = req.getParameter("flightId");
	        String price = req.getParameter("price");
	        String time1 = req.getParameter("time1");
	        String time2 = req.getParameter("time2");
	        
	        
	        HttpSession session = req.getSession(false);
	        
	        
	        String numberofpassenger = (String) session.getAttribute("Returnpassenger");
	        
	        session.setAttribute("flightId", flightId);
	        session.setAttribute("price", price);
	        session.setAttribute("time1", time1);
	        session.setAttribute("time2", time2);
	        session.setAttribute("numberofpassenger", numberofpassenger);
	        
	        
	     
	        System.out.println(numberofpassenger);
	        
	       

	        
	       
	     // Redirect to seatsbooking.jsp
	        RequestDispatcher rd = req.getRequestDispatcher("/seatsbooking.jsp");
	        rd.forward(req, res);
	        
	    }
}

