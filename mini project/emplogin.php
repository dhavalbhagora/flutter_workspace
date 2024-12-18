<?php

    include('connect.php');
    
    $email = $_POST['empemail'] ;
    $pass = $_POST['emppass'] ;
    $response = array();
    
    $sql = "SELECT * FROM emplist WHERE empemail = '$email' AND emppass = '$pass'";
    $result=mysqli_query($con,$sql);
    
    
  //   $num=;

    if(mysqli_num_rows($result) >0)
    {
        $row = mysqli_fetch_assoc($result);        
        array_push($response,$row);
        echo json_encode($response);
       // echo json_encode(['code'=>200]);
        
    }
    else
    {
        echo "0";
    }
   

?>