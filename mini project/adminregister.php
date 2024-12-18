<?php


    include('connect.php');

    $adminname = $_POST['adminname'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $shopname = $_POST['shopname'];
    $pass = $_POST['pass'];
    $contact = $_POST['shopcon'];
    if($adminname==""&& $email=="" && $shopname=="" && $pass == "" && $address== "" && $contact = "")
     {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
        exit();
    }
    
    else
    {
        $sql = "INSERT INTO adminlist (adminname, email, shopname, pass ,address,shopcon) VALUES ('$adminname', '$email', '$shopname' , '$pass','$address','$contact')";
        mysqli_query($con,$sql);
        mysqli_close($con);
    }
    
    ?>