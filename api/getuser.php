<?php

    include('connect.php');
    $shopid = $_POST['shopid'] ;
    $sql ="select * from customer WHERE shopid ='$shopid'";
    $r=mysqli_query($con,$sql);
    $response = array();
    
    
    while($row = mysqli_fetch_array($r))
    {
        $value["id"]=$row["id"];
        $value["contact"]=$row["contact"];
        $value["name"]=$row["name"];
        $value["address"]=$row["address"];
        $value["shopid"]=$row["shopid"];
         
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>