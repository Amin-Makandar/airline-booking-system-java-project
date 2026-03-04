<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your Seat </title>
    <link rel="icon" type="image/x-icon" href="./Images/Logo-icon/qatar-favicon.png">
	<link rel="stylesheet" href="./css/style1.css">
 
</head>
<body>

<%  

	String numberofpassenger = (String) session.getAttribute("numberofpassenger");
	
	
	
	
 %>
 	
 	<div class="heading">
 		<h2>Select Your Seat</h2>
 	</div>
    
    <ul class="showcase">
        <li>
        <div class="seat"></div>
        <small>Available</small>
      </li>
      <li>
        <div class="seat selected"></div>
        <small>Selected</small>
      </li>
      <li>
        <div class="seat occupied"></div>
        <small>Booked</small>
      </li>
      
      <li>
        <div class="seat window"></div>
        <small>Window</small>
      </li>
    </ul>
	<div> <p>Number of Passenger :<%= numberofpassenger %> </p> </div>
    <div class="selected-seats">
        <h3>Selected Seats:</h3>
        <p id="selected-seats-list" >
        </p>
    </div>
	
    
    
    <div class="rows">
        <% 
            char[] rowLabels = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'};
            for (int i = 0; i < rowLabels.length; i++) {
        %>
            <div class="row">
                <% 
                    for (int j = 1; j <= 8; j++) {
                        String seatLabel = rowLabels[i] + String.valueOf(j);
                        
                        String seatClass = "";

                        // Check if it's a window seat
                        if (j == 1 || j == 8) {
                            seatClass = "window";
                        }
                        
                %>
                    <div class="seat  <%= seatClass %>"  id="<%= seatLabel %>">
                        <span class="seat-label"><%= seatLabel %></span>
                    </div>
                <% 
                    }
                %>
            </div>
        <% 
            }
        %>
    </div>
    
    <div>
	    <form  action="bookSeats" method="post">
	    <input type="hidden" id="selected-seats-input" name="selectedSeats">
	    <button type="submit" class="paybutton">Process To Payment</button>
		</form>
    </div>
   


			
    
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        const seats = document.querySelectorAll('.seat:not(.occupied)');
        const selectedSeats = [];
        let numberOfPassengers = parseInt('<%= numberofpassenger %>'); // Assuming numberOfPassengers is a JSP variable

        function getRandomSeats(numSeats, maxIndex) {
            const selectedIndices = [];
            while (selectedIndices.length < numSeats) {
                const randomIndex = Math.floor(Math.random() * maxIndex);
                if (!selectedIndices.includes(randomIndex)) {
                    selectedIndices.push(randomIndex);
                }
            }
            return selectedIndices.map(index => seats[index].id);
        }

        function updateSelectedSeats() {
            const selectedSeatsList = document.getElementById('selected-seats-list');
            selectedSeatsList.innerHTML = selectedSeats.join(', ');

            document.getElementById('selected-seats-input').value = selectedSeats.join(',');
            console.log(selectedSeats.join(','));
        }

        function checkSelectedSeats() {
            return selectedSeats.length < numberOfPassengers;
        }

        function handleSubmit(event) {
            if (selectedSeats.length < numberOfPassengers) {
                event.preventDefault(); // Prevent form submission
                alert('Please select ' + (numberOfPassengers - selectedSeats.length) + ' more seat(s).');
            } else {
                // Continue with form submission
            }
        }

        // Seat click event
        seats.forEach(seat => {
            seat.addEventListener('click', function() {
                const seatId = seat.id;

                if (randomBookedSeats.includes(seatId)) {
                    alert('This seat is already booked!');
                    return;
                }

                if (selectedSeats.includes(seatId)) {
                    const index = selectedSeats.indexOf(seatId);
                    selectedSeats.splice(index, 1);
                    seat.classList.remove('selected');
                } else if (checkSelectedSeats()) {
                    selectedSeats.push(seatId);
                    seat.classList.add('selected');
                } else {
                    alert('You can only select up to ' + numberOfPassengers + ' seats.');
                }
                updateSelectedSeats();
            });
        });

        // Get random booked seats
        const numRandomBookings = Math.floor(Math.random() * 30) + 1;
        const maxAvailableSeats = seats.length;
        const randomBookedSeats = getRandomSeats(numRandomBookings, maxAvailableSeats);

        // Mark seats as booked
        randomBookedSeats.forEach(seatId => {
            const seat = document.getElementById(seatId);
            if (seat) {
                seat.classList.add('occupied');
            }
        });

        // Add submit event to the form
        const bookForm = document.getElementById('bookForm');
        bookForm.addEventListener('submit', handleSubmit);

        // Initial update
        updateSelectedSeats();
    });

</script>
    
    
    
    
			
	
    
    
</body>
</html>
