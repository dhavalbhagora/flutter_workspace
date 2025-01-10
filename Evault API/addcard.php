<?php
include('connect.php'); // Include your database connection file

// Gather user input
$id = $_POST['id'];
$card_number = $_POST['CardNumber'];
$card_holder_name = $_POST['CardHolderName'];
$expiry_date = $_POST['ExpiryDate'];
$cvv = $_POST['CVV'];
$notes = $_POST['Notes'] ?? null; // Optional field

// Insert query
$sql = "INSERT INTO cards (id, CardNumber, CardHolderName, ExpiryDate, CVV, Notes) 
        VALUES ('$id', '$card_number', '$card_holder_name', '$expiry_date', '$cvv', '$notes')";

// Execute the query
if ($con->query($sql) === TRUE) {
    echo "New card added successfully.";
} else {
    echo "Error: " . $sql . "<br>" . $con->error;
}

// Close the database connection
$con->close();
?>
