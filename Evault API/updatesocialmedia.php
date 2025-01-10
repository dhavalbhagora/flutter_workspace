<?php
include('connect.php'); // Include your database connection file

// Gather user input (POST data)
$account_id = $_POST['AccountID']; // The AccountID to identify the social media account
//$user_id = $_POST['id']; // The foreign key (id of the user in the 'users' table)
$platform_name = $_POST['PlatformName'];
$username = $_POST['Username'];
$password = $_POST['Password'];  // Assuming the password is already encrypted
$notes = $_POST['Notes'] ?? null; // Optional field for any additional notes

// Validate the input data
if (empty($account_id)) {
    echo "Error: Missing AccountID.";
    exit();
}

// Prepare the update query
$sql = "UPDATE SocialMediaAccounts 
        SET PlatformName = '$platform_name', 
            Username = '$username', 
            Password = '$password', 
            Notes = '$notes' 
        WHERE AccountID = '$account_id'";

// Execute the update query
if (mysqli_query($con, $sql)) {
    echo "Social media account updated successfully.";
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($con);
}

// Close the database connection
mysqli_close($con);
?>
