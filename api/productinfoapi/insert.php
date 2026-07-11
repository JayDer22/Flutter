<?php
    include('connect.php');

    $pname = $_POST["product_name"];
    $pprice = $_POST["product_price"];
    $pdes = $_POST["product_des"];
    $pfeaturs = $_POST["product_featurs"];
    $pimage = $_POST["product_image"];
    

    if($pname==""&& $pprice==""&& $pdes==""&& $pfeaturs==""&& $pimage=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into product_info (product_name,product_price,product_des,product_featurs,product_image) values ('$pname','$pprice','$pdes','$pfeaturs','$pimage')";
        mysqli_query($con,$sql);
    }
    
?>
