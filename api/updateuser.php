<?php


    include('connect.php');

    $id=$_POST["id"];
    $contact = $_POST["contact"];
    $name = $_POST["name"];
    $address = $_POST["address"];

    if($id=="" && $product_name=="" && $product_description=="" && $product_price=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update customer set contact='$contact',name='$name',address='$address' where id='$id'";
        mysqli_query($con,$sql);
    }





?>