<?php


    include('connect.php');

    $name = $_POST['name'];
    $contact = $_POST['contact'];
    $address = $_POST['address'];

    if($name==""&& $address=="" && $contact=="")
     {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
        exit();
    }
    
    else
    {
        $sql = "INSERT INTO customer (name, contact, address) VALUES ('$name', '$contact', '$address')";
        mysqli_query($con,$sql);
        mysqli_close($con);
    }
    

    // if ($conn->query($sql) === TRUE) {
    //     echo json_encode(["status" => "success", "message" => "Data inserted successfully"]);
    // } else {
    //     echo json_encode(["status" => "error", "message" => "Error inserting data: " . $conn->error]);
    // }  

    // $conn->close();


?>