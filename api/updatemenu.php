<?php


    include('connect.php');

    $id=$_POST["id"];
    $menuname = $_POST["menuname"];
    $menuprice = $_POST["menuprice"];
    

    if($id=="" && $menuname=="" && $menuprice=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update menuitem set menuname='$menuname',menuprice='$menuprice' where id='$id'";
        mysqli_query($con,$sql);
    }





?>