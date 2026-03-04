<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Random, java.text.SimpleDateFormat, java.util.Date" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CarGo Flights Available</title>
    <link rel="icon" type="image/x-icon" href="./Images/Logo-icon/qatar-favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body>
	<%
	session = request.getSession();
	String cargofrom = (String) session.getAttribute("cargofrom");
	String cargoto = (String) session.getAttribute("cargoto");
	String cargodate = (String) session.getAttribute("cargodate");
	String cargoweight = (String) session.getAttribute("cargoweight");
	String cargotype = (String) session.getAttribute("cargotype");
	String flighttype = (String) session.getAttribute("flighttype");
	
	
	String CG1 = "QA101CG";
  	String CG2 = "QA102CG";
  	String CG3 = "QA103CG";
  	String CG4 = "QA104CG";
  	
  	int flight1_price = 0;
  	int flight2_price = 0;
  	int flight3_price = 0;
  	int flight4_price = 0;
  	if (cargoweight != null && Double.parseDouble(cargoweight) < 10)  {
        Random rand = new Random();
        for (int i = 0; i < 4; i++) {
        	flight1_price = rand.nextInt(5001) + 5000; // Generate random number between 20000 and 50000
        	flight2_price = rand.nextInt(5001) + 5000; // Generate random number between 20000 and 50000
        	flight3_price = rand.nextInt(5001) + 5000;
        	flight4_price = rand.nextInt(5001) + 5000;
        }
        
      
    }else if(cargoweight != null && Double.parseDouble(cargoweight) < 25){
    	 Random rand = new Random();
         for (int i = 0; i < 4; i++) {
        	 flight1_price = rand.nextInt(10001) + 10000; // Generate random number between 75000 and 100000
         	flight2_price = rand.nextInt(10001) + 10000; // Generate random number between 75000 and 100000
         	flight3_price = rand.nextInt(10001) + 10000;
        	flight4_price = rand.nextInt(10001) + 10000;
         }
         
         
    }else if(cargoweight != null && Double.parseDouble(cargoweight) < 50){
    	Random rand = new Random();
        for (int i = 0; i < 4; i++) {
        	flight1_price = rand.nextInt(20001) + 20000; // Generate random number between 20000 and 60000
        	flight2_price = rand.nextInt(20001) + 20000; // Generate random number between 20000 and 60000
        	flight3_price = rand.nextInt(20001) + 20000;
        	flight4_price = rand.nextInt(20001) + 20000;
        }    
       
    }else if(cargoweight != null && Double.parseDouble(cargoweight) < 100){
    	Random rand = new Random();
        for (int i = 0; i < 4; i++) {
        	flight1_price = rand.nextInt(40001) + 30000; // Generate random number between 20000 and 60000
        	flight2_price = rand.nextInt(40001) + 30000; // Generate random number between 20000 and 60000
        	flight3_price = rand.nextInt(40001) + 30000;
        	flight4_price = rand.nextInt(40001) + 30000;
        }
    }else if(cargoweight != null && Double.parseDouble(cargoweight) < 200){
    	Random rand = new Random();
        for (int i = 0; i < 4; i++) {
        	flight1_price = rand.nextInt(100001) + 50000; // Generate random number between 20000 and 60000
        	flight2_price = rand.nextInt(100001) + 50000; // Generate random number between 20000 and 60000
        	flight3_price = rand.nextInt(100001) + 50000;
        	flight4_price = rand.nextInt(100001) + 50000;
        }
    }else if(cargoweight != null && Double.parseDouble(cargoweight) < 400){
    	Random rand = new Random();
        for (int i = 0; i < 4; i++) {
        	flight1_price = rand.nextInt(200001) + 50000; // Generate random number between 20000 and 60000
        	flight2_price = rand.nextInt(200001) + 50000; // Generate random number between 20000 and 60000
        	flight3_price = rand.nextInt(200001) + 50000;
        	flight4_price = rand.nextInt(200001) + 50000;
        }
    }
    
	%>
	
