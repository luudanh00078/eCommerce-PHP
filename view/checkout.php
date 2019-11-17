<?php
session_start();
include_once("header.php");
include_once("../model/entity/shopmax.php");
?>
    
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.php">Home</a> <span class="mx-2 mb-0">/</span> <a href="cart.html">Cart</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Checkout</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-12">
            <div class="border p-4 rounded" role="alert">
              Returning customer? <a href="#">Click here</a> to login
            </div>
          </div>
        </div>
        <div class="row">
        <div class="col-md-6">
 <!-- up code sale -->
<!-- <div class="row mb-5">
  <div class="col-md-12">
    <h2 class="h3 mb-3 text-black">Coupon Code</h2>
    <div class="p-3 p-lg-5 border">
      
      <label for="c_code" class="text-black mb-3">Enter your coupon code if you have one</label>
      <div class="input-group w-75">
        <input type="text" class="form-control" id="c_code" placeholder="Coupon Code" aria-label="Coupon Code" aria-describedby="button-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary btn-sm px-4" type="button" id="button-addon2">Apply</button>
        </div>
      </div>

    </div>
  </div>
</div> -->

<div class="row mb-5">
  <div class="col-md-12">
    <h2 class="h3 mb-3 text-black">Your Order</h2>
    <div class="p-3 p-lg-5 border">
   
      <table class="table site-block-order-table mb-5">
        <thead>
          <th>Product</th>
          <th>Total</th>
        </thead>
       
        <tbody>
        <?php
        foreach($_SESSION["cart"] as $item){
          $rsProId = shopmax::getListById($item["id"]);
        
          
        ?>
          <tr>
            <td><?php echo $rsProId[1];?> <strong class="mx-2">x</strong><?php echo $item["quantity"] ?> </td>
            <td><?php echo number_format(($rsProId[4] * $item['quantity']),0,',','.'); ?></td>
          </tr>
          
          <?php 
             $total += ($rsProId[4] * $item['quantity']);
           } ?>
          <tr>
            <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
            <td class="text-black"><?php echo number_format($total,0,',','.'); ?></td>
          </tr>
          <tr>
            <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
            <td class="text-black font-weight-bold"><strong><?php echo number_format($total,0,',','.'); ?></strong></td>
          </tr>
        </tbody>
        
      </table>

      <div class="border p-3 mb-3">
        <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsebank" role="button" aria-expanded="false" aria-controls="collapsebank">Direct Bank Transfer</a></h3>

        <div class="collapse" id="collapsebank">
          <div class="py-2">
            <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
          </div>
        </div>
      </div>

      <div class="border p-3 mb-3">
        <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsecheque" role="button" aria-expanded="false" aria-controls="collapsecheque">Cheque Payment</a></h3>

        <div class="collapse" id="collapsecheque">
          <div class="py-2">
            <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
          </div>
        </div>
      </div>

      <div class="border p-3 mb-5">
        <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsepaypal" role="button" aria-expanded="false" aria-controls="collapsepaypal">Paypal</a></h3>

        <div class="collapse" id="collapsepaypal">
          <div class="py-2">
            <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</div>
          <div class="col-md-6 mb-5 mb-md-0">
            <h2 class="h3 mb-3 text-black">Billing Details</h2>
            <div class="p-3 p-lg-5 border">
            <form action="checkinfo.php" method="POST">
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_companyname" class="text-black">FullName </label>
                  <input type="text" class="form-control"  name="fullname" required>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_companyname" class="text-black">Email </label>
                  <input type="text" class="form-control"  name="email" required>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_companyname" class="text-black">Phone </label>
                  <input type="text" class="form-control"  name="phone" required>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="c_companyname" class="text-black">Address </label>
                  <input type="text" class="form-control"  name="address" required>
                </div>
              </div>

              <div class="form-group">
                <label for="c_create_account" class="text-black" data-toggle="collapse" href="#create_an_account" role="button" aria-expanded="false" aria-controls="create_an_account"><input type="checkbox" value="1" id="c_create_account"> Create an account?</label>
                <div class="collapse" id="create_an_account">
                  <div class="py-2">
                    <p class="mb-3">Create an account by entering the information below. If you are a returning customer please login at the top of the page.</p>
                    <div class="form-group">
                      <label for="c_account_password" class="text-black">Account Password</label>
                      <input type="email" class="form-control" id="c_account_password" name="c_account_password" placeholder="">
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group">
                <label for="c_order_notes" class="text-black">Order Notes</label>
                <textarea name="c_order_notes" id="c_order_notes" cols="30" rows="5" class="form-control" placeholder="Write your notes here..."></textarea>
              </div>

              <div class="form-group">
                <button class="btn btn-primary btn-lg btn-block" type="submit">Place Order</button>
              </div>
              </form>
            </div>
          </div>
          
        </div>
        <!-- </form> -->
      </div>
    </div>

   <?php
   include_once("footer.php");
   ?>