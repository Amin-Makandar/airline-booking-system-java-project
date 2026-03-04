package com.emirates;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/oneway")
@SuppressWarnings("serial")
public class OnewayFlight extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		
		
		String onefrom = req.getParameter("Onefrom");
		String oneto = req.getParameter("Oneto");
		String onedate = req.getParameter("Onedate");
		String onewaypassenger = req.getParameter("Onewaypassenger");
		String flightclass = req.getParameter("Flightclass");
		
		
		String flighttype = "One-Way-Flight";
        

		
		HttpSession session = req.getSession();
		session.setAttribute("onefrom", onefrom);
		session.setAttribute("oneto", oneto);
		session.setAttribute("onedate", onedate);
		session.setAttribute("onewaypassenger", onewaypassenger);
		session.setAttribute("flightclass", flightclass);
		session.setAttribute("flighttype", flighttype);
 
		
		RequestDispatcher rd = req.getRequestDispatcher("one-way.jsp");
		rd.forward(req, res);
		
		
		}
		
		
	}

	

		