<%
    java.util.Random random = new java.util.Random();
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("hh:mm:ss a");

    String futureTime1 = "";
    String futureTime2 = "";
    String futureTime3 = "";
    String futureTime4 = "";

    for (int i = 0; i < 4; i++) {
        // Get the current time
        java.util.Calendar cal = java.util.Calendar.getInstance();

        // Generate random hours, minutes, and seconds
        int randomHours = random.nextInt(12); // Random hours between 0 and 11
        int randomMinutes = random.nextInt(60); // Random minutes between 0 and 59
        int randomSeconds = random.nextInt(60); // Random seconds between 0 and 59

        // Add random time to current time
        cal.add(java.util.Calendar.HOUR_OF_DAY, randomHours);
        cal.add(java.util.Calendar.MINUTE, randomMinutes);
        cal.add(java.util.Calendar.SECOND, randomSeconds);

        // Format the future time with AM/PM
        String formattedTime = sdf.format(cal.getTime());

        // Store each time in a separate variable
        switch (i) {
            case 0:
                futureTime1 = formattedTime;
                break;
            case 1:
                futureTime2 = formattedTime;
                break;
            case 2:
                futureTime3 = formattedTime;
                break;
            case 3:
                futureTime4 = formattedTime;
                break;
        }
    }
     
