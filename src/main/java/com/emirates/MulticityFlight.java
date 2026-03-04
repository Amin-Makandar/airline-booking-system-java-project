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
import jakarta.servlet.http.HttpSession;

@WebServlet("/multicity")
@SuppressWarnings("serial")
public class MulticityFlight extends HttpServlet{
	
	protected void service(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		String city1 = req.getParameter("City1");
		String city2 = req.getParameter("City2");
		String mdate = req.getParameter("Mdate");
		String multicitypassenger = req.getParameter("Multicitypassenger");
		String flightclass = req.getParameter("Flightclass");
		String city3 = req.getParameter("City3");
		String city4 = req.getParameter("City4");
		String m2date = req.getParameter("M2date");
		String multicity2passenger = req.getParameter("Multicity2passenger");
		String flightclass2 = req.getParameter("Flightclass2");
		String flighttype = "Multi-City-Flight";
		
		
		
				
			HttpSession session = req.getSession();
			session.setAttribute("city1", city1);
			session.setAttribute("city2", city2);
			session.setAttribute("mdate", mdate);
			session.setAttribute("multicitypassenger", multicitypassenger);
			session.setAttribute("flightclass", flightclass);
			session.setAttribute("city3", city3);
			session.setAttribute("city4", city4);
			session.setAttribute("m2date", m2date);
			session.setAttribute("multicity2passenger", multicity2passenger);
			session.setAttribute("flightclass2", flightclass2);
			session.setAttribute("flighttype", flighttype);
			
			
			
			RequestDispatcher rd = req.getRequestDispatcher("multi-city.jsp");
			rd.forward(req, res);
			
			
			
	}
}
