package com.emirates;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;
import java.sql.Date;
import java.sql.Time;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/finalpayment")
public class Finalpayment extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		
		Date currentDate = new Date(System.currentTimeMillis());
		Time currentTime = new Time(System.currentTimeMillis());
		
		String password1 = (String) req.getParameter("password");
		HttpSession session = req.getSession();
		String pass = (String) session.getAttribute("pass");
		List<String> selectedSeatsList = (List<String>) session.getAttribute("selectedSeats");
//		String Seats = String.join(",", selectedSeatsList);
//		
		if (selectedSeatsList != null) {
		    String Seats = String.join(",", selectedSeatsList);
		    System.out.println(Seats);
		    session.setAttribute("Seats", Seats);
		} else {
		    // Handle the case where selectedSeatsList is null
		}
		
		
		
		
		
		if(password1 !=null && pass !=null && pass.equals(password1)) {
			System.out.println("password entered is correct");
			
			//common values
			String seats = (String) session.getAttribute("Seats");
			String flighttype = (String) session.getAttribute("flighttype");
			String firstname = (String) session.getAttribute("firstname");
			String lastname = (String) session.getAttribute("lastname");
			String numberofpassenger = (String) session.getAttribute("numberofpassenger");
			String taxprice = (String) session.getAttribute("taxprice");
			String totalprice = (String) session.getAttribute("totalprice");
			String flightId = (String) session.getAttribute("flightId");
			String price = (String) session.getAttribute("price");
			String time = (String) session.getAttribute("time");
			
			//cargo-flight
			String cargofrom = (String) session.getAttribute("cargofrom");
			String cargoto = (String) session.getAttribute("cargoto");
 			String cargodate = (String) session.getAttribute("cargodate");
			String cargoweight = (String) session.getAttribute("cargoweight");
			String cargotype = (String) session.getAttribute("cargotype");
			String productdescription =  (String) session.getAttribute("productdescription");
			
			//shipper information
			String shippername = (String) session.getAttribute("shippername");
			String pickupaddress = (String) session.getAttribute("pickupaddress");
			String pickupcontact =  (String) session.getAttribute("pickupcontact");
			
			
			//recipent information
			String recipientname = (String) session.getAttribute ("recipientname");
			String deliveryaddress =  (String) session.getAttribute("deliveryaddress");
			String deliverycontact =  (String) session.getAttribute("deliverycontact");
			
			//one-way-flight
			
			String onefrom = (String) session.getAttribute("onefrom");
			String oneto = (String) session.getAttribute("oneto");
			String onedate = (String) session.getAttribute("onedate");
			String flightclass = (String) session.getAttribute("flightclass");
			
			
			//Return Type Flight
			String Rfrom = (String) session.getAttribute("Rfrom");
			String Rto = (String) session.getAttribute("Rto");
			String Departuredate = (String) session.getAttribute("Departuredate");
			String Returndate = (String) session.getAttribute("Returndate");
			String Returnpassenger = (String) session.getAttribute("Returnpassenger");
			String time1 = (String) session.getAttribute("time1");
			String time2 = (String) session.getAttribute("time2");
			
			//Multi-City Flight
			String city1 = (String) session.getAttribute("city1");
			String city2 = (String) session.getAttribute("city2");
			String mdate = (String) session.getAttribute("mdate");
			String multicitypassenger = (String) session.getAttribute("multicitypassenger");
			
			String city3 = (String) session.getAttribute("city3");
			String city4 = (String) session.getAttribute("city4");
			String m2date = (String) session.getAttribute("m2date");
			String multicity2passenger = (String) session.getAttribute("multicity2passenger");
			String flightclass2 = (String) session.getAttribute("flightclass2");
			
			String flightId1 = (String) session.getAttribute("flightId1");
			String flight1_price = (String) session.getAttribute("flight1_price");
			String flight1_time = (String) session.getAttribute("flight1_time");
			
			String flightId2 = (String) session.getAttribute("flightId2");
			String flight2_price = (String) session.getAttribute("flight2_price");
			String flight2_time = (String) session.getAttribute("flight2_time");
			
			try {
				//load the register
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("Driver Runing Properly");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//establishing the connection
			String url = "jdbc:mysql://localhost:3306/airline_database";
			String username="root";
			String password="root";
			
			try {
			Connection con=DriverManager.getConnection(url, username ,password);
				
				if(flighttype != null && flighttype.equals("CarGo-Flight")) {
					String query1 = "INSERT INTO Cargo_Flight (First_Name, Last_Name, Flight_Departure, Flight_Arrival, Flight_Date, Flight_Time, Cargo_Weight_KG, Cargo_Type, Cargo_Description, Flight_ID, Flight_Type, Flight_Price, Tax_price, Total_price, Booking_Date, Booking_Time ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURDATE(),CURTIME())";
					PreparedStatement ps = con.prepareStatement(query1);
					ps.setString(1, firstname);
					ps.setString(2, lastname);
					ps.setString(3, cargofrom);
					ps.setString(4, cargoto);
					ps.setString(5, cargodate);
					ps.setString(6, time);
					ps.setString(7, cargoweight);
					ps.setString(8, cargotype);
					ps.setString(9, productdescription);
					ps.setString(10, flightId);
					ps.setString(11, flighttype);
					ps.setString(12, price);
					ps.setString(13, taxprice);
					ps.setString(14, totalprice);
					ps.executeUpdate();
					ps.close();
					
					
					String query2= "INSERT INTO Shipper_Information (Shipper_Name, Shipper_Address, Shipper_Contact) VALUES (?,?,?)";
					PreparedStatement ps2 = con.prepareStatement(query2);
					ps2.setString(1, shippername);
					ps2.setString(2, pickupaddress);
					ps2.setString(3, pickupcontact);
					ps2.executeUpdate();
					ps2.close();
					
					
					String query3= "INSERT INTO Ricipient_Information (Ricipient_Name, Ricipient_Address, Ricipient_Contact) VALUES (?,?,?)";
					PreparedStatement ps3 = con.prepareStatement(query3);
					ps3.setString(1, recipientname);
					ps3.setString(2, deliveryaddress);
					ps3.setString(3, deliverycontact);
					ps3.executeUpdate();
					ps3.close();
					con.close();
					
					req.setAttribute("paymentmsg", "Payment Done Successfully");
					RequestDispatcher rd = req.getRequestDispatcher("cargoticket.jsp");
					rd.forward(req, res);
					
				}
				else if(flighttype != null && flighttype.equals("One-Way-Flight")) { 
					String query = "INSERT INTO Oneway_Flight (First_Name, Last_Name, Flight_Departure, Flight_Arrival, Flight_Date, Flight_Time, Number_of_Passenger, Seat_Name, Flight_Class, Flight_Type, Flight_ID, Flight_Price, Tax_price, Total_price, Booking_Date, Booking_Time) VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURDATE(),CURTIME())";
					PreparedStatement ps = con.prepareStatement(query);
					ps.setString(1, firstname );
					ps.setString(2, lastname);
					ps.setString(3, onefrom);
					ps.setString(4, oneto);
					ps.setString(5, onedate);
					ps.setString(6, time);
					ps.setString(7, numberofpassenger);
					ps.setString(8, seats);
					ps.setString(9, flightclass);
					ps.setString(10, flighttype);
					ps.setString(11, flightId);
					ps.setString(12, price);
					ps.setString(13, taxprice);
					ps.setString(14, totalprice);
					 
					ps.executeUpdate();
					ps.close();
					con.close();
					req.setAttribute("paymentmsg", "Payment Done Successfully");
					RequestDispatcher rd = req.getRequestDispatcher("onewayticket.jsp");
					rd.forward(req, res);
				}
				
				else if(flighttype != null && flighttype.equals("Return-Flight")) {
					String query = "INSERT INTO Return_Flight(First_Name, Last_Name, Flight_Departure, Flight_Arrival, Return_Flight_Departure, Return_Flight_Arrival, Flight_Date, Flight_Time, Return_Flight_Date, Return_Flight_Time, Number_of_Passenger, Seat_Name, Flight_Class, Flight_Type, Flight_ID, Flight_Price, Tax_price, Total_price, Booking_Date, Booking_Time ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURDATE(),CURTIME())";
					PreparedStatement pstmt=con.prepareStatement(query);
					pstmt.setString(1, firstname );
					pstmt.setString(2, lastname);
					pstmt.setString(3, Rfrom);
					pstmt.setString(4, Rto);
					pstmt.setString(5, Rto);
					pstmt.setString(6, Rfrom);
					pstmt.setString(7, Departuredate);
					pstmt.setString(8, time1);
					pstmt.setString(9, Returndate);
					pstmt.setString(10, time2);
					pstmt.setString(11, numberofpassenger);
					pstmt.setString(12, seats);
					pstmt.setString(13, flightclass);
					pstmt.setString(14, flighttype);
					pstmt.setString(15, flightId);
					pstmt.setString(16, price);
					pstmt.setString(17, taxprice);
					pstmt.setString(18, totalprice);
					pstmt.executeUpdate();
					pstmt.close();
					con.close();
					
					req.setAttribute("paymentmsg", "Payment Done Successfully");
					RequestDispatcher rd = req.getRequestDispatcher("returnflightticket.jsp");
					rd.forward(req, res);
				}
				else if(flighttype != null && flighttype.equals("Multi-City-Flight")) {
					String query = "INSERT INTO Multi_City_Flight(First_Name, Last_Name, City_1, City_2, Flight_1_Date, Flight_1_Class, Flight_1_Time, Flight_1_Passenger, Flight_1_ID, Flight_1_Price, City_3, City_4, Flight_2_Date, Flight_2_Class, Flight_2_Time, Flight_2_Passenger, Seat_Name, Flight_2_ID, Flight_2_Price, Flight_Type, Tax_price, Total_price, Booking_Date, Booking_Time) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,CURDATE(),CURTIME())";
					PreparedStatement pstmt=con.prepareStatement(query);
					pstmt.setString(1, firstname );
					pstmt.setString(2, lastname);
					pstmt.setString(3, city1);
					pstmt.setString(4, city2);
					pstmt.setString(5, mdate);
					pstmt.setString(6, flightclass);
					pstmt.setString(7, flight1_time);
					pstmt.setString(8, multicitypassenger);
					pstmt.setString(9, flightId1);
					pstmt.setString(10, flight1_price);
					pstmt.setString(11, city3);
					pstmt.setString(12, city4);
					pstmt.setString(13, m2date);
					pstmt.setString(14, flightclass2);
					pstmt.setString(15, flight2_time);
					pstmt.setString(16, multicity2passenger);
					pstmt.setString(17, seats);
					pstmt.setString(18, flightId2);
					pstmt.setString(19, flight2_price);
					pstmt.setString(20, flighttype);
					pstmt.setString(21, taxprice);
					pstmt.setString(22, totalprice);
					pstmt.executeUpdate();
					pstmt.close();
					con.close();
					req.setAttribute("paymentmsg", "Payment Done Successfully");
					RequestDispatcher rd = req.getRequestDispatcher("multicityticket.jsp");
					rd.forward(req, res);
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}	
			
			
		}
		else {
			System.out.println("password wrong");
			req.setAttribute("paymentmsg", "Incorrect password. Enter the Login Password And If still you cant pay Login Again");
	        RequestDispatcher rd = req.getRequestDispatcher("payment.jsp");
	        rd.forward(req, res);
			
			
		}
			
	}

}







