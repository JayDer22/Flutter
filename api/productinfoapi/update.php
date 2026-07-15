<?php

include('connect.php');

$upload_path = "images/";
$upload_url = "https://".$_SERVER['SERVER_NAME']."/jay/".$upload_path;

$id = $_POST['id'];
$pname = $_POST['product_name'];
$pprice = $_POST['product_price'];
$pdes = $_POST['product_des'];
$pfeaturs = $_POST['product_featurs'];


if($id=="" || $pname=="" || $pprice=="" || $pdes=="" || $pfeaturs=="")
{
    echo "0";
}
else
{
    if(isset($_FILES["product_image"]) && $_FILES["product_image"]["name"] != "")
    {
        $fileinfo = pathinfo($_FILES["product_image"]["name"]);
        $extension = $fileinfo["extension"];

        $filename = "product_".rand(1000,9999).".".$extension;

        $file_path = $upload_path.$filename;
        $file_url = $upload_url.$filename;

        move_uploaded_file($_FILES["product_image"]["tmp_name"], $file_path);

        $sql = "UPDATE product_info SET
         product_name='$pname',
         product_price='$pprice',
         product_des='$pdes',
         product_featurs='$pfeaturs',
         product_image='$file_url'
         WHERE id='$id'";

    }
    else
    {
       $sql = "UPDATE product_info SET
         product_name='$pname',
         product_price='$pprice',
         product_des='$pdes',
         product_featurs='$pfeaturs'
         WHERE id='$id'";
    }

    if(mysqli_query($con, $sql))
    {
        echo "1";
    }
    else
    {
        echo "0";
    }
}

mysqli_close($con);

?>
