<?php


    include('connect.php');

    $shopname = $_POST["shopname"];
    $email = $_POST["email"];
    $pass = $_POST["password"];

    if($shopname=="" && $email=="" && $pass=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into shoplist(shopname,email,password) values ('$shopname','$email','$pass')";
        mysqli_query($con,$sql);

        echo "inserted succesfully";

    }





?>