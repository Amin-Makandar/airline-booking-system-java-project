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
        <section id="forgot">
            <div class="container-fluid d-flex flex-column justify-content-center align-items-center p-5">
                <div class="row  py-md-4">
                    <h1 class="fw-bold display-md-4 text-center text-white word font5">Forget Password ?</h1>
                    <p class="lead text-white text-center fs-5 word font5">Don't Worry you Can Change your Password</p>
                </div>
                <div class="row">
                    <form class="card p-md-5" action="forgetpassword" method="post"> 
                        
                        <div class="col-12  d-flex flex-column pb-3">
                        	<label for="username" class="text-white font7 form-label">Email-Id or Phone-No :-</label>
                            <input type="text" name="userIdentifier" placeholder="Register Email or Phone" id="username" class="inputdesign" required>
                        </div>
                        
                        <div class="col-12 d-flex flex-column py-2">
                             <label for="Password" class=" text-white font7 form-label">New Password :-</label>
                             <input type="password" class=" inputdesign" name="newpassword" id="Password" placeholder="New Password" required>
                        </div>
                        
                        <div class="col-12 d-flex flex-column">
                             <label for="Password" class=" text-white font7 form-label">Confirm Password :-</label>
                             <input type="password" class=" inputdesign" id="confirmPassword" placeholder="Re-Enter Password" required>
                        </div>
                        <span id="passwordError" class="text-danger error" style="display: none;"></span>
                         
                        <div class="col-12 d-flex flex-row justify-content-between pt-4">
                            <input type="submit" value="Change Password" class="butt_on  px-1 py-1 font5">
                            <a href="signup.jsp" class="btn butt_on abutton border border-1 px-3 py-1 font5">SIGN UP</a>
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
                    <h5 class="modal-title" id="errorModalLabel">Password Status</h5>
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

    
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var passwordInput = document.getElementById("Password");
        var confirmPasswordInput = document.getElementById("confirmPassword");
        var passwordError = document.getElementById("passwordError");

        confirmPasswordInput.addEventListener("input", function() {
            var password = passwordInput.value;
            var confirmPassword = confirmPasswordInput.value;

            if (confirmPassword.length > 0) {
                if (password !== confirmPassword) {
                    // Show error message
                    passwordError.textContent = "Passwords do not match.";
                    passwordError.style.display = "block";
                } else {
                    // Remove error message if passwords match
                    passwordError.textContent = "";
                    passwordError.style.display = "none";
                }
            } else {
                // Clear any existing error message
                passwordError.textContent = "";
                passwordError.style.display = "none";
            }
        });
    });
</script>
    
<% String message = (String) request.getAttribute("message");
       if (message != null) { %>
      <script>
    // Retrieve message from request attribute
    var message = "${message}";
    var showModal = "${showModal}";

    // Check if message is not empty
    if (message.trim() !== "") {
        // Display message in modal
        var errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
        var errorMessageElement = document.getElementById('errorMessage');
        errorMessageElement.textContent = message;
        errorModal.show();
        
        // Change message color based on success or failure
        if (message.includes("success")) {
            errorMessageElement.classList.remove("text-danger");
            errorMessageElement.classList.add("text-success");
            
            // Redirect to login page after showing modal
            setTimeout(function() {
                window.location.href = "login.jsp";
            }, 3000); // 3 seconds
        }
    }
</script>
 <% } %>
  </body>
</html>
 