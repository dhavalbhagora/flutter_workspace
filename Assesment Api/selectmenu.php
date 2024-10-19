<?php

    include('connect.php');
    
    $sql ="select * from menuitem";
    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
      $value["id"]=$row["id"];
        $value["menuname"]=$row["menuname"];
        $value["menuprice"]=$row["menuprice"];
         
    
        
    
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>