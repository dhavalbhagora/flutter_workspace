<?php
include('connect.php'); // Include your database connection file

// Gather inputs
$CardID = $_POST["CardID"];
$SecurityPin = $_POST["SecurityPin"];

// Check if inputs are provided
if ($CardID == "" || $SecurityPin == "") {
    echo json_encode(["status" => "error", "message" => "CardID and SecurityPin are required"]);
} else {
    // Verify if the SecurityPin matches for the provided CardID
    $pin_check_query = "SELECT * FROM `cards` WHERE `CardID` = '$CardID' AND `SecurityPin` = '$SecurityPin'";
    $result = mysqli_query($con, $pin_check_query);

    if (mysqli_num_rows($result) > 0) {
        // If the SecurityPin is valid, delete the card
        $delete_query = "DELETE FROM `cards` WHERE `CardID` = '$CardID'";
        if (mysqli_query($con, $delete_query)) {
            echo json_encode(["status" => "success", "message" => "Card deleted successfully"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Failed to delete the card"]);
        }
    } else {
        // If the SecurityPin is invalid
        echo json_encode(["status" => "error", "message" => "Invalid SecurityPin"]);
    }
}

// Close the database connection
mysqli_close($con);
?>
