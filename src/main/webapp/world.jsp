<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Explore The World</title>
    <link rel="icon" type="image/x-icon" href="./Images/Logo-icon/qatar-favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/style.css">
  </head>
  <body>
  
  <datalist id="airportlist">
        <%
        	
        String airportFilePath = application.getRealPath("WEB-INF/data/world_airports.csv");
        try (Scanner scanner = new Scanner(new File(airportFilePath))) {
            int lineNo = 0;
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine().trim();
                lineNo++; // Increment line number
                if (lineNo == 1) {
                    continue; // Skip the first line
                }
                
                // Split the line by commas
                String[] parts = line.split(",");
                
                if (parts.length >= 2) { // Ensure there are at least two parts (airportName and city)
                    String airportName = parts[0].trim(); // Airport name from first column
                    String city = parts[1].trim(); // City from next column
                    
                    // Concatenate airportName and city and print as an option in the datalist
                    out.println("<option value=\"" + airportName + " - " + city + "\">" + airportName + " - " + city + "</option>");
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        %>
        
    </datalist>
    
    
  
  <div class="container-fluid p-0">
        <section id="explore_world">
            <div class="contianer-fluid">
                <div class="row fixed-top px-3 px-lg-0" id="header1">
                    <div class="col-12 p-0 font5">
                        <nav class="navbar navbar-expand-lg bg-transparent">
                            <div class="container-fluid px-lg-5">
                              <a class="navbar-brand text-white fw-bold fs-4 word" href="#">QATAR AIRWAYS</a>
                              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                              </button>
                              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav ms-auto mb-2 fw-bold mb-lg-0">
                                  <li class="nav-item">
                                    <a class="nav-link active text-white px-lg-3" aria-current="page" href="./home.jsp">Home</a>
                                  </li>
                                  
                                  <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle text-white px-lg-3" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                      Explore
                                    </a>
                                    <ul class="dropdown-menu bg-dark border-0">
                                      <li><a class="dropdown-item text-white" href="./india.jsp">Explore India</a></li>
                                      <li><a class="dropdown-item text-white" href="">Explore the World</a></li>
                                    </ul>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link text-white px-lg-3" href="./cargo.jsp">CarGo</a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link text-white px-lg-3" href="#">BooK</a>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </nav>
                    </div>
                </div>
                <div class="row py-3 py-lg-5">
                    <div class="col-12 text-center">
                        <h2 class="fw-bold display-4 text-white word font1">Explore The World</h2>
                        <p class="lead text-white word font5">&quot;Remember that happiness is a way of travel &#8210; not a destination&quot;</p>
                        
                    </div>
                </div>
            </div><!--end of header container-fluid-->
        </section><!--end of header section-->
        
         <section id="bookflights-world">
            <div class="container">
              <div class="row">
                <div class="col-12">
                  <div class="p-2 p-md-5 rounded-4 booking-box">
                    <nav class="bg-light rounded-top">
                      <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active w-25 py-3 fw-bold rounded-0 font5" id="nav-return-tab" data-bs-toggle="tab" data-bs-target="#nav-return" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Return</button>
                        <button class="nav-link w-25 py-3 fw-bold rounded-0 font5" id="nav-oneway-tab" data-bs-toggle="tab" data-bs-target="#nav-oneway" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">One-Way</button>
                        <button class="nav-link w-25 py-3 fw-bold rounded-0 font5" id="nav-multicity-tab" data-bs-toggle="tab" data-bs-target="#nav-multicity" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Multi-City</button>
                        <button class="nav-link w-25 py-3 fw-bold rounded-0 font5" id="nav-status-tab" data-bs-toggle="tab" data-bs-target="#nav-status" type="button" role="tab" aria-controls="nav-status" aria-selected="false">Flight Status</button>
                      </div>
                    </nav>
                    
                    <div class="tab-content my-3" id="nav-tabContent">
                      <!--Return type Booking-->
                      <div class="tab-pane fade show active" id="nav-return" role="tabpanel" aria-labelledby="nav-return-tab" tabindex="0">
                        <form action="return" method="post">
                          	<div class="row d-block d-flex justify-content-center d-lg-none"><!--return in small and medium screen-->
	                            <div class="col-12 col-md-6 my-2 text-center">
	                              <input list = "airportlist" aria-label="From" class="form-control" placeholder="From" name="Rfrom" required>
	                            </div>
	                            <div class="col-12 col-md-6 my-2 text-center">
	                              <input list = "airportlist" aria-label="To" class="form-control" placeholder="To" name="Rto" required>
	                            </div>
	                            <div class="col-6 my-2 text-center">
	                              <input type="date" aria-label="Departure" class="form-control" placeholder="Departure" name="DDate" required>
	                            </div>
	                            <div class="col-6  my-2 text-center">
	                              <input type="date" aria-label="Return" class="form-control" placeholder="Return" name="RDate" required>
	                            </div>
	                            <div class="col-12  my-2 text-center">
	                              <input type="text" class="form-control" placeholder="Number of Passenger" name="Returnpassenger" required>
	                            </div>
	             
	                            <div class="col-12 col-md-6 my-2 text-center">
	                              <select class="form-select" id="inputGroupSelect01" name="Flightclass" required>
	                                <option disabled>Choose...</option>
	                                <option value="Economy Class">Economy Class</option>
	                                <option value="Bussiness Class">Bussiness Class</option>
	                                <option value="First Class">First Class</option>
	                              </select>
	                            </div>
	                            <div class="col-12 col-md-6 my-2 text-center">
	                              <input type="submit" value="Search Flight" class="px-3 py-1 searchflight">
	                            </div>
                          	</div>
                         </form>
                          <div class="row d-none d-lg-block"><!--return in large screen-->
                            <div class="col-12">
                            <form action="return" method="post">
                              <div class="input-group">
                                <input list = "airportlist" aria-label="From" class="form-control py-3" placeholder="From"  name="Rfrom" id="searchInput" list="airportList" required>
                                
                                <input list = "airportlist" aria-label="to" class="form-control" placeholder="To" name="Rto" required>
                                <input type="date" class="form-control" placeholder="Departure" name="DDate" required>
                                <input type="date" class="form-control" placeholder="Return" name="RDate" required>
                                <input type="text" class="form-control" placeholder="Number of Passenger" name="Returnpassenger" required>
                                <select class="form-select" id="inputGroupSelect01" name="Flightclass" required>
                                  <option disabled>Choose...</option>
                                  <option value="Economy Class">Economy Class</option>
                                  <option value="Business Class">Bussiness Class</option>
                                  <option value="First Class">First Class</option>
                                </select>
                              </div>
                            </div>
                            <div class="col-12 text-center pt-5 ">
                              <input type="submit" value="Search Flight" class="px-3 py-1 searchflight">
                            </div>
                          </div>
                        </form>
                      </div>
                      <!--End Of Return type Booking-->
  
                      <!--Start of One-way Booking-->
                      <div class="tab-pane fade" id="nav-oneway" role="tabpanel" aria-labelledby="nav-oneway-tab" tabindex="0">
                        <form action="oneway" method="post">
                          <div class="row d-block d-flex d-lg-none"><!--return in small and medium screen-->
                            <div class="col-12 col-md-6 my-2 text-center">
                              <input list = "airportlist" aria-label="From" class="form-control" placeholder="From" name="Onefrom" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                              <input list = "airportlist" aria-label="To" class="form-control" placeholder="To" name="Oneto" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                              <input type="date" aria-label="Departure" class="form-control" placeholder="Departure" name="Onedate" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                            	<input type="text" class="form-control" placeholder="Number of Passenger" name="Onewaypassenger" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                              <select class="form-select" id="inputGroupSelect01" name="Flightclass" required>
                                <option disabled>Choose...</option>
                                <option value="Economy Class">Economy Class</option>
                                <option value="Business Class">Bussiness Class</option>
                                <option value="First Class">First Class</option>
                              </select>
                            </div>
                            <div class="col-12  my-2 text-center">
                              <input type="submit" value="Search Flight" class="px-3 py-1 searchflight">
                            </div>
                          </div>
                          </form>
                          <div class="row d-none d-lg-block"><!--return in large screen-->
                            <div class="col-12">
                            <form action="oneway" method="post">
                              <div class="input-group">
                                <input list = "airportlist" aria-label="From" class="form-control py-3" placeholder="From" name="Onefrom" id="airportInput" required>
                                <input list = "airportlist" aria-label="Last name" class="form-control" placeholder="To" name="Oneto" required>
                                <input type="date" class="form-control" placeholder="Departure" name="Onedate" required>
                                
                                <input type="text" class="form-control" placeholder="Number of Passenger" name="Onewaypassenger" required>
                                <select class="form-select" id="inputGroupSelect01" name="Flightclass" required>
                                  <option disabled>Choose...</option>
                                  <option value="Economy Class">Economy Class</option>
                                  <option value="Business Class">Bussiness Class</option>
                                  <option value="First Class">First Class</option>
                                </select>
                              </div>
                            </div>
                            <div class="col-12 text-center pt-5 ">
                              <input type="submit" value="Search Flight" class="px-3 py-1 searchflight">
                            </div>
                          </div>
                        </form>
                      </div>
                      <!--End of One-way Booking-->
  
                      <!--Start Of Multi-way Booking-->
                      <div class="tab-pane fade" id="nav-multicity" role="tabpanel" aria-labelledby="nav-multicity-tab" tabindex="0">
                        <form action="multicity" method="post">
                          <div class="row d-block d-flex d-lg-none"><!--return in small and medium screen-->
                            
                            <div class="col-12 col-md-6 my-2 text-center">
                              <input list = "airportlist" aria-label="From" class="form-control" placeholder="From" name="City1" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                              <input list = "airportlist" aria-label="To" class="form-control" placeholder="To" name="City2" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                              <input type="date" aria-label="Departure" class="form-control" placeholder="Departure" name="Mdate" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                              <input type="text" aria-label="Departure" class="form-control" placeholder="Number of  Passenger" name="Multicitypassenger" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                              <select class="form-select" id="inputGroupSelect01" name="Flightclass" required>
                                <option disabled>Choose...</option>
                                <option value="Economy Class">Economy Class</option>
                                <option value="Bussiness Class">Bussiness Class</option>
                                <option value="First Class">First Class</option>
                              </select>
                            </div>
                            <div class="col-12 text-center">
                              <h3 class="text-white fw-bold"> Next destination</h3>
                            </div>
                          </div><!-- end of first city in small screen -->
                          
                          <div class="row d-block d-flex d-lg-none"><!--return in small and medium screen-->
                            <div class="col-12 col-md-6 my-2 text-center">
                              <input list = "airportlist" aria-label="From" class="form-control" placeholder="From" name="City3" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                              <input list = "airportlist" aria-label="To" class="form-control" placeholder="To" name="City4" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                              <input type="date" aria-label="Departure" class="form-control" placeholder="Departure" name="M2date" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                            	<input type="text" class="form-control" placeholder="Number of Passenger" name="Multicity2passenger" required>
                            </div>
                            <div class="col-12 col-md-6 my-2 text-center">
                              <select class="form-select" id="inputGroupSelect01" name="Flightclass2" required>
                                <option selected>Choose...</option>
                                <option value="Economy Class">Economy Class</option>
                                <option value="Bussiness Class">Bussiness Class</option>
                                <option value="First Class">First Class</option>
                              </select>
                            </div>
                            <div class="col-12  my-2 text-center">
                              <input type="submit" value="Search Flight" class="px-3 py-1 searchflight">
                            </div>
                          </div><!-- end of second city in small screen -->
                          
                         </form>
                          
                          
                          
                          
                          <div class="row d-none d-lg-block"><!--return in large screen-->
                            <div class="col-12">
                            <form action="multicity" method="post">
                              <div class="input-group">
                                <input list = "airportlist" aria-label="First name" class="form-control py-3" placeholder="From" name="City1" required>
                                <input list = "airportlist" aria-label="Last name" class="form-control" placeholder="To" name="City2" required>
                                <input type="date" class="form-control" placeholder="Departure" name="Mdate" required>
                                
                                <input type="text" class="form-control" placeholder="Number of Passenger" name="Multicitypassenger" required>
                                <select class="form-select" id="inputGroupSelect01" name="Flightclass" required>
                                  <option disabled>Choose...</option>
                                  <option value="Economy Class">Economy Class</option>
                                  <option value="Business Class">Bussiness Class</option>
                                  <option value="First Class">First Class</option>
                                </select>
                              </div>
                            </div>
                            
                          </div><!--end of first city-->
  
                          
                          <div class="row d-none d-lg-block"><!--return in large screen-->
                            <div class="col-12">
                              <div class="input-group my-2">
                                <input list = "airportlist" aria-label="First name" class="form-control py-3" placeholder="From" name="City3" required>
                                <input list = "airportlist" aria-label="Last name" class="form-control" placeholder="To" name="City4" required>
                                <input type="date" class="form-control" placeholder="Departure" name="M2date" required>
                                
                                <input type="text" class="form-control" placeholder="Number of Passenger" name="Multicity2passenger" required>
                                <select class="form-select" id="inputGroupSelect01" name="Flightclass2" required>
                                  <option disabled>Choose...</option>
                                  <option value="Economy Class">Economy Class</option>
                                  <option value="Business Class">Bussiness Class</option>
                                  <option value="First Classs">First Class</option>
                                </select>
                              </div>
                            </div>
                            <div class="col-12 text-center pt-5 ">
                              <input type="submit" value="Search Flight" class="px-3 py-1 searchflight">
                            </div>
                          </div><!--end of second city-->
                        </form>
                      </div>
                      <!--End of Multi-way Booking-->
                      <!--Start of Flight Status-->
                      <div class="tab-pane fade text-white lead font3" id="nav-status" role="tabpanel" aria-labelledby="nav-status-tab" tabindex="0" >
                      	<p>1.Ticketing and Boarding: Passengers are required to have a valid ticket or boarding pass to access the aircraft. Boarding procedures typically involve security checks and verification of travel documents.</p>
                      	<p>2.Baggage Allowance and Restrictions: Airlines have specific rules regarding the size, weight, and number of bags allowed per passenger, as well as restrictions on items that can be carried in both checked and carry-on luggage.</p>
                      	<p>3.Safety Briefings: Before takeoff, passengers are provided with safety instructions, including the location of emergency exits, how to use safety equipment, and what to do in the event of an emergency.</p>
                      </div>
                    </div>
                    <!--end of FLight Status-->   
                  </div> 
                </div>
              </div>
            </div>
        </section><!--end of booking flights section-->
  
        
        
        
        
        <section id="world">
          <div class="container-fluid">
               
              <div class="row py-3 py-lg-5">
                <div class="col-12 text-center">
                  <h2 class="fw-bold display-4 word font1">Amazing Places To Explore</h2>
                </div>
              </div><!--end of row1-->
            <div class="row">
                <div class="col-12 col-md-6 my-3">
                    <div class="card-world">
                        <img src="./Images/world/Sau-Paulo.jpg" class="card-img" alt="...">
                        <div class="card-img-overlay d-flex flex-column justify-content-end align-items-center text-white text-center py-3">
                            <h3 class="card-title fw-bold font7">Sau-Paulo</h3>
                            <p class="card-text font3">Economy Starts from INR 128403/-</p>
                            <a href="" class="text-decoration-none butt_on abutton border border-1 px-4 py-1">BooK Now</a>
                        </div>
                    </div>
                </div> 
  
                <div class="col-12 col-md-6 col-lg-3 my-3">
                  <div class="card-world">
                    <img src="./Images/world/Istanbul.jpg" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex flex-column justify-content-end align-items-center text-white text-center py-3">
                      <h3 class="card-title fw-bold font7">Istanbul</h3>
                      <p class="card-text font3">Economy Starts from INR 128403/-</p>
                      <a href="" class="text-decoration-none  butt_on abutton border border-1 px-4 py-1">BooK Now</a>
                    </div>
                  </div>
                </div> 
  
                <div class="col-12 col-md-6 col-lg-3 my-3">
                  <div class="card-world">
                    <img src="./Images/world/London.jpg" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex flex-column justify-content-end align-items-center text-white text-center py-3">
                      <h3 class="card-title fw-bold font7">London</h3>
                      <p class="card-text font3">Economy Starts from INR 128403/-</p>
                      <a href="" class="text-decoration-none butt_on abutton border border-1 px-4 py-1">BooK Now</a>
                    </div>
                  </div>
                </div> 
  
                <div class="col-12 col-md-6 col-lg-3 my-3">
                  <div class="card-world">
                    <img src="./Images/world/Maldives.jpg" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex flex-column justify-content-end align-items-center text-white text-center py-3">
                      <h3 class="card-title fw-bold">Maldives</h3>
                      <p class="card-text font3">Economy Starts from INR 128403/-</p>
                      <a href="" class="text-decoration-none butt_on abutton border border-1 px-4 py-1">BooK Now</a>
                    </div>
                  </div>
                </div> 
  
                <div class="col-12 col-md-6 col-lg-3 my-3">
                  <div class="card-world">
                    <img src="./Images/world/Dubai.jpg" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex flex-column justify-content-end align-items-center text-white text-center py-3">
                      <h3 class="card-title fw-bold font7">Dubai</h3>
                      <p class="card-text font3">Economy Starts from INR 128403/-</p>
                      <a href="" class="text-decoration-none butt_on abutton border border-1 px-4 py-1">BooK Now</a>
                    </div>
                  </div>
                </div> 
  
                <div class="col-12 col-md-6  my-3">
                  <div class="card-world">
                    <img src="./Images/world/Taj-Mahal India.jpg" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex flex-column justify-content-end align-items-center text-white text-center py-3">
                      <h3 class="card-title fw-bold">Taj-Mahal</h3>
                      <p class="card-text font3">Economy Starts from INR 128403/-</p>
                      <a href="" class="text-decoration-none butt_on abutton border border-1 px-4 py-1">BooK Now</a>
                    </div>
                  </div>
                </div> 
  
                <div class="col-12 col-md-6 col-lg-3 my-3">
                  <div class="card-world">
                    <img src="./Images/world/Thailand.jpg" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex flex-column justify-content-end align-items-center text-white text-center py-3">
                      <h3 class="card-title fw-bold font7">Thailand</h3>
                      <p class="card-text font3">Economy Starts from INR 128403/-</p>
                      <a href="" class="text-decoration-none butt_on abutton border border-1 px-4 py-1">BooK Now</a>
                    </div>
                  </div>
                </div> 
  
                <div class="col-12 col-md-6 col-lg-3 my-3">
                  <div class="card-world">
                    <img src="./Images/world/Barcelona.jpg" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex flex-column justify-content-end align-items-center text-white text-center py-3">
                      <h3 class="card-title fw-bold font7">Barcelona</h3>
                      <p class="card-text font3">Economy Starts from INR 128403/-</p>
                      <a href="" class="text-decoration-none butt_on abutton border border-1 px-4 py-1">BooK Now</a>
                    </div>
                  </div>
                </div> 
  
                <div class="col-12 col-md-6 col-lg-3 my-3">
                  <div class="card-world">
                    <img src="./Images/world/America.jpg" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex flex-column justify-content-end align-items-center text-white text-center py-3">
                      <h3 class="card-title fw-bold font7">America</h3>
                      <p class="card-text font3">Economy Starts from INR 128403/-</p>
                      <a href="" class="text-decoration-none butt_on abutton border border-1 px-4 py-1">BooK Now</a>
                    </div>
                  </div>
                </div> 
  
                <div class="col-12 col-md-6 col-lg-3 my-3">
                  <div class="card-world">
                    <img src="./Images/world/Malaysia.jpg" class="card-img" alt="...">
                    <div class="card-img-overlay d-flex flex-column justify-content-end align-items-center text-white text-center py-3">
                      <h3 class="card-title fw-bold font7">Malaysia</h3>
                      <p class="card-text font3">Economy Starts from INR 128403/-</p>
                      <a href="" class="text-decoration-none butt_on abutton border border-1 px-4 py-1">BooK Now</a>
                    </div>
                  </div>
                </div> 
              </div><!--end of row-2-->
            </div><!--end of world of container-fluid-->
        </section><!--end of world section-->
        
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
  
    </div><!-- end of main container-fluid -->


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

