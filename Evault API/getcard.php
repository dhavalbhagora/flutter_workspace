<?php
include('connect.php'); // Include your database connection file

// Gather inputs
$card_id = $_POST['CardID'];
$security_pin = $_POST['SecurityPin'];

// Initialize response array
$response = array();

// Query to check if the CardID and SecurityPin match
$sql = "SELECT `CardID`, `id`, `CardNumber`, `CardHolderName`, `ExpiryDate`, `CVV`, `Notes`, `CreatedAt`, `SecurityPin` 
        FROM `cards` 
        WHERE `CardID` = '$card_id' AND `SecurityPin` = '$security_pin'";

$result = mysqli_query($con, $sql);

// If a matching record is found
if ($row = mysqli_fetch_assoc($result)) {
    // Map the fetched data to the response array
    $response = [
        "status" => "success",
        "data" => [
            "CardID" => $row["CardID"],
            "id" => $row["id"],
            "CardNumber" => $row["CardNumber"],
            "CardHolderName" => $row["CardHolderName"],
            "ExpiryDate" => $row["ExpiryDate"],
            "CVV" => $row["CVV"],
            "Notes" => $row["Notes"],
            "CreatedAt" => $row["CreatedAt"]
        ]
    ];
} else {
    // If the pin or CardID is invalid
    $response = ["status" => "error", "message" => "Invalid Security Pin"];
}

// Send the response as JSON
echo json_encode($response);

// Close the database connection
mysqli_close($con);
?>
