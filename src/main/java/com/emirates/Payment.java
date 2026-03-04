package com.emirates;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment")
public class Payment extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		
		
		
		String totalprice = (String) req.getParameter("totalprice");
		String taxprice = (String) req.getParameter("taxprice");
		
		System.out.println(taxprice);
		System.out.println(totalprice);
		
		
		HttpSession session = req.getSession();
		session.setAttribute("totalprice", totalprice);
		session.setAttribute("taxprice", taxprice);
		String pass = (String) session.getAttribute("pass");
		
		RequestDispatcher rd = req.getRequestDispatcher("payment.jsp");
		rd.forward(req, res);

	}
}
