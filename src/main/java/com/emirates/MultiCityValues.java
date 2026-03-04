package com.emirates;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/multicityvalues")
public class MultiCityValues extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String flightId1 = req.getParameter("flightId1");
        String flight1_price = req.getParameter("flight1_price");
        String flight1_time = req.getParameter("flight1_time");
        
        String flightId2 = req.getParameter("flightId2");
        String flight2_price = req.getParameter("flight2_price");
        String flight2_time = req.getParameter("flight2_time");
        
        
        
        HttpSession session = req.getSession();
        
        String numberofpassenger = (String) session.getAttribute("multicity2passenger");
        session.setAttribute("flightId1", flightId1);
        session.setAttribute("flight1_price", flight1_price);
        session.setAttribute("flight1_time", flight1_time);
        session.setAttribute("flightId2", flightId2);
        session.setAttribute("flight2_price", flight2_price);
        session.setAttribute("flight2_time", flight2_time);
        session.setAttribute("numberofpassenger", numberofpassenger);
        
        

        
     // Redirect to seatsbooking.jsp
        RequestDispatcher rd = req.getRequestDispatcher("/seatsbooking.jsp");
        rd.forward(req, res);
        
    }
}
