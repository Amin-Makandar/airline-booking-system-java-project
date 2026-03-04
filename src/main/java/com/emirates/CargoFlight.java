package com.emirates;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cargoflight")
public class CargoFlight extends HttpServlet {
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException {
		String cargofrom = req.getParameter("cargofrom");
		String cargoto = req.getParameter("cargoto");
		String cargodate = req.getParameter("cargodate");
		String cargoweight = req.getParameter("cargoweight");
		String cargotype = req.getParameter("cargotype");
		String flighttype = "CarGo-Flight";
		
		HttpSession session = req.getSession();
		session.setAttribute("cargofrom", cargofrom);
		session.setAttribute("cargoto", cargoto);
		session.setAttribute("cargodate", cargodate);
		session.setAttribute("cargoweight", cargoweight);
		session.setAttribute("cargotype", cargotype);
		session.setAttribute("flighttype", flighttype);
		RequestDispatcher rd = req.getRequestDispatcher("cargoflights.jsp");
		rd.forward(req, res);
	}
}
