<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Information Review</title>
    <link rel="icon" type="image/x-icon" href="./Images/Logo-icon/qatar-favicon.png">
    <link rel="stylesheet" href="./css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
	String price = (String) session.getAttribute("price");
	String time = (String) session.getAttribute("time");
	
	
	double ammount = Double.parseDouble(price);
	
	double taxpricedecimal = ammount * 0.05;
	int taxprice = (int) taxpricedecimal;
	double totalprice = ammount + taxprice;
	
	
    %>
    <div class="container-fluid p-0">
            <section id="cargo-information">
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
                        <form action="cargoinformation" method="post">
                            <div class="row text-center py-2  py-md-4">
                                <div class="col-12">
                                    <h6 class="fw-bold font1">INFORMATION REVIEW</h6>
                                </div>
                            </div>

                            <div class="row text-center">
                                <div class="col-12">
                                    <h5>Name:-<strong class="font1"><%= firstname %> &nbsp; <%= lastname %></strong></h5>
                                </div>
                                
                                <div class="col-12 col-md-6 my-2 text-center">
                                    <h6>1.Pickup Airport:- <strong><%= cargofrom %></strong></h6>
                                </div>
                                
                                <div class="col-12 col-md-6 text-center  my-2">
                                    <h6>2.Delivery Airport:-<strong> <%= cargoto %></strong></h6>
                                </div>
                                
                                
                            </div>

                            <div class="row align-items-center py-md-3">
                                <div class="col-12 text-center py-2">
                                    <p class="fw-bold">1.Pickup Details</p>
                                </div>
									
								<div class="col-12 col-md-4 d-lg-flex flex-row justify-content-evenly align-items-center text-center my-2">
                                    <label for="pickupAddres">1.Shipper Name:-</label>
                                    <input type="text" id="pickupAddres" name="shippername" class="inputdesign text-center" required>
                                </div>
                                

                                <div class="col-12 col-md-4 d-lg-flex flex-row justify-content-evenly align-items-center text-center my-2">
                                    <label for="pickupAddres">2.Pickup Address:-</label>
                                    <input type="text" id="pickupAddres" name="pickupaddress" class="inputdesign text-center" required>
                                </div>

                                <div class="col-12 col-md-4 d-lg-flex flex-row justify-content-evenly align-items-center text-center my-2">
                                    <label for="pickupcontact">3.Contact Number:-</label>
                                    <input type="text" id="pickupcontact" name="pickupcontact" class="inputdesign text-center" required>
                                </div>
                            </div>

                            <div class="row align-items-center py-3">
                                <div class="col-12  text-center py-2">
                                    <p class="fw-bold">2.Delivery Details</p>
                                </div>
								
								<div class="col-12 col-md-4 d-lg-flex flex-row justify-content-evenly align-items-center text-center my-2">
                                    <label for="pickupAddres">1.Recipient Name:-</label>
                                    <input type="text" id="pickupAddres" name="recipientname" class="inputdesign text-center" required>
                                </div>
                                

                                <div class="col-12 col-md-4 d-lg-flex flex-row justify-content-evenly align-items-center text-center my-2">
                                    <label for="pickupAddres">2.Delivery Address:-</label>
                                    <input type="text" id="pickupAddres" name="deliveryaddress" class="inputdesign text-center" required>
                                </div>

                                <div class="col-12 col-md-4 d-lg-flex flex-row justify-content-evenly align-items-center text-center my-2">
                                    <label for="pickupcontact">3.Contact Number:-</label>
                                    <input type="text" id="pickupcontact" name="deliverycontact" class="inputdesign text-center" required>
                                </div>
                            </div>

                            <div class="row align-items-center py-3">
                                <div class="col-12  text-center py-2">
                                    <p class="fw-bold">3.CarGo Details</p>
                                </div>

                                <div class="col-12 col-md-4 col-lg-4  text-center  my-2">
                                    <h6>1.CarGo-Type:- <strong><%= cargotype %></strong></h6>
                                </div>

                                

                                <div class="col-12 col-md-4 col-lg-4 text-center  my-2">
                                    <h6>2.Weight:- <strong> <%= cargoweight %>KG</strong></h6>
                                </div>

                                <div class="col-12 col-md-4 col-lg-4 d-lg-flex flex-row justify-content-center align-items-center text-center my-2">
                                    <label for="pickupcontact">3.Product Description:-</label>
                                    <textarea name="productdescription" id="" cols="26" rows="1" placeholder="Decribe your product" class="inputdesign text-center" required></textarea>
                                </div>  
                            </div>
                            
                               
                             <div class="row align-items-center py-md-3">
                                <div class="col-12 text-center py-2">
                                    <p class="fw-bold">4.Flight Details</p>
                                </div>

                                <div class="col-12 col-md-3 my-2 text-center">
                                    <h6>1.Flight Type:- <strong><%= flighttype %></strong></h6>
                                </div>
                                
                                <div class="col-12 col-md-3 my-2 text-center">
                                    <h6>2.Flight Date:- <strong><%= cargodate %></strong></h6>
                                </div>
                                
                                <div class="col-12 col-md-3 my-2 text-center">
                                    <h6>3.Flight Time:- <strong><%= time %></strong></h6>
                                </div>
                                
                                <div class="col-12 col-md-3 my-2 text-center">
                                    <h6>4.Flight Id:- <strong><%= flightId %></strong></h6>
                                </div>

                                

                                
                            </div>
                                                     
                            <div class="row align-items-center py-3">
                                <div class="col-12 text-center py-2">
                                    <p class="fw-bold">5.Payment Details</p>
                                </div>

                                <div class="col-12 col-md-4 text-center my-2">
                                    <h6>1.Cargo-Price:-<strong><%= price %>/-</strong></h6>
                                </div>

                                <div class="col-12 col-md-4 d-lg-flex flex-row justify-content-evenly align-items-center text-center my-2">
                                    <h6>2.Taxes: Extra 5%(<%= taxprice %>)</h6>
                                </div>

                                <div class="col-12 col-md-4 d-lg-flex flex-row justify-content-evenly align-items-center text-center my-2">
                                    <h6>3.Total Price :<%= totalprice %></h6>
                                </div>
                            </div>

                            <div class="row py-4">
                                <div class="col-12 text-center d-flex flex-row justify-content-evenly">
                                	<input type="hidden" name="totalprice" value="<%= totalprice %>">
									<input type="hidden" name="taxprice" value="<%= taxprice %>">
                                    
                                    <a href="cargo.jsp" class="btn btn-primary butt_on abutton px-3 py-1 ">Make Changes</a>
                                    <input type="submit" value="Confirm Booking" class="butt_on px-3 py-1">
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
    