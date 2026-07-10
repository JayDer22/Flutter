<?php

include "connect.php";

$name = $_POST['name'];
$sname = $_POST['surname'];
$mob = $_POST['mobile'];
$em = $_POST['email'];
$gen = $_POST['gender'];
$password = $_POST['pass'];

if($name=="" || $sname=="" || $mob=="" || $em=="" || $gen=="" || $password="")
{
    echo "Please fill all fields.";
}
else
{
    $query = "insert into user_info(name,surname,mobile,email,gender,pass) 
              values('$name','$sname','$mob','$em ','$gen','$password')";
    mysqli_query($con,$query);
    echo "Data inserted successfully";
}
?>