<?php
include('connect.php'); // Include your database connection file

// Gather user input (POST data)
$user_id = $_POST['id']; // This is the foreign key (id of the user in the 'users' table)
$platform_name = $_POST['PlatformName'];
$username = $_POST['Username'];
$password = $_POST['Password'];  // Assuming the password is already encrypted
$notes = $_POST['Notes'] ?? null; // Optional field for any additional notes

// Validate the foreign key (user_id)
if (empty($user_id)) {
    echo "Error: Missing user ID.";
    exit();
}

// Insert query with foreign key (user_id)
$sql = "INSERT INTO SocialMediaAccounts (id, PlatformName, Username, Password, Notes) 
        VALUES ('$user_id', '$platform_name', '$username', '$password', '$notes')";

// Execute the query
if (mysqli_query($con, $sql)) {
    echo "New social media account added successfully.";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($con);
}

// Close the database connection
mysqli_close($con);
?>
