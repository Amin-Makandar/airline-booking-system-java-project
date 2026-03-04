<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Qatar Airways</title>
    <link rel="icon" type="image/x-icon" href="./Images/Logo-icon/qatar-favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    
  </head>
  <body>
  
  
  
    <div class="container-fluid p-0">
    <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"> Signup Message</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Error or success message will be displayed here -->
                <p id="errorMsg"></p>
            </div>
        </div>
    </div>
</div>
        <section id="welcome">
            <div class="container-fluid d-flex flex-column justify-content-center align-items-center p-5">
                <div class="row py-3 py-md-4">
                    <h1 class="fw-bold display-md-4 text-center text-white word font5">WELCOME TO <span class="fontcolor2 font1">QATAR</span> AIRLINE !</h1>
                    <p class="lead text-white text-center fs-5 word font5"> Luxury Experience With Our Air Flights</p>
                </div>
                <div class="row">
                    <form class="card p-md-5" action="login" method="post"> 
                    	
                        <div class="col-12">
                            <label for="username" class="text-white py-2 font7">Username :-</label>
                        </div>
                        <div class="col-12 pb-3">
                            <input type="text" placeholder="Username,Email or Phone" id="username" class="inputdesign" name="Uservalue" required>
                        </div>
                        <div class="col-12">
                            <label for="password"  class="text-white py-2 font7">Password :-</label>
                        </div>
                        <div class="col-12 pb-3">
                            <input type="password" placeholder="Password" id="password" class="inputdesign" name="Userpassword" required>  
                        </div>  
                        <div class="col-12 d-flex flex-row justify-content-between py-3">
                            <input type="submit" value="LOG IN" class="butt_on  px-3 py-1 font5">
                            <a href="signup.jsp" class="btn butt_on abutton border border-1 px-3 py-1 font5">SIGN UP</a>
                        </div>
                        
                        <div class="col-12 text-center d-flex flex-column">
                        	<a href="forgetpassword.jsp" class="text-decoration-none text-white font1 ">Forget Password?</a>
                        	<!-- <a href="signup.jsp" class="text-decoration-none text-white font1 ">Create New Account</a> -->
                        </div>
                        
                        
                       
                    </form>
                </div>
            </div><!--end of welcome container-fluid-->
        </section><!--end of welocome section-->
    </div><!--main container fluid-->
    
    
<!-- Modal for error message -->
    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="errorModalLabel">LOGIN failed!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="errorMessage" class="text-danger">${errorMessage}</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    
 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    
    
    <% String errorMessage = (String) request.getAttribute("errorMessage");
       if (errorMessage != null) { %>
           <script>
               var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
               errorModal.show();
               
            // Change message color based on success or failure
               if (errorMessage.includes("success")) {
                   errorMessageElement.classList.remove("text-danger");
                   errorMessageElement.classList.add("text-success");
                   
                   // Redirect to login page after showing modal
                   setTimeout(function() {
                       window.location.href = "home.jsp";
                   }, 3000); // 3 seconds
               }
           </script>
           
    
    <% } %>
    
    <!-- 2 modal script -->
     <script>
    // When the document is ready
    $(document).ready(function() {
        // Show the modal if there's an error message in the session
        <% if (session.getAttribute("msg") != null) { %>
            // Set modal content and color based on message type
            var msg = "<%= session.getAttribute("msg") %>";
            var modalBody = $("#errorMsg");
            if (msg.includes("successfully")) {
                modalBody.text(msg);
                modalBody.addClass("text-success");
            } else {
                modalBody.text(msg);
                modalBody.addClass("text-danger");
            }
            // Show the modal
            $("#myModal").modal('show');
        <% } %>
    });
</script>

  </body>
</html>
    