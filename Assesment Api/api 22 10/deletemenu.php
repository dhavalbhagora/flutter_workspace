<?php


    include('connect.php');

    $id=$_POST["id"];
  

    if($id=="")
    {
        echo '0';
    }
    else
    {
        $sql = "delete from menuitem where id='$id'";
        mysqli_query($con,$sql);
    }





?>