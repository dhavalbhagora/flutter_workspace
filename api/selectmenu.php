<?php

    include('connect.php');
    $shopid = $_POST['shopid'];
    $sql ="select * from menuitem WHERE  shopid='$shopid'";
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