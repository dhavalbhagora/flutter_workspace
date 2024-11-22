<?php


    include('connect.php');

    $id=$_POST["id"];
    $status=$_POST["Status"];

    if($id=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update bill set Status='$status' where id='$id'";
        mysqli_query($con,$sql);
    }





?>