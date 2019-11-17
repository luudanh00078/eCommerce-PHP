<?php
  class shopmax {
      var $id;
      var $name;
      var $description;
      var $content;
      var $price;
      var $saleoff;
      var $thumbnail;
      var $category_id;
      var $status;
      function __construct($id, $name, $description, $content, $price, $saleoff, $thumbnai, $category_id, $status )
      {
        $this->id = $id;
        $this->name = $name;
        $this->description = $description;
        $this->content = $content;
        $this->price = $price;
        $this->saleoff = $saleoff;
        $this->thumbnail = $thumbnai;
        $this->category_id= $category_id;
        $this->status = $status;
      }
      static function connect(){
        $conn = new mysqli('localhost', 'user_hoang', '12345', 'shop');
        $conn->set_charset("utf8");
        if($conn->connect_error){
            die('kết nối thất bại' . $conn->connect_error);
        }else{
            echo 'kết nối thành công';
            }
      }
      static function getListFromDb($category_id){
        //ketnoi db
        $conn = new mysqli('localhost', 'user_hoang', '12345', 'shop');
        $conn->set_charset("utf8");
        if($conn->connect_error){
            die('kết nối thất bại' . $conn->connect_error);
        }else{
            //echo 'kết nối thành công';
            }
        $query = "SELECT * FROM products WHERE category_id = '$category_id'";
        $result = $conn->query($query);
        $rs = array();
        if($result->num_rows>0){
            while($row = $result->fetch_assoc()){
              array_push($rs, new shopmax(
                  $row["id"],
                  $row["name"],
                  $row["description"],
                  $row["content"],
                  $row["price"],
                  $row["saleoff"],
                  $row["thumbnail"],
                  $row["category_id"],
                  $row["status"]
              ));
            }
        }
        $conn->close();
        return $rs;
      }
      static function getListById($id){
           //ketnoi db
        $conn = new mysqli('localhost', 'user_hoang', '12345', 'shop');
        $conn->set_charset("utf8");
        if($conn->connect_error){
            die('kết nối thất bại' . $conn->connect_error);
        }else{
            //echo 'kết nối thành công';
            }
        $query = "SELECT * FROM products WHERE id = '$id'";
        $result = $conn->query($query);
        $rs = $result->fetch_row();
        return $rs;
        
        }
        static function getListRandom(){
            //ketnoi db
            $conn = new mysqli('localhost', 'user_hoang', '12345', 'shop');
            $conn->set_charset("utf8");
            if($conn->connect_error){
                die('kết nối thất bại' . $conn->connect_error);
            }else{
                //echo 'kết nối thành công';
                }
            $query = "SELECT * FROM products ORDER BY RAND() LIMIT 10";
            $result = $conn->query($query);
            $rs = array();
            if($result->num_rows>0){
                while($row = $result->fetch_assoc()){
                  array_push($rs, new shopmax(
                      $row["id"],
                      $row["name"],
                      $row["description"],
                      $row["content"],
                      $row["price"],
                      $row["saleoff"],
                      $row["thumbnail"],
                      $row["category_id"],
                      $row["status"]
                  ));
                }
            }
            $conn->close();
            return $rs;
          }
          static function insert_orders($fullname, $email, $phone, $address){
            //ketnoi db
            $conn = new mysqli('localhost', 'user_hoang', '12345', 'shop');
            $conn->set_charset("utf8");
            if($conn->connect_error){
                die('kết nối thất bại' . $conn->connect_error);
            }else{
                //echo 'kết nối thành công';
                }
            $query = "INSERT INTO orders (fullname, email, phone, address )
            VALUES ('$fullname', '$email', '$phone', '$address')";
            $result = $conn->query($query);
            // kiem tra, lay ve id vua duoc insert vao bang 
            if($result === TRUE){
                $order_id = $conn->insert_id;
            }
            
            $conn->close();
            return $order_id;
          }
          static function insert_order_product($product_id, $quantity, $price, $order_id){
            //ketnoi db
            $conn = new mysqli('localhost', 'user_hoang', '12345', 'shop');
            $conn->set_charset("utf8");
            if($conn->connect_error){
                die('kết nối thất bại' . $conn->connect_error);
            }else{
                //echo 'kết nối thành công';
                }
            $query = "INSERT INTO order_product (product_id, quantity, price, order_id )
            VALUES ('$product_id', '$quantity', '$price', '$order_id')";
            $result = $conn->query($query);
           
            $conn->close();
            return $result;
          }

  }
?>