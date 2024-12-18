<?php
$host = "localhost";
$user = "root"; // Default MySQL username
$password = ""; // Leave it empty if no password is set
$dbname = "accessories"; // Database name
   

$con = mysqli_connect($host,$user,$password,$dbname) or die('unable to connect');


?>