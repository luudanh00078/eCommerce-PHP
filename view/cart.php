<?php
session_start();
include_once("header.php");
include_once("../model/entity/shopmax.php");

if(array_key_exists("id", $_GET) && $_GET["id"]){
   $product_id = $_GET["id"];
   $quantity = 1;
   if(array_key_exists("quantity", $_GET)){
     $quantity = $_GET["quantity"];
   }
   if(array_key_exists("cart", $_SESSION)){
      if(array_key_exists($product_id, $_SESSION["cart"])){
        $_SESSION["cart"][$product_id]["quantity"] += $quantity;
      }
      else{
        $_SESSION["cart"][$product_id] = array(
          "id" => $product_id,
          "quantity" => $quantity,
        );
      }

   }
   else{
     $_SESSION["cart"][$product_id] = array(
       "id" => $product_id,
       "quantity" => $quantity,
     );
   }
}
// var_dump($_SESSION["cart"]);
// die();

?>
    
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <form class="col-md-12" method="post">
            <div class="site-blocks-table">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="product-thumbnail">Image</th>
                    <th class="product-name">Product</th>
                    <th class="product-price">Price</th>
                    <th class="product-quantity">Quantity</th>
                    <th class="product-total">Total</th>
                    <th class="product-remove">Remove</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                     foreach($_SESSION["cart"] as $item){
                      //  var_dump($item);
                      //  die();
                      $rsProId = shopmax::getListById($item["id"]);
                      //var_dump($rsProId);
                        
                  ?>
                  <tr>
                    <td class="product-thumbnail">
                      <img src="<?php echo $rsProId[6]; ?>" alt="Image" class="img-fluid">
                    </td>
                    <td class="product-name">
                      <h2 class="h5 text-black"><?php echo $rsProId[1]; ?></h2>
                    </td>
                    <?php $current_price = number_format($rsProId[4],0,',','.');?>
                    <td><?php echo $current_price ; ?></td>
                    <td>
                      <div class="input-group mb-3" style="max-width: 120px;">
                        <div class="input-group-prepend">
                          <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
                        </div>
                        <input type="text" class="form-control text-center" value="<?php echo $item['quantity']; ?>" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
                        <div class="input-group-append">
                          <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                        </div>
                      </div>

                    </td>
                    
                    <td><?php echo number_format(($rsProId[4] * $item['quantity']),0,',','.'); ?></td>
                    <td><a href="delete-cart.php?id=<?php echo $item["id"]; ?>" class="btn btn-primary height-auto btn-sm">X</a></td>
                  </tr>
                <?php  
                  $total += ($rsProId[4] * $item['quantity']);
                 }?>
                 
                </tbody>
              </table>
            </div>
          </form>
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6 mb-3 mb-md-0">
                <button class="btn btn-primary btn-sm btn-block">Update Cart</button>
              </div>
              <div class="col-md-6">
                <button class="btn btn-outline-primary btn-sm btn-block">Continue Shopping</button>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <label class="text-black h4" for="coupon">Coupon</label>
                <p>Enter your coupon code if you have one.</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
              </div>
              <div class="col-md-4">
                <button class="btn btn-primary btn-sm px-4">Apply Coupon</button>
              </div>
            </div>
          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">Subtotal</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black"><?php echo number_format($total,0,',','.'); ?></strong>
                  </div>
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">Total</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black"><?php echo number_format($total,0,',','.'); ?></strong>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-12">
                    <button class="btn btn-primary btn-lg btn-block" onclick="window.location='checkout.php'">Proceed To Checkout</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

   <?php
   include_once("footer.php");
   ?>