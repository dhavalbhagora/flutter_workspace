<?php


    include('connect.php');

    $id=$_POST["id"];
    $product_name = $_POST["product_name"];
    $product_description = $_POST["product_description"];
    $product_price = $_POST["product_price"];

    if($id=="" && $product_name=="" && $product_description=="" && $product_price=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update products set product_name='$product_name',product_description='$product_description',product_price='$product_price' where id='$id'";
        mysqli_query($con,$sql);
    }





?>