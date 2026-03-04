<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign-Up</title>

<link rel="icon" type="image/x-icon" href="./Images/Logo-icon/qatar-favicon.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="./css/style.css">
</head>

<body>

<!-- ================= COUNTRY LIST ================= -->
<datalist id="countrylist">
<%
String countriesFilePath = application.getRealPath("WEB-INF/data/countries.csv");
try (Scanner scanner = new Scanner(new File(countriesFilePath))) {
    int lineNo = 0;
    while (scanner.hasNextLine()) {
        String line = scanner.nextLine().trim();
        lineNo++;
        if (lineNo == 1) continue;
        String[] parts = line.split(",");
        if (parts.length >= 1) {
            String countryName = parts[0].trim();
            out.println("<option value=\"" + countryName + "\">");
        }
    }
} catch (FileNotFoundException e) {
    e.printStackTrace();
}
%>
</datalist>

<div class="container-fluid p-0">

<!-- ================= MODAL ================= -->
<div class="modal fade" id="myModal" tabindex="-1">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title">Signup Message</h5>
<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
</div>
<div class="modal-body">
<p id="errorMsg"></p>
</div>
</div>
</div>
</div>

<section id="signup">
<div class="container-fluid">
<div class="row p-0">
<div class="col-12 d-flex flex-column justify-content-center align-items-center">

<div class="row">
<div class="col-12">
<h1 class="py-3 display-3 fw-bold text-white word font1">SIGN UP</h1>
</div>
</div>

<div class="row p-2 p-md-3">
<div class="col-12 card p-4 font7">

<!-- 🔥 CHANGED TO POST -->
<form class="text-white px-md-2" action="SignupServlet" method="post">

<div class="row">
<div class="col-12 col-md-6 d-flex flex-column">
<label class="form-label">First Name :-</label>
<input type="text" class="inputdesign" name="Firstname" required>
</div>

<div class="col-12 col-md-6 pt-3 pt-md-0 d-flex flex-column">
<label class="form-label">Last Name :-</label>
<input type="text" class="inputdesign" name="Lastname" required>
</div>
</div>

<div class="row py-3">
<div class="col-12 col-md-6 d-flex flex-column">
<label class="form-label">Date of birth :-</label>
<input type="date" class="inputdesign" name="Birthdate" required>
</div>

<div class="col-12 col-md-6 pt-3 pt-md-0 d-flex flex-column">
<label class="form-label">Gender</label>
<div class="d-flex justify-content-between">
<div>
<input type="radio" name="Gender" value="male"> Male
</div>
<div>
<input type="radio" name="Gender" value="female"> Female
</div>
<div>
<input type="radio" name="Gender" value="transgender"> Transgender
</div>
</div>
</div>
</div>

<div class="row py-2">
<div class="col-12 col-md-6 d-flex flex-column">
<label class="form-label">Country :-</label>
<input list="countrylist" class="inputdesign" name="Countryname" required>
</div>

<div class="col-12 col-md-6 pt-3 pt-md-0 d-flex flex-column">
<label class="form-label">City :-</label>
<input type="text" class="inputdesign" name="Cityname" required>
</div>
</div>

<div class="row py-3">
<div class="col-12 d-flex flex-column">
<label class="form-label">Email :-</label>
<input type="email" class="inputdesign" name="Email" required>
</div>
</div>

<div class="row py-3">
<div class="col-12 col-md-6 d-flex flex-column">
<label>Password :-</label>
<input type="password" class="inputdesign" id="Password" name="Pass" required>
</div>

<div class="col-12 col-md-6 d-flex flex-column">
<label>Confirm Password :-</label>
<input type="password" class="inputdesign" id="confirmPassword" required>
<span id="passwordError" class="text-danger"></span>
</div>
</div>

<div class="row py-3 d-flex flex-row align-items-end">
<div class="col-12 col-md-6">
<label class="form-label">Phone Number :-</label>
<input type="text" class="inputdesign" id="phone" name="phone" required>
</div>

<div class="col-12 col-md-6 text-center">
<!-- 🔥 type=button -->
<button type="button" class="btn btn-primary" id="getOTP">Get OTP</button>
</div>
</div>

<div class="row py-3">
<div class="col-12 d-flex flex-column">
<label class="form-label">Enter OTP :-</label>
<input type="text" class="inputdesign" name="otp" required>
</div>
</div>

<div class="row">
<div class="col-12 d-flex justify-content-center">
<button class="btn btn-primary" type="submit" name="action" value="validateOtp">
Submit
</button>
</div>
</div>

</form>

</div>
</div>
</div>
</div>
</div>
</section>
</div>

<!-- ================= PASSWORD CHECK ================= -->
<script>
document.getElementById("confirmPassword").addEventListener("input", function() {
var pass = document.getElementById("Password").value;
var confirm = this.value;
var error = document.getElementById("passwordError");

if (confirm !== pass) {
error.innerText = "Passwords do not match.";
} else {
error.innerText = "";
}
});
</script>

<!-- ================= OTP AJAX ================= -->
<script>
document.getElementById("getOTP").addEventListener("click", function() {

var phone = document.getElementById("phone").value;

fetch("SignupServlet?action=getOtp&phone=" + phone)
.then(response => response.json())
.then(data => {

var modalBody = document.getElementById("errorMsg");

if (data.success) {
modalBody.innerHTML = "Your OTP is: <strong>" + data.otp + "</strong>";
modalBody.classList.remove("text-danger");
modalBody.classList.add("text-success");
} else {
modalBody.innerHTML = "Failed to generate OTP";
modalBody.classList.remove("text-success");
modalBody.classList.add("text-danger");
}

var myModal = new bootstrap.Modal(document.getElementById('myModal'));
myModal.show();
});
});
</script>

<!-- ================= SESSION MESSAGE ================= -->
<%
if (session.getAttribute("msg") != null) {
%>
<script>
var modalBody = document.getElementById("errorMsg");
modalBody.innerHTML = "<%= session.getAttribute("msg") %>";
var myModal = new bootstrap.Modal(document.getElementById('myModal'));
myModal.show();
</script>
<%
session.removeAttribute("msg");
}
%>

</body>
</html>