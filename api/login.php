<?php

    include('connect.php');
    
    $email = $_POST['email'] ;
    $pass = $_POST['password'] ;
    $response = array();
    
    $sql = "SELECT * FROM shoplist WHERE email = '$email' AND password = '$pass'";
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