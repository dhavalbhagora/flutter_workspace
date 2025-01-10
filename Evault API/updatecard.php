<?php
include('connect.php'); // Include your database connection file

// Gather user input (POST data)
$card_id = $_POST["CardID"];
$card_number = $_POST["CardNumber"];
$card_holder_name = $_POST["CardHolderName"];
$expiry_date = $_POST["ExpiryDate"];
$cvv = $_POST["CVV"];
$notes = $_POST["Notes"] ?? null; // Optional field

// Check if CardID is provided
if ($card_id == "") {
    echo '0'; // Missing required CardID
} else {
    // Prepare the update query
    $sql = "UPDATE cards 
            SET CardNumber = '$card_number', 
                CardHolderName = '$card_holder_name', 
                ExpiryDate = '$expiry_date', 
                CVV = '$cvv', 
                Notes = '$notes' 
            WHERE CardID = '$card_id'";

    // Execute the query
    if (mysqli_query($con, $sql)) {
        echo "Card updated successfully.";
    } else {
        echo "Error updating card: " . mysqli_error($con);
    }
}

// Close the database connection
mysqli_close($con);
?>
