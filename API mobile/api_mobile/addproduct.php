<?php


    include('connect.php');

    $product_name = $_POST['product_name'];
    $product_price = $_POST['product_price'];
    $product_description = $_POST['product_description'];
 

    if($product_name==""&& $product_price=="" && $product_description=="")
     {
        echo json_encode(["status" => "error", "message" => "All fields are required."]);
        exit();
    }
    
    else
    {
        $sql = "INSERT INTO products (product_name,product_price,product_description) VALUES ('$product_name', '$product_price', '$product_description')";
        mysqli_query($con,$sql);
        mysqli_close($con);
    }
    
?>