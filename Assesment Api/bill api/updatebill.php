<?php


    include('connect.php');

    $id=$_POST["id"];
  

    if($id=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update bill set Status='YES' where id='$id'";
        mysqli_query($con,$sql);
    }





?>