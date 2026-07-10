<?php
    include('connect.php');

    $pname = $_POST["product_name"];
    $pprice = $_POST["product_price"];
    $pdes = $_POST["product_des"];
    $pfeaturs = $_POST["product_featurs"];

    if($pname==""&& $pprice==""&& $pdes==""&& $pfeaturs=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into product_info (product_name,product_price,product_des,product_featurs) values ('$pname','$pprice','$pdes','$pfeaturs')";
        mysqli_query($con,$sql);
    }
    
?>