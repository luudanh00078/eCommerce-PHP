<?php
session_start();
if(array_key_exists("id", $_GET) && $_GET["id"]){
    $product_id = $_GET["id"];
    
    unset($_SESSION["cart"][$product_id] );
    header('Location: cart.php');
}
?>