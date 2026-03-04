<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List" %>   
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>One Way Information</title>
	<link rel="icon" type="image/x-icon" href="./Images/Logo-icon/qatar-favicon.png">
	<link rel="stylesheet" href="./css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </head>
  <body>
  	<%
    session = request.getSession();
    String firstname = (String) session.getAttribute("firstname");
    String lastname = (String) session.getAttribute("lastname");
    String onefrom = (String) session.getAttribute("onefrom");
	String oneto = (String) session.getAttribute("oneto");
	String onedate = (String) session.getAttribute("onedate");
	String onewaypassenger = (String) session.getAttribute("onewaypassenger");
	String flightclass = (String) session.getAttribute("flightclass");
	String flighttype = (String) session.getAttribute("flighttype");
	String flightId = (String) session.getAttribute("flightId");
	String price = (String) session.getAttribute("price");
	String time = (String) session.getAttribute("time");
	
	double passenger = Double.parseDouble(onewaypassenger);
	double ammount = Double.parseDouble(price);
	double ammount2 = ammount * passenger;
	double taxpricedecimal = ammount2 * 0.05;
	int tax_price = (int) taxpricedecimal;
	double total_price = ammount2 + tax_price;
	
	String taxprice = String.valueOf(tax_price);
	String totalprice = String.valueOf(total_price);
	
	 List<String> selectedSeatsList = (List<String>) session.getAttribute("selectedSeats");
    
	%>
	
	
	
	
   
 <div class="container-fluid p-0">
            <section id="Flight-information">
                <div class="container-fluid">
                    <div class="row fixed-top px-3 px-lg-0" id="header1">
                        <div class="col-12 p-0 font5">
                            <nav class="navbar navbar-expand-lg bg-transparent">
                                <div class="container-fluid px-lg-5">
                                <a class="navbar-brand text-white fw-bold fs-4" href="#">QATAR AIRWAYS</a>
                                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                    <ul class="navbar-nav ms-auto mb-2 fw-bold mb-lg-0">
                                    <li class="nav-item">
                                        <a class="nav-link active text-white px-lg-3" aria-current="page" href="#">Home</a>
                                    </li>
                                    
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle text-white px-lg-3" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Explore
                                        </a>
                                        <ul class="dropdown-menu bg-transparent border-0">
                                        <li><a class="dropdown-item text-white" href="#india">Explore India</a></li>
                                        <li><a class="dropdown-item text-white" href="#world">Explore the World</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white px-lg-3" href="./CarGo.html">Cargo</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white px-lg-3" href="#">BooK</a>
                                    </li>
                                    </ul>
                                </div>
                                </div>
                            </nav>
                        </div><!--end of col-12-->
                    </div><!--end of row-1-->
					<div class="py-3">
					</div>
                    <div class="container text-white card mt-5 font7">
                       <form action="payment" method="post"> 
                            <div class="row text-center py-2  py-md-4">
                                <div class="col-12">
                                    <h6 class="fw-bold font1">INFORMATION REVIEW</h6>
                                </div>
                            </div>

                            <div class="row text-center">
                                <div class="col-12">
                                    <h5>Name:-<strong class="font5"><%= firstname %> &nbsp; <%= lastname %></strong></h5>
                                </div>
                            </div>
								
                            <div class="row align-items-center py-md-3">
                                <div class="col-12 text-center py-2">
                                    <p class="fw-bold">A.Flight Details</p>
                                </div>

                                <div class="col-12 col-md-6 my-2 text-center">
                                    <h6>1.Departure:- <strong ><%= onefrom.toUpperCase() %></strong></h6>
                                </div>
                                
								<div class="col-12 col-md-6 my-2 text-center">
                                    <h6>2.Arrival:- <strong><%= oneto.toUpperCase() %></strong></h6>
                                </div>
                                
                                <div class="col-12 col-md-4 my-2 my-md-3 text-center">
                                    <h6>3.Flight-Date:- <strong><%= onedate %></strong></h6>
                                </div>
                                
                                <div class="col-12 col-md-4 my-2 my-md-3 text-center">
                                    <h6>4.Flight-Class:- <strong><%= flightclass %></strong></h6>
                                </div>
                                
                                <div class="col-12 col-md-4 my-2 my-md-3 text-center">                          
                                    <h6>5.Flight-ID:- <strong><%= flightId %></strong></h6>
                                </div>
                                
                                <div class="col-12 col-md-4 my-2 my-md-3 text-center">
                                    <h6>6.Flight-Type:- <strong><%= flighttype %></strong></h6>
                                </div>
                                
                                <div class="col-12 col-md-4 my-2 my-md-3 text-center">
                                    <h6>7.Number of Passenger:- <strong><%= onewaypassenger %></strong></h6>
                                </div>
                                
                                <div class="col-12 col-md-4 my-2 my-md-3 text-center">
                                    <h6>8.Selected Seat:- <strong>  <% 
           
            if(selectedSeatsList != null && !selectedSeatsList.isEmpty()) {
                StringBuilder seatsString = new StringBuilder();
                for(int i = 0; i < selectedSeatsList.size(); i++) {
                    if(i > 0) {
                        seatsString.append(", ");
                    }
                    seatsString.append(selectedSeatsList.get(i));
                }
        %>
        <%= seatsString.toString() %>
        <% } else { %>
        No seats selected.
        <% } %> </strong></h6>
                                </div>
                                
                                
                                                         
                            </div>
                            
                                                                                 
                            <div class="row align-items-center">
                                <div class="col-12 text-center py-2">
                                    <p class="fw-bold">B.Payment Details</p>
                                </div>

                                <div class="col-12 col-md-4 text-center my-2">
                                    <h6>1.Flight-Price:-<strong> <%= price %>/-</strong></h6>
                                </div>

                                <div class="col-12 col-md-4 d-lg-flex flex-column justify-content-evenly align-items-center text-center my-2">
                                    <h6>2.Taxes: Extra 5% (<%= taxprice %>)</h6>
                                    <p>(Flight Price * no passenger(<%= onewaypassenger%>) * 5%)
                                </div>

                                <div class="col-12 col-md-4 d-lg-flex flex-column justify-content-evenly  text-center my-2">
                                    <h6>3.Total Price : <%= totalprice %></h6>
                                    <p>(Flight Price with Tax * no passenger(<%= onewaypassenger%>))</p>
                                </div>
                            </div>

                            <div class="row py-3">
                                <div class="col-12 text-center d-flex flex-row justify-content-evenly">
                                	<input type="hidden" name="totalprice" value=" <%= totalprice %> ">
									<input type="hidden" name="taxprice" value=" <%= taxprice %> ">
                                    
                                    <a href="one-way.jsp" class="btn btn-primary butt_on abutton px-3 py-1 ">Make Changes</a>
                                    <input type="submit" class="btn btn-primary butt_on px-3 py-1" value="Confirm Booking">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 text-center py-2">
                                    <p class="fw-bold">Note: Flights are subject to availability and schedule may changes.</p>
                                    <p> Total Price = Flight-Price &nbsp; + &nbsp;  5% Tax(On Flight Price)</p>
                                </div>
                            </div>

                       </form>     
                        
                    </div><!-- end  of container -->
                    <div class="row">
                        <div class="col-12 py-3">

                        </div>
                    </div>
                </div><!--end of container-fluid-->

            </section><!--end of cargo-information-->
            
                <footer class="footer">
    <div class="container-fluid">
        <div class="row py-3">
            <div class="col-md-3 text-white">
                <h5 class="fw-bold fontcolor2 text-center">Contact Us</h5>
                <p> <span class="fw-bold fontcolor"> Qatar Airways </span> Tower 1, next to Al Manna Building, Airport Road, Doha, Qatar</p>
                <p>Phone: +91 9921860661</p>
                <p>Email: aminmakandar36@gmail.com</p>
            </div>
            <div class="col-md-3 text-center">
                <h5 class="fw-bold fontcolor2 pb-3">Useful Links</h5>
               		<a href="#bookflights" class="text-decoration-none text-white d-block">BOOK A FLIGHT</a>
                   	<a href="./world.jsp" class="text-decoration-none text-white d-block">EXPLORE WORLD</a>
                    <a href="./india.jsp" class="text-decoration-none text-white d-block">EXPLORE INDIA</a>
                    <a href="./home.jsp" class="text-decoration-none text-white d-block">FLIGHT-STATUS</a> 
            </div>
            
            <div class="col-md-3 text-center">
                <h5 class="fw-bold fontcolor2 pb-3">Types of Flight</h5>
                 	<a href="./one-way.jsp" class="text-decoration-none text-white d-block">ONE-WAY-FLIGHT</a>
                   	<a href="./return.jsp" class="text-decoration-none text-white d-block">RETURN-FLIGHT</a>
                    <a href="./multi-city.jsp" class="text-decoration-none text-white d-block">MULTI-CITY-FLIGHT</a>
                    <a href="./cargo.jsp" class="text-decoration-none text-white d-block">CARGO-FLIGHT</a>
            </div>
            <div class="col-md-3 text-center">
                <h5 class="fontcolor2 fw-bold pb-3">Follow Us</h5>
                <ul class="social-icons ">
                	<div class="d-flex flex-row justify-content-evenly my-3">
                    <a href="#" class="text-decoration-none"><i class="fab fa-facebook-square fs-2 text-white"></i></a>
                    <a href="#" class="text-decoration-none"><i class="fab fa-twitter fs-2 text-white"></i></a>
                    </div>
                    <div class="d-flex flex-row justify-content-evenly">
                    <a href="#" class="text-decoration-none"><i class="fab fa-instagram fs-2 text-white"></i></a>
                    <a href="#" class="text-decoration-none"><i class="fab fa-linkedin-in fs-2 text-white"></i></a>
                    </div>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-12 text-center py-2 text-secondary d-lg-flex flex-row justify-content-evenly">
              <h6 class="font2"> &copy; Copyrights 2024.All Rights Reserverd</h6>
              <h5 class="text-white font5">Developed By Amin Makandar</h5>
            </div>
          </div>
    </div>
</footer>

        </div><!--end of main container-fluid-->
	
	


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    
    <script>
        window.addEventListener('scroll',function(){
            if(pageYOffset>=10)
            {
              document.getElementById("header1").style.backgroundColor = "black";
              document.getElementById("header1").style.boxShadow = " 0px 0px 10px black";
              document.getElementById("header1").style.zIndex= "100";
            }
            else
            {
              document.getElementById("header1").style.backgroundColor = "transparent";
              document.getElementById("header1").style.boxShadow = "none";
            }
          });
        </script>
    </body>
</html>
    