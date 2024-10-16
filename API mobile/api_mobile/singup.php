<?php


    include('connect.php');

    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $gender = $_POST['gender'];
    $city = $_POST['city'];


    if($firstname==""&& $lastname=="" && $emaiil==""&&$password==""&& $gender=="" && $city=="")
     {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
        exit();
    }
    
    else
    {
        $sql = "INSERT INTO singup (firstname,lastname,email,password,gender,city) VALUES ('$firstname', '$lastname', '$email','$password','$gender','$city')";
        mysqli_query($con,$sql);
        mysqli_close($con);
    }
    
?>