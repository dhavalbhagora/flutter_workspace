<?php

    include('connect.php');
    
    $sql ="select * from singup";
    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $gender = $_POST['gender'];
        $city = $_POST['city'];
        
    
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>