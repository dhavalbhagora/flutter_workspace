<?php
include('connect.php'); // Include your database connection file

// Gather inputs
$id = $_POST['id'];

// Initialize response array
$response = array();

// Query to select all records matching the provided id
$sql = "SELECT `AccountID`, `PlatformName`, `Username` 
        FROM `SocialMediaAccounts` 
        WHERE `id` = '$id'";

$result = mysqli_query($con, $sql);

// Check if any records are found
if (mysqli_num_rows($result) > 0) {
    // Array to hold all matching records
    $records = [];

    // Fetch all matching records
    while ($row = mysqli_fetch_assoc($result)) {
        $records[] = [
            "AccountID" => $row["AccountID"],
            "PlatformName" => $row["PlatformName"],
            "Username" => $row["Username"]
        ];
    }

    // Success response with all records
    $response = [
        "status" => "success",
        "data" => $records
    ];
} else {
    // If no records are found, return an error response
    $response = ["status" => "error", "message" => "No records found for the provided ID"];
}

// Send the response as JSON
echo json_encode($response);

// Close the database connection
mysqli_close($con);
?>
