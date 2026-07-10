<?php

include('connect.php');

$email = $_REQUEST["e1"];
$pass = $_REQUEST["p1"];

$sql = "SELECT * FROM user_info WHERE email='$email' AND pass='$pass'";

$result = mysqli_query($con, $sql);

if (!$result) {
    die("SQL Error: " . mysqli_error($con));
}

$num = mysqli_num_rows($result);

if ($num > 0) {
    echo json_encode(['code' => 200]);
} else {
    echo "0";
}
?>