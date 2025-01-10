<?php

include('connect.php'); // Ensure this file contains a secure connection to the database

// Fetch input from the POST request
$identifier = $_POST['identifier']; // Can be email or phone number
$password = $_POST['password']; // User's password
$response = array();

if (empty($identifier) || empty($password)) {
    echo json_encode([
        "status" => "error",
        "message" => "Both identifier (email/phone) and password are required"
    ]);
    exit();
}

// Prepare the SQL query to prevent SQL injection
$sql = "SELECT * FROM users WHERE email = ? OR number = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("ss", $identifier, $identifier);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();

    // Verify the password
    if (password_verify($password, $row['password'])) {
        // Remove sensitive data (password) from the response
        unset($row['password']);

        $response["status"] = "success";
        $response["message"] = "Login successful";
        $response["user"] = $row;
    } else {
        $response["status"] = "error";
        $response["message"] = "Invalid password";
    }
} else {
    $response["status"] = "error";
    $response["message"] = "User not found";
}

// Return the response as JSON
echo json_encode($response);

?>
