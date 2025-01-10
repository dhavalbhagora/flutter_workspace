<?php
include('connect.php'); // Include your database connection file

// Gather inputs
$AccountID = $_POST["AccountID"];
$SecurityPin = $_POST["SecurityPin"];

// Check if inputs are provided
if ($AccountID == "" || $SecurityPin == "") {
    echo json_encode(["status" => "error", "message" => "AccountID and SecurityPin are required"]);
} else {
    // Verify if the SecurityPin matches for the provided AccountID
    $pin_check_query = "SELECT * FROM `SocialMediaAccounts` WHERE `AccountID` = '$AccountID' AND `SecurityPin` = '$SecurityPin'";
    $result = mysqli_query($con, $pin_check_query);

    if (mysqli_num_rows($result) > 0) {
        // If the SecurityPin is valid, delete the account
        $delete_query = "DELETE FROM `SocialMediaAccounts` WHERE `AccountID` = '$AccountID'";
        if (mysqli_query($con, $delete_query)) {
            echo json_encode(["status" => "success", "message" => "Account deleted successfully"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Failed to delete the account"]);
        }
    } else {
        // If the SecurityPin is invalid
        echo json_encode(["status" => "error", "message" => "Invalid SecurityPin"]);
    }
}

// Close the database connection
mysqli_close($con);
?>
