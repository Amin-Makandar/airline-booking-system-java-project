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
  String cargofrom = (String) session.getAttribute("cargofrom");
	String cargoto = (String) session.getAttribute("cargoto");
	String cargodate = (String) session.getAttribute("cargodate");
	String cargoweight = (String) session.getAttribute("cargoweight");
	String cargotype = (String) session.getAttribute("cargotype");
	String flighttype = (String) session.getAttribute("flighttype");
	String flightId = (String) session.getAttribute("flightId");
	
	String time = (String) session.getAttribute("time");
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
                <div class="col-10 text-center py-5">
                    <h3 class="fw-bold fontcolor2">Download Your Ticket</h3>
                    <p class="lead fontcolor2">Thank You for Choosing Qatar Airways!</p>
                </div>
            </div>      
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="card ticket-background px-3">
                        <div class="card-header bg-transparent d-flex flex-row justify-content-between">
                            <h6 class="fw-bold fontcolor2 py-2">BOARDING PASS</h6>
                            <h6 class="fw-bold fontcolor2 py-2"><%= flighttype %></h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-md-4 py-2">
                                    <p>DEPARTURE</p>
                                    <h4 class="fontcolor2"><%= cargofrom %></h4>
                                </div>
                                <div class="col-12 col-md-4 d-flex flex-column justify-content-center align-items-center py-2">
                                    <i class="fas fa-plane fontcolor2 fs-2"></i>
                                </div>
                                <div class="col-12 col-md-4 text-end py-2">
                                    <p>ARRIVAL</p>
                                    <h4 class="fontcolor2"><%= cargoto %></h4>
                                </div>
                            </div> 
                            <div class="row text-center">
								<div class="col-12 col-md-3 py-2 text-start">
                                    <p>Airway-Name</p>
                                    <h6 class="fontcolor2">Qatar-Airways</h6>
                                </div>
                                
                                <div class="col-12 col-md-3 py-2">
                                    <p>Flight-Time</p>
                                    <h6 class="fontcolor2"><%= time%></h6>
                                </div>
                                
                                <div class="col-12 col-md-3 py-2">
                                    <p>CarGo-Type</p>
                                    <h6 class="fontcolor2"><%= cargotype %></h6>
                                    
                                </div>
                                
                                <div class="col-12 col-md-3 py-2 text-end">
                                    <p>Product Weight</p>
                                    <h6 class="fontcolor2"><%= cargoweight %></h6>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="card-footer bg-transparent">
                            <div class="row">
                                <div class="col-12 col-md-4">
                                    <h6>NAME OF PASSENGER</h6>
                                    <p class="fontcolor2"><%= firstname%> &nbsp; <%= lastname %></p>
                                </div>

                                <div class="col-6 col-md-2">
                                    <h6>FLIGHT-ID</h6>
                                    <p class="fontcolor2"><%= flightId%></p>
                                </div>

                                <div class="col-6 col-md-2">
                                    <h6>TERMINAL</h6>
                                    <p class="fontcolor2">F5</p>
                                </div>

                                <div class="col-12 col-md-2">
                                    <h6>GATE-No</h6>
                                    <p class="fontcolor2">South 3</p>
                                </div>
                                
                                <div class="col-12 col-md-2">
                                    <h6>DATE</h6>
                                    <p class="fontcolor2"><%= cargodate%></p>
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
                                <div class="col-12 d-flex flex-row justify-content-center">
                                    <p>DEPARTURE:-</p>
                                    <p class="fontcolor2 fw-bold"><%= cargofrom%></p>
                                </div>
                                
                                <div class="col-12 d-flex flex-row justify-content-center">
                                    <p>ARRIVAL:-</p>
                                    <p class="fontcolor2 fw-bold"><%= cargoto%></p>
                                </div>
                            </div> 
                            
                            <div class="row">
                                <div class="col-12 col-md-4 ">
                                     <h6>DATE</h6>
                                    <p class="fontcolor2"><%= cargodate%></p>
                                </div>
                                
                                <div class="col-12 col-md-4">
                                    <h6>Flight-Time</h6>
                                    <p class="fontcolor2"><%= time %></p>
                                </div>
                                
                                <div class="col-12 col-md-4">
                                    <h6>TERMINAL</h6>
                                    <p class="fontcolor2">F5</p>
                                </div>
                                
                                <div class="col-12 d-flex flex-row align-items-center justify-content-center">
                                    <p>Airway Name :-</p>
                                    <p class="fontcolor2">Qatar-Airways</p>
                                </div>
                             
                                
                            </div> 
                            
                        </div>
                        <div class="card-footer text-muted">
                            <div class="row">
                                <div class="col-6">
                                    <h6>FLIGHT-ID</h6>
                                    <p class="fontcolor2"><%= flightId%></p>
                                </div>
                                
                                <div class="col-6">
                                    <h6>FLIGHT-CLASS</h6>
                                    <p class="fontcolor2"><%= flighttype%></p>
                                </div>
                            </div>                       
                        </div>
                     </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-12 d-flex flex-row justify-content-center py-3">
            		  <button onclick="printTicket()" class="btn print fw-bold px-4">Print Ticket</button>
            	</div>
            	           
            </div>
        </div><!-- end of container -->
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