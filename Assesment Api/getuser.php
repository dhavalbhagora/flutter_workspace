<?php

    include('connect.php');
    
    $sql ="select * from customer";
    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
        $value["id"]=$row["id"];
        $value["contact"]=$row["contact"];
        $value["name"]=$row["name"];
        $value["address"]=$row["address"];
         
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>