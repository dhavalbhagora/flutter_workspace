<?php


    include('connect.php');

    $id=$_POST["id"];
    
    $sql = "delete from products where id='$id'";
    mysqli_query($con,$sql);
    





?>