%>

	<div class="container-fluid p-0">
        <section id="cargo-flight">
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
                    </div><!--end of col-1-->
                </div><!--end of row-1-->
               <div class="row">
                    <div class="col-12">
                        <h2 class="text-center py-5 text-white fw-bold display-4 font1">Flights Available</h2>
                    </div>
                </div>
                
                
                <div class="container">
                
                    <div class="row pb-4">
                       <div class="col-12 p-0 my-3">
                            <div class="card">
                                <div class="card-body text-white font7">
                                	<h6 class="card-title text-center font2">Flight 1</h6>
                                		<div class="d-md-flex flex-row justify-content-evenly text-center">
                                			<div>
                                    			<h5 class="card-text fw-bold">Departure:-<span class="fw-bold fs-3 font5 fontcolor"><%= cargofrom %></span></h4>
                                    		</div>
                                    		<div>
                                    			<i class="fas fa-plane px-md-3"></i>
                                    		</div>
                                    		<div>
                                    			<h5 class="card-text fw-bold">Arrival:-<span class="fw-bold fs-3 font5 fontcolor"><%= cargoto %></span></h5>
                                    		</div>
                                		</div>
                                		<div class="text-start py-3">
                                    		<div class="text-start d-md-flex flex-row justify-content-between">
                                        		<p>Flight Timing:-<span class="fw-bold fontcolor"> <%=futureTime1 %> </span></p>
                                        		<p>On Date:-<span class="fw-bold fontcolor"> <%= cargodate %> </span></p>
												<p>Price:-<span class="fw-bold fontcolor"> <%= flight1_price %> /-</p>
                                    		</div>
                                    	<div class="text-start d-md-flex flex-row justify-content-evenly">
                                        	<p>Flight Type:- <span class="fw-bold fontcolor"> <%= flighttype %></p>
                                        	<p>Flight ID:- <span class="fw-bold fontcolor"> <%=CG1 %>  </p>
                                        	
                                    	</div>
                                </div>
                                <div class="text-center">
                                    <form action="cargovalues" method="post">
									    <input type="hidden" name="flightId" value="<%= CG1 %>">
									    <input type="hidden" name="price" value="<%= flight1_price %>">
									    <input type="hidden" name="time" value="<%= futureTime1 %>">
									    <button type="submit" class="btn btn-primary">BOOK NOW</button>
									</form>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-12 p-0 my-3">
                            <div class="card">
                                <div class="card-body text-white font7">
                                	<h6 class="card-title text-center font3">Flight 2</h6>
                                		<div class="d-md-flex flex-row justify-content-evenly text-center">
                                			<div>
                                    			<h5 class="card-text fw-bold">Departure:-<span class="fw-bold fs-3 font5 fontcolor"><%= cargofrom %></span></h4>
                                    		</div>
                                    		<div>
                                    			<i class="fas fa-plane px-md-3"></i>
                                    		</div>
                                    		<div>
                                    			<h5 class="card-text fw-bold">Arrival:-<span class="fw-bold fs-3 font5 fontcolor"><%= cargoto %></span></h5>
                                    		</div>
                                		</div>
                                		<div class="text-start py-3">
                                    		<div class="text-start d-md-flex flex-row justify-content-between">
                                        		<p>Flight Timing:-<span class="fw-bold fontcolor"> <%=futureTime2 %> </span></p>
                                        		<p>On Date:-<span class="fw-bold fontcolor"> <%= cargodate %> </span></p>
												<p>Price:-<span class="fw-bold fontcolor"> <%= flight2_price %> /-</p>
                                    		</div>
                                    	<div class="text-start d-md-flex flex-row justify-content-evenly">
                                        	<p>Flight Type:- <span class="fw-bold fontcolor"> <%= flighttype %></p>
                                        	<p>Flight ID:- <span class="fw-bold fontcolor"> <%= CG2 %>  </p>
                                        	
                                    	</div>
                                </div>
                                <div class="text-center">
                                    <form action="cargovalues" method="post">
									    <input type="hidden" name="flightId" value="<%= CG2 %>">
									    <input type="hidden" name="price" value="<%= flight2_price %>">
									    <input type="hidden" name="time" value="<%= futureTime2 %>">
									    <button type="submit" class="btn btn-primary">BOOK NOW</button>
									</form>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-12 p-0 my-3">
                            <div class="card">
                                <div class="card-body text-white font7">
                                	<h6 class="card-title text-center font2">Flight 3</h6>
                                		<div class="d-md-flex flex-row justify-content-evenly text-center">
                                			<div>
                                    			<h5 class="card-text fw-bold">Departure:-<span class="fw-bold fs-3 font5 fontcolor"><%= cargofrom %></span></h4>
                                    		</div>
                                    		<div>
                                    			<i class="fas fa-plane px-md-3"></i>
                                    		</div>
                                    		<div>
                                    			<h5 class="card-text fw-bold">Arrival:-<span class="fw-bold fs-3  font5 fontcolor"><%= cargoto %></span></h5>
                                    		</div>
                                		</div>
                                		<div class="text-start py-3">
                                    		<div class="text-start d-md-flex flex-row justify-content-between">
                                        		<p>Flight Timing:-<span class="fw-bold fontcolor"> <%=futureTime3 %> </span></p>
                                        		<p>On Date:-<span class="fw-bold fontcolor"> <%= cargodate %> </span></p>
												<p>Price:-<span class="fw-bold fontcolor"> <%= flight3_price %> /-</p>

                                    		</div>
                                    	<div class="text-start d-md-flex flex-row justify-content-evenly">
                                        	<p>Flight Type:- <span class="fw-bold fontcolor"> <%= flighttype %></p>
                                        	<p>Flight ID:- <span class="fw-bold fontcolor"> <%= CG3 %> </p>
                                        	
                                    	</div>
                                </div>
                                <div class="text-center">
                                    <form action="cargovalues" method="post">
									    <input type="hidden" name="flightId" value="<%= CG3 %>">
									    <input type="hidden" name="price" value="<%= flight3_price %>">
									    <input type="hidden" name="time" value="<%= futureTime3 %>">
									   
									    <button type="submit" class="btn btn-primary">BOOK NOW</button>
									</form>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-12 p-0 my-3">
                            <div class="card">
                                <div class="card-body text-white font7">
                                	<h6 class="card-title text-center font2">Flight 4</h6>
                                		<div class="d-md-flex flex-row justify-content-evenly text-center">
                                			<div>
                                    			<h5 class="card-text fw-bold">Departure:-<span class="fw-bold fs-3 font5 fontcolor"><%= cargofrom %></span></h4>
                                    		</div>
                                    		<div>
                                    			<i class="fas fa-plane px-md-3"></i>
                                    		</div>
                                    		<div>
                                    			<h5 class="card-text fw-bold">Arrival:-<span class="fw-bold fs-3 font5 fontcolor"><%= cargoto %></span></h5>
                                    		</div>
                                		</div>
                                		<div class="text-start py-3">
                                    		<div class="text-start d-md-flex flex-row justify-content-between">
                                        		<p>Flight Timing:-<span class="fw-bold fontcolor"> <%=futureTime4 %> </span></p>
                                        		<p>On Date:-<span class="fw-bold fontcolor"> <%= cargodate %> </span></p>
												<p>Price:-<span class="fw-bold fontcolor"> <%= flight4_price %> /-</p>

                                    		</div>
                                    	<div class="text-start d-md-flex flex-row justify-content-evenly">
                                        	<p>Flight Type:- <span class="fw-bold fontcolor"> <%= flighttype %></p>
                                        	<p>Flight ID:- <span class="fw-bold fontcolor"> <%= CG4 %>  </p>
                                        	
                                    	</div>
                                </div>
                                <div class="text-center">
                                    <form action="cargovalues" method="post">
									    <input type="hidden" name="flightId" value="<%= CG4 %>">
									    <input type="hidden" name="price" value="<%= flight4_price %>">
									    <input type="hidden" name="time" value="<%= futureTime4 %>">
									    <button type="submit" class="btn btn-primary">BOOK NOW</button>
									</form>
                                </div>
                            </div>
                        </div>
                        
                        
                    </div>                     
                
                    
                    
                                     
                    
                </div><!--end of container-->       
            </div><!--end of section container-fluid-->
        </section><!--end of one-way-flight-->
        
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