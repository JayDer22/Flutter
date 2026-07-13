<?php
include 'connect.php';

$id = $_POST['id'];
$pname = $_POST['product_name'];
$pprice = $_POST['product_price'];
$pdes = $_POST['product_des'];
$pfeaturs = $_POST['product_featurs'];
$pimage = $_POST['product_image'];

$upload_path = 'images/';

$upload_url = 'https://' . $_SERVER['SERVER_NAME'] . "/jay/" . $upload_path;


    $fileinfo = pathinfo($_FILES["product_image"]["name"]);
    $extension = $fileinfo["extension"];

    $random = 'image_' . rand(1000, 9999);

    $file_url = $upload_url . $random . '.' . $extension;

    $file_path = $upload_path . $random . '.' . $extension;

    move_uploaded_file($_FILES["product_image"]["tmp_name"], $file_path);
    $pimage = $file_url;
    


$sql = "UPDATE product_info SET
product_name='$pname',
product_price='$pprice',
product_des='$pdes',
product_featurs='$pfeaturs',
product_image='$pimage'
WHERE id='$id'";

if (mysqli_query($con, $sql))
{
    echo "1";
}
else
{
    echo mysqli_error($con);
}

mysqli_close($con);

?>
