<?php


    include('connect.php');

    $name = $_POST['name'];
    $contact = $_POST['contact'];
    $address = $_POST['address'];
    $shopid = $_POST['shopid'];
    if($name==""&& $address=="" && $contact=="" && $shopid == "")
     {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
        exit();
    }
    
    else
    {
        $sql = "INSERT INTO customer (name, contact, address, shopid) VALUES ('$name', '$contact', '$address' , '$shopid')";
        mysqli_query($con,$sql);
        mysqli_close($con);
    }
    
    ?>