<?php


    include('connect.php');

    
    $aid =$_POST['aid'];
    $address = $_POST['shopaddress'];
    $shopname = $_POST['shopname'];
    $contact = $_POST['shopcon'];
    $empname = $_POST['empname'];
    $empemail = $_POST['empemail'];
    $empcon = $_POST['empcon'];
    $emppass = $_POST['emppass'];

    if($aid==""&& $address=="" && $shopname=="" && $contact == "" && $empname== "" && $empemail==""&& $empcon=="" && $emppass=="")
    {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
        exit();
    }
    
    else
    {
        $sql = "INSERT INTO emplist (aid, shopaddress, shopname, shopcon ,empname,empemail,empcon,emppass) VALUES ('$aid', '$address', '$shopname' ,'$contact','$empname','$empemail','$empcon','$emppass')";
        mysqli_query($con,$sql);
        mysqli_close($con);
    }
    
    ?>