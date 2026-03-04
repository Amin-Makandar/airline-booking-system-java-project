<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CarGo Services</title>
    <link rel="icon" type="image/x-icon" href="./Images/Logo-icon/qatar-favicon.png">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
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
      <section id="cargo">
        <div class="contianer-fluid">
          <div class="row fixed-top px-3 px-lg-0" id="header1">
            <div class="col-12 p-0">
              <nav class="navbar navbar-expand-lg bg-transparent">
                <div class="container-fluid px-lg-5">
                  <a class="navbar-brand text-white fw-bold fs-4 word font5" href="#">QATAR CarGo</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                      <ul class="navbar-nav ms-auto mb-2 fw-bold mb-lg-0">
                        <li class="nav-item">
                          <a class="nav-link active text-white px-lg-3 font5" aria-current="page" href="./home.jsp">Home</a>
                        </li>         
                        <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle text-white px-lg-3 font5" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Explore
                          </a>
                          <ul class="dropdown-menu bg-transparent border-0">
                            <li><a class="dropdown-item text-white font5" href="./india.jsp">Explore India</a></li>
                            <li><a class="dropdown-item text-white font5" href="./world.jsp">Explore the World</a></li>
                          </ul>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link text-white px-lg-3 font5" href="">CarGo</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link text-white px-lg-3 font5" href="#">BooK</a>
                        </li>
                      </ul>
                  </div><!--end of nabvar collapse-->
                </div><!--end of navbar container-fluid-->
              </nav><!--end of navbar-->
            </div><!--end of row-1 col-12-->
          </div><!--end of row-1-->
          <div class="container">
            <div class="row p-3 p-md-0">
              <div class="col-12 py-3 card">
                <form action="cargoflight" method="post" class="row g-3 p-md-5 justify-content-center">
                  <div class="col-12 text-white text-center">
                    <h3 class="fw-bold d-none d-md-block word font7">FLY your Shipment with us Anytime,Anywhere</h3>
                    <h5 class="fw-bold d-block d-md-none word font7">FLY your Shipment with us Anytime,Anywhere</h5>

                  </div>
                  <div class="col-12 col-md-3 custom-select">
                  <input list = "airportlist" class="form-control" id="airportInput" placeholder="From" name="cargofrom" required>

                  </div>
                  <div class="col-12 col-md-3">
                    <input list = "airportlist" class="form-control" id="airportinput" placeholder="To" name="cargoto" required>                     
                  </div>
                  <div class="col-6 col-md-2">
                    <input type="date" class="form-control" id="validationCustom01" placeholder="Date" name="cargodate" required>
                  </div>
                  <div class="col-6 col-md-2">
                    <input type="number" class="form-control" id="validationCustom01" placeholder="Weight in kg" name="cargoweight" required>
                  </div>
                  <div class="col-12 col-md-2">
                    <select class="form-select" aria-label="" name="cargotype" required>
                      <option disabled>Type of Product</option>
                      <option value="General-CarGo">General-CarGo</option>
                      <option value="Perishable-CarGo">Perishable-CarGo</option>
                      <option value="Human-Remains">Human-Remains</option>
                      <option value="Important-documents">Important-documents</option>
                      <option value="Dangerous-Goods">Dangerous-Goods</option>
                      <option value="Animal-CarGo">Animal-CarGo</option>
                    </select>
                  </div>
                  <div class="col-12 d-flex flex-row  justify-content-evenly py-2">
                    <input type="submit" value="Search Flight" class="butt_on  px-md-3 py-md-1 font1">
                    <a href="" class="btn text-decoration-none butt_on abutton border border-1 px-md-3 py-md-1 font1">Track Shipment</a>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div><!--end of CARGO container-fluid-->
      </section><!--end of CARGO section-->
      <section id="cargo-service">
        <div class="container-fluid">
          <div class="row py-3 py-lg-5">
            <div class="col-12 text-center">
              <h2 class="fw-bold display-5 font1 word">CarGo Services & Facilities</h2>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-6 my-2 my-lg-3">
              <div class="card mb-3 border-0">
                <img src="./Images/cargo/cargo-types/General-CarGo.jpg" class="card-img-top" alt="...">
                <div class="card-body text-center">
                  <h5 class="card-title fw-bold font2">General CarGo</h5>
                  <p class="card-text font6">Send documents, samples, consolidations, readymade garments, auto parts, machine parts, fabrics, personal effects, household goods, footwear, carpets, etc. anywhere with our efficient and simple general cargo services.</p>
                </div>
              </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 my-2 my-lg-3">
              <div class="card mb-3 border-0">
                <img src="./Images/cargo/cargo-types/Perishable-CarGo.jpg" class="card-img-top" alt="...">
                <div class="card-body text-center">
                  <h5 class="card-title fw-bold font2">Perishable CarGo</h5>
                  <p class="card-text font6">Send fruits and vegetables, fish seed, biological samples , and we make sure they are delivered fresh.</p>
                </div>
              </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 my-2 my-lg-3">
              <div class="card mb-3 border-0">
                <img src="./Images/cargo/cargo-types/Human-Remain-Cargo.jpg" class="card-img-top" alt="...">
                <div class="card-body text-center">
                  <h5 class="card-title fw-bold font2">Human Remains</h5>
                  <p class="card-text font6">Human Remains exported carefully and preserved.They are kept under Bio-logical supervision</p>
                </div>
              </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 my-2 my-lg-3">
              <div class="card mb-3 border-0">
                <img src="./Images/cargo/cargo-types/Important-documents.jpg" class="card-img-top" alt="...">
                <div class="card-body text-center">
                  <h5 class="card-title fw-bold font2">Important-documents</h5>
                  <p class="card-text font6">These shipments require extra care due to their size  we ensure they travel safely. We put them inside a designated CarGo Document Bag and seal the same.</p>
                </div>
              </div>
            </div>

            <div class="col-12 col-md-6 col-lg-3 my-2 my-lg-3">
              <div class="card mb-3 border-0">
                <img src="./Images/cargo/cargo-types/Dangerous-Goods.jpg" class="card-img-top" alt="...">
                <div class="card-body text-center">
                  <h5 class="card-title fw-bold font2">Dangerous Goods</h5>
                  <p class="card-text font6">Goods like Flammable Liquid,Medicines,Radio-Active materials are traveled under the Supervision of Professionals Qualified Supervisor</p>
                </div>
              </div>
            </div>

            <div class="col-12 col-md-6 my-2 my-lg-3">
              <div class="card mb-3 border-0">
                <img src="./Images/cargo/cargo-types/Animal-CarGo.jpg" class="card-img-top" alt="...">
                <div class="card-body text-center">
                  <h5 class="card-title fw-bold font2">Animal CarGo</h5>
                  <p class="card-text font6"> We transport all types of animals whether they are amphibians, birds, crustaceans, fishes, invertebrates, mammals or reptiles. They are transported Safely and Comfortably</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
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
    