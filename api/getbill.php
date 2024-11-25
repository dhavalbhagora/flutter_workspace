<?php

    include('connect.php');
    $shopid = $_POST['shopid'] ;
    $sql ="select * from bill WHERE shopid='$shopid'";
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
        $value["shopid"]=$row["shopid"];
         
         
        array_push($response,$value);
        
    }
    
    echo json_encode($response);
    mysqli_close($con);


?>