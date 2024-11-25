<?php


    include('connect.php');

    $menuname = $_POST['menuname'];
    $menuprice = $_POST['menuprice'];
    $shopid = $_POST['shopid'];
   

    if($menuname==""&& $menuprice==""&& $shopid =="")
     {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
        exit();
    }
    
    else
    {
        $sql = "INSERT INTO menuitem (menuname, menuprice, shopid) VALUES ('$menuname', '$menuprice','$shopid')";
        mysqli_query($con,$sql);
        mysqli_close($con);
    }
    

 

?>