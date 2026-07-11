<?php
  include('connect.php');
  $sql = "select * from product_info";
  
  $row = mysqli_query($con,$sql);
  $response=array();
  while($data = mysqli_fetch_array($row))
  {
    $value["id"]= $data["id"];
    $value["product_name"]= $data["product_name"];
    $value["product_price"]= $data["product_price"];
    $value["product_des"]= $data["product_des"];
    $value["product_featurs"]= $data["product_featurs"];
    $value["product_image"]= $data["product_image"];

     array_push($response,$value);
  }
 
  echo json_encode($response);

?>
