<?php

    include('connect.php');
    
    $sql ="select * from prodcut";
    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
      $value["id"]=$row["id"];
        $value["product_name"]=$row["product_name"];
        $value["product_price"]=$row["product_price"];
          $value["product_description"]=$row["product_description"];
    
        
    
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>