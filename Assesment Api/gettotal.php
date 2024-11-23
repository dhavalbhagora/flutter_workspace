<?php

    include('connect.php');
    
    $sql ="SELECT SUM(amount) AS total_sum
FROM bill";

    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
        
        $value["total_sum"]=$row["total_sum"];
        
         
         
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>