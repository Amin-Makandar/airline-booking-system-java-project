package com.emirates;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/return")
@SuppressWarnings("serial")
public class ReturnFlight extends HttpServlet{
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
		
		String Rfrom = req.getParameter("Rfrom");
		String Rto = req.getParameter("Rto");
		String Departuredate = req.getParameter("DDate");
		String Returndate = req.getParameter("RDate");
		String Returnpassenger = req.getParameter("Returnpassenger");
		String flightclass = req.getParameter("Flightclass");
		String flighttype = "Return-Flight";
		
		
			HttpSession session = req.getSession();
			session.setAttribute("Rfrom", Rfrom);
			session.setAttribute("Rto", Rto);
			session.setAttribute("Departuredate", Departuredate);
			session.setAttribute("Returndate", Returndate);
			session.setAttribute("Returnpassenger", Returnpassenger);
			session.setAttribute("flightclass", flightclass);
			session.setAttribute("flighttype", flighttype);
			
			
			RequestDispatcher rd = req.getRequestDispatcher("return.jsp");
			rd.forward(req, res);
			
			
			
		
	}
}
