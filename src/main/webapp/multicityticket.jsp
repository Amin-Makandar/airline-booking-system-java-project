<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List" %>  
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>One Way Ticket</title>
    <link rel="icon" type="image/x-icon" href="./Images/Logo-icon/qatar-favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body>
  
  <%
  session = request.getSession();
  String firstname = (String) session.getAttribute("firstname");
  String lastname = (String) session.getAttribute("lastname");
  String city1 = (String) session.getAttribute("city1");
	String city2 = (String) session.getAttribute("city2");
	String mdate = (String) session.getAttribute("mdate");
	String flightclass = (String) session.getAttribute("flightclass");
	String city3 = (String) session.getAttribute("city3");
	String city4 = (String) session.getAttribute("city4");
	String m2date = (String) session.getAttribute("m2date");

	String flightclass2 = (String) session.getAttribute("flightclass2");
	String flighttype = (String) session.getAttribute("flighttype");
	String flightId1 = (String) session.getAttribute("flightId1");
	
	String flight1_time = (String) session.getAttribute("flight1_time");
	String flightId2 = (String) session.getAttribute("flightId2");
	
	String flight2_time = (String) session.getAttribute("flight2_time");
	List<String> selectedSeatsList = (List<String>) session.getAttribute("selectedSeats");
  %>
    <div class="contianer-fluid p-0 overflow-hidden">
    <!-- Modal for error message -->
    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-dark" id="errorModalLabel">PAYMENT Failed!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="errorMessage" class="text-success">${paymentmsg}</div>
                   
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
      <section id="ticket-oneway">
        <div class="contianer-fluid">
            <div class="row justify-content-center">
                <div class="col-10 text-center p-0 py-5">
                    <h3 class="fw-bold fontcolor2 font1">Download Your Ticket</h3>
                    <p class="lead fontcolor2 font7">Thank You for Choosing Qatar Airways!</p>
                </div>
            </div>      
        </div>
        <div class="container">
            <div class="row font5">
                <div class="col-12 col-lg-8">
                    <div class="card ticket-background px-3">
                        <div class="card-header bg-transparent d-flex flex-row justify-content-between">
                            <h6 class="fw-bold fontcolor2 py-2">BOARDING PASS</h6>
                            <h6 class="fw-bold fontcolor2 py-2"><%= flighttype %></h6>
                        </div>
                        <div class="card-body">
                        
                        	<div class="row">
                            	<div class="col-12 text-center">
                            		<h6 class="fontcolor2">FLIGHT-1</h6>
                            	</div>
								<div class="col-12 col-md-4 py-2">
                                    <p>DEPARTURE</p>
                                    <h4 class="fontcolor2 "><%= city1 %></h4>
                                </div>
                                <div class="col-12 col-md-4 d-flex flex-column justify-content-center align-items-center py-2">
                                    <i class="fas fa-plane fontcolor2 fs-2"></i>
                                </div>
                                <div class="col-12 col-md-4 text-end py-2">
                                    <p>ARRIVAL</p>
                                    <h4 class="fontcolor2"><%= city2 %></h4>
                                </div>
                                
                                <div class="col-12 col-md-3 py-2">
                                    <p>Flight-Time</p>
                                    <h6 class="fontcolor2"><%= flight1_time%></h6>
                                </div>
                                
                                <div class="col-12 col-md-3 py-2">
                                    <p>Flight-Date</p>
                                    <h6 class="fontcolor2"><%= mdate %></h6>
                                </div>
                                
                                <div class="col-12 col-md-3 py-2">
                                    <p>Flight-ID</p>
                                    <h6 class="fontcolor2"><%= flightId1 %></h6>
                                </div>
                                
                                <div class="col-12 col-md-3 py-2">
                                    <p>Flight-Class</p>
                                    <h6 class="fontcolor2"><%= flightclass %></h6>
                                </div>
                            </div>
                            
                            <div class="row">
                            	<div class="col-12 text-center">
                            		<h6 class="fontcolor2">FLIGHT-2</h6>
                            	</div>
                                <div class="col-12 col-md-4 py-2">
                                    <p>DEPARTURE</p>
                                    <h4 class="fontcolor2"><%= city3 %></h4>
                                </div>
                                <div class="col-12 col-md-4 d-flex flex-column justify-content-center align-items-center py-2">
                                    <i class="fas fa-plane fontcolor2 fs-2"></i>
                                </div>
                                <div class="col-12 col-md-4 text-end py-2">
                                    <p>ARRIVAL</p>
                                    <h4 class="fontcolor2"><%= city4 %></h4>
                                </div>
                                
                                <div class="col-12 col-md-3 py-2">
                                    <p>Flight-Time</p>
                                    <h6 class="fontcolor2"><%= flight2_time%></h6>
                                </div>
                                
                                <div class="col-12 col-md-3 py-2">
                                    <p>Flight-Date</p>
                                    <h6 class="fontcolor2"><%= m2date %></h6>
                                </div>
                                
                                <div class="col-12 col-md-3 py-2">
                                    <p>Flight-ID</p>
                                    <h6 class="fontcolor2"><%= flightId2 %></h6>
                                </div>
                                
                                <div class="col-12 col-md-3 py-2">
                                    <p>Flight-Class</p>
                                    <h6 class="fontcolor2"><%= flightclass2 %> </h6>
                                </div>
                         
                            </div> 
                            
                        </div>
                        <div class="card-footer bg-transparent">
                            <div class="row">
                                <div class="col-12 col-md-4 text-center">
                                    <h6>NAME OF PASSENGER</h6>
                                    <p class="fontcolor2"><%= firstname%> &nbsp; <%= lastname %></p>
                                </div>

                                <div class="col-6 col-md-2 text-center">
                                    <h6>Seats</h6>
                                    <p class="fontcolor2"><% 
           
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
        <% } %> </p>
                                </div>

                                <div class="col-12 col-md-2 text-center">
                                    <h6>GATE-No</h6>
                                    <p class="fontcolor2">WEST 4</p>
                                </div>
                                
                                <div class="col-12 col-md-4 text-center">
                                    <h6>Airway-Name</h6>
                                    <h6 class="fontcolor2">Qatar Airways</h6>
                                </div>
                                
                                
                            </div>

                        </div>
                      </div>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="card text-center">
                        <div class="card-header bg-transparent">
                          <p class="fw-bold fontcolor2">BOARDING PASS</p>
                        </div>
                        <div class="card-body">
                            <div class="row">
                            	<div class="col-12">
                            		<h6 class="etxt-center fontcolor2">FLIGHT-1</h6>
                            	</div>
                                <div class="col-12 d-flex flex-row justify-content-center">
                                    <p>DEPARTURE:-</p>
                                    <p class="fontcolor2 fw-bold"><%= city1%></p>
                                </div>
                                
                                <div class="col-12 d-flex flex-row justify-content-center">
                                    <p>ARRIVAL:-</p>
                                    <p class="fontcolor2 fw-bold"><%= city2%></p>
                                </div>
                            </div> 
                            
                            <div class="row">
                                <div class="col-12 col-md-6 ">
                                     <h6>DATE</h6>
                                    <p class="fontcolor2"><%= mdate%></p>
                                </div>
                                
                                <div class="col-12 col-md-6">
                                    <h6>Flight-ID</h6>
                                    <p class="fontcolor2"><%= flightId1 %></p>
                                </div>
                                
                                <div class="col-12 col-md-6">
                                    <h6>Flight-Class</h6>
                                    <p class="fontcolor2"><%= flightclass %></p>
                                </div>
                                
                                <div class="col-12 col-md-6">
                                    <h6>Flight-Time</h6>
                                    <p class="fontcolor2"><%= flight1_time %></p>
                                </div>
                             
                                
                            </div> 
                            
                            <div class="row">
                            	<div class="col-12">
                            		<h6 class="etxt-center fontcolor2">FLIGHT-2</h6>
                            	</div>
                                <div class="col-12 d-flex flex-row justify-content-center">
                                    <p>DEPARTURE:-</p>
                                    <p class="fontcolor2 fw-bold"><%= city3%></p>
                                </div>
                                
                                <div class="col-12 d-flex flex-row justify-content-center">
                                    <p>ARRIVAL:-</p>
                                    <p class="fontcolor2 fw-bold"><%= city4%></p>
                                </div>
                            </div> 
                            
                            <div class="row">
                                <div class="col-12 col-md-6 ">
                                     <h6>DATE</h6>
                                    <p class="fontcolor2"><%= m2date%></p>
                                </div>
                                
                                <div class="col-12 col-md-6">
                                    <h6>Flight-ID</h6>
                                    <p class="fontcolor2"><%= flightId2 %></p>
                                </div>
                                
                                <div class="col-12 col-md-6">
                                    <h6>Flight-Class</h6>
                                    <p class="fontcolor2"><%= flightclass2 %></p>
                                </div> 
                                
                                <div class="col-12 col-md-6">
                                    <h6>Flight-Time</h6>
                                    <p class="fontcolor2"><%= flight2_time %></p>
                                </div>  
                                
                                <div class="col-12 d-flex flex-row py-2 justify-content-evenly">
                                    <p>Airway-Name</p>
                                    <p class="fontcolor2">Qatar-Airways</p>
                                </div>
                                
                                
                            </div> 
                            
                            
                        </div>
                        
                     </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-12 col-md-4 d-flex flex-row justify-content-center py-3">
            		  <button onclick="printTicket()" class="btn print fw-bold px-4">Print Ticket</button>
            	</div>
            	
            	<div class="col-12 col-md-4 d-flex flex-row justify-content-center py-3">
            		  <a href="home.jsp" class="btn print fw-bold px-4">Countinue-Booking</a>
            	</div>
            	
            	<div class="col-12 col-md-4 d-flex flex-row justify-content-center py-3">
            		 <form action="logout" method="post">
            		  <input type="submit" class="btn print fw-bold px-4" value="LOG-OUT">
            		 </form>
            	</div>
            	           
            </div>
        </div>
      </section>
    </div><!--end of main container-fluid-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script>
        function printTicket() {
            window.print();
        }
        
    </script>
    
    <% String paymentmsg = (String) request.getAttribute("paymentmsg");
       if (paymentmsg != null) { %>
           <script>
               var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
               errorModal.show();
           </script>
    <% } %>
    
  </body>
</html>