<?php

    include('connect.php');
    
    $sql ="select * from bill";
    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
        $value["id"]=$row["id"];
        $value["amount"]=$row["amount"];
        $value["name"]=$row["name"];
        $value["date"]=$row["date"];
        $value["time"]=$row["time"];
        $value["status"]=$row["status"];
         
         
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>