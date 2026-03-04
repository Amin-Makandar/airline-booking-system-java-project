package com.emirates;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cargoinformation")
public class InformationCargo extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		String shippername = req.getParameter("shippername");
		String recipientname = req.getParameter("recipientname");
		String pickupaddress = req.getParameter("pickupaddress");
		String pickupcontact = req.getParameter("pickupcontact");
		String deliveryaddress = req.getParameter("deliveryaddress");
		String deliverycontact = req.getParameter("deliverycontact");
		String productdescription = req.getParameter("productdescription");
		String taxprice = req.getParameter("taxprice");
		String totalprice = req.getParameter("totalprice");
		
		HttpSession session = req.getSession();
		session.setAttribute("shippername", shippername);
		session.setAttribute("recipientname", recipientname);
		session.setAttribute("pickupaddress", pickupaddress);
		session.setAttribute("pickupcontact", pickupcontact);
		session.setAttribute("deliveryaddress", deliveryaddress);
		session.setAttribute("deliverycontact", deliverycontact);
		session.setAttribute("productdescription", productdescription);
		session.setAttribute("taxprice", taxprice);
		session.setAttribute("totalprice", totalprice);
		

		RequestDispatcher rd = req.getRequestDispatcher("payment.jsp");
		rd.forward(req, res);
	}
}
