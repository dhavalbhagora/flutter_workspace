<?php
include('connect.php'); // Include your database connection file

// Gather inputs
$account_id = $_POST['AccountID'];
$security_pin = $_POST['SecurityPin'];

// Initialize response array
$response = array();

// Query to validate AccountID and SecurityPin
$sql = "SELECT `AccountID`, `id`, `PlatformName`, `Username`, `Password`, `Notes`, `CreatedAt` 
        FROM `SocialMediaAccounts` 
        WHERE `AccountID` = '$account_id' AND `SecurityPin` = '$security_pin'";

$result = mysqli_query($con, $sql);

// If a matching record is found
if ($row = mysqli_fetch_assoc($result)) {
    // Map the fetched data to the response array
    $response = [
        "status" => "success",
        "data" => [
            "AccountID" => $row["AccountID"],
            "id" => $row["id"],
            "PlatformName" => $row["PlatformName"],
            "Username" => $row["Username"],
            "Password" => $row["Password"],
            "Notes" => $row["Notes"],
            "CreatedAt" => $row["CreatedAt"]
        ]
    ];
} else {
    // If the AccountID or SecurityPin is invalid
    $response = ["status" => "error", "message" => "Invalid AccountID or Security Pin"];
}

// Send the response as JSON
echo json_encode($response);

// Close the database connection
mysqli_close($con);
?>
