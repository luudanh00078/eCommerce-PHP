<?php
session_start();
require_once("header.php");
include_once("../model/entity/shopmax.php");
//....coding 
//var_dump($_POST);
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $fullname = $_POST["fullname"];
        $email = $_POST["email"];
        $phone = $_POST["phone"];
        $address = $_POST["address"];
      $order_id = shopmax::insert_orders($fullname, $email, $phone, $address );
    foreach($_SESSION["cart"] as $item){
        $rsProId = shopmax::getListById($item["id"]);
            $product_id = $rsProId[0];
            $quantity = $item["quantity"];
            $price = ($rsProId[4] * $item['quantity']);
        shopmax::insert_order_product($product_id, $quantity, $price, $order_id );

    }
    $_SESSION["cart"] = null;
    header('Location: thankyou.php');
}

?>