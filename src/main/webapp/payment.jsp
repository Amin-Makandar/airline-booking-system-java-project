<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Random"%>  
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PAYMENT</title>
    <link rel="icon" type="image/x-icon" href="./Images/Logo-icon/qatar-favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style2.css">
  </head>
  <body>
  
  <% 
  session = request.getSession();
  String firstname = (String)session.getAttribute("firstname");
  String lastname = (String)session.getAttribute("lastname");
  
  String totalprice = (String)session.getAttribute("totalprice");
  
  String cardNumber =  generateRandomCardNumber();

  
  %>
  
  
    <%!
    public String generateRandomCardNumber() {
        // Generate a random 16-digit number with spaces between every four digits
        Random rand = new Random();
        StringBuilder cardNumberBuilder = new StringBuilder();
        for (int i = 1; i <= 16; i++) {
            cardNumberBuilder.append(rand.nextInt(10)); // Append a random digit

            // Add a space after every four digits except for the last group
            if (i % 4 == 0 && i != 16) {
                cardNumberBuilder.append(" ");
            }
        }
        return cardNumberBuilder.toString(); // Convert StringBuilder to String
    }
    %>
	
<div class="container-fluid">
    <section id="payment">
        <div class="contianer-fluid p-0">
            <div class="row">
                <div class="col-12 p-0 text-center">
                    <h3 class="fw-bold text-white fixed-top py-4">PAYMENT</h3>
                </div>
            </div>
            <div class="row align-items-center mt-5 ">
                <div class="col-12  col-md-6 my-2">
                    <div class="container card">
                        <header>
                            <span class="logo">
                                <img src="./Images/Payment-card/logo.png" alt="" />
                                <h5>Master Card</h5>
                            </span>
                            <img src="./Images/Payment-card/chip.png" alt="" class="chip" />
                        </header>
                        <div class="card-details">
                            <div class="name-number">
                                <h6>Card Number</h6>
                                <h5 class="number"><%= cardNumber %></h5>
                                <h5 class="name"> <strong><%= firstname %> &nbsp; <%= lastname %></strong> </h5>
                            </div>
                            <div class="valid-date">
                                <h6>Valid Thru</h6>
                                <h5>05/28</h5>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 px-md-5 my-2">
                    
                        <div class="row d-flex flex-row justify-content-center align-items-center">
                            <div class="col-10">
                                <label for="userInput" class="form-label text-white fw-bold">Card Number</label>
        						<input type="text" id="userInput" pattern="\d{4}\s?\d{4}\s?\d{4}\s?\d{4}" placeholder="Enter Card Number" class="form-control inputdesign">
        						
                            </div>

                            <div class="col-10 py-3">
                                <label class="form-label text-white fw-bold">Card Holder</label>
                                <input type="text" class="form-control inputdesign" id=""
                                       placeholder="Card Holder Name">
                            </div>

                            <div class="col-5 col-lg-3">
                                <label class="form-label text-white fw-bold">Expire Month</label>
                                <input type="text" class="form-control inputdesign"  placeholder="Month">
                            </div>

                            <div class="col-5 col-lg-3">
                                <label class="form-label text-white fw-bold">Expire Year</label>
                                <input type="text" class="form-control inputdesign"  placeholder="Year">
                            </div>

                            <div class="col-10 col-lg-4 py-3 py-lg-0 align-self-lg-end  text-center">
                                <button type="button" class="btn btn-primary" onclick="verifyNumbers()">Verify Your Card</button>
                            </div>
                            
                            <div class="col-10 py-3 ">                          
								<form id="payNowForm" style="display: none;" action="finalpayment" method="post" >
								<label class="form-label text-white fw-bold">Enter Password</label>
								<div class="row">
									<div class="col-12 col-md-6 my-2">
                                		<input type="password" class="form-control inputdesign"  placeholder="Enter LOGIN Password" name="password">
                                	</div>
                                	<div class="col-12 col-md-6 text-center my-2">
                                		<input type="submit" value="Pay Now <%= totalprice %>/-" class="btn btn-primary">
                                	</div>
                            	</form>
                            </div>
                        </div>
                </div>
            </div><!-- end of row -->
        </div><!--end of container-fluid-->
    </section><!--end of payment section-->
</div><!-- end of main container-fluid -->

<!-- Modal for error message -->
    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-dark" id="errorModalLabel">PAYMENT Failed!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="errorMessage" class="text-danger">${paymentmsg}</div>
                    <div><h5 class="text-end"> <a href="login.jsp" class="text-decoration-none">LOGIN Again</a></h5></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	 
   <script>
        function verifyNumbers() {
            var userInput = document.getElementById("userInput").value.replace(/\s/g, ""); // Remove spaces
            var randomNumbers = "<%= cardNumber %>".replace(/\s/g, ""); // Remove spaces
            if (userInput === randomNumbers) {
                document.getElementById("payNowForm").style.display = "block";
            } else {
                alert("Card Numbers do not match. Please try again.");
            }
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

	