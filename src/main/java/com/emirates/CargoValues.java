package com.emirates;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cargovalues")
public class CargoValues extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException {
		String flightId = req.getParameter("flightId");
		String price = req.getParameter("price");
		String time = req.getParameter("time");
		
		HttpSession session = req.getSession();
		session.setAttribute("flightId", flightId);
		session.setAttribute("price", price);
		session.setAttribute("time",time);
		
		RequestDispatcher rd = req.getRequestDispatcher("information.jsp");
		rd.forward(req, res);
	}
}
