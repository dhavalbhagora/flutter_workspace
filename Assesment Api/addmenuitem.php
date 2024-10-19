<?php


    include('connect.php');

    $menuname = $_POST['menuname'];
    $menuprice = $_POST['menuprice'];
   

    if($menuname==""&& $menuprice=="")
     {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
        exit();
    }
    
    else
    {
        $sql = "INSERT INTO menuitem (menuname, menuprice) VALUES ('$menuname', '$menuprice')";
        mysqli_query($con,$sql);
        mysqli_close($con);
    }
    

    // if ($conn->query($sql) === TRUE) {
    //     echo json_encode(["status" => "success", "message" => "Data inserted successfully"]);
    // } else {
    //     echo json_encode(["status" => "error", "message" => "Error inserting data: " . $conn->error]);
    // }  

    // $conn->close();

