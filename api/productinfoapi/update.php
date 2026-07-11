<?php
    include('connect.php');

    $id = $_POST["id"];
    $pname = $_POST["product_name"];
    $pprice = $_POST["product_price"];
    $pdes = $_POST["product_des"];
    $pfeaturs = $_POST["product_featurs"];
    $pimage = $_POST["product_image"];

    if($id==""&& $pname==""&& $pprice==""&& $pdes==""&&$pfeaturs==""&& $pimag=="")
    {
        echo '0';
    }
    else
    {
        $sql = "update product_info set product_name='$pname',product_price='$pprice',product_des='$pdes',product_featurs='$pfeaturs',product_image='$pimage' where id='$id'";
        mysqli_query($con,$sql);
    }
    
?>
