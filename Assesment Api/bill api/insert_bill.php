<?php


    include('connect.php');

    $name = $_POST['name'];
    $amount = $_POST['amount'];
    $date = $_POST['date'];
    $time = $_POST['time'];
    $status = $_POST['status'];

    if($name==""&& $address=="" && $contact=="")
     {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
        exit();
    }
    
    else
    {
        $sql = "INSERT INTO bill (name, amount, date,time,status) VALUES ('$name', ' $amount', '$date','$time','$status')";
        mysqli_query($con,$sql);
        mysqli_close($con);
    }
    
    ?>