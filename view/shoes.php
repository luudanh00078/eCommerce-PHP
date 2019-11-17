<?php
include_once("header.php");
include_once("../model/entity/shopmax.php");
$rsDB = shopmax::getListFromDb(1);
// var_dump($rsDB);
// die();
?>
 <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="title-section mb-5 col-12">
            <h2 class="text-uppercase">SHOES COLECTION</h2>
          </div>
        </div>
      
        <div class="row">
        <?php foreach($rsDB as $value){ 
            //  var_dump($value);
            // die();
            ?>
          <div class="col-lg-4 col-md-6 item-entry mb-4">
            <a href="shop-single.php?id=<?php echo $value->id;?>" class="product-item md-height bg-gray d-block">
              <img src="<?php echo $value->thumbnail; ?>" alt="Image" class="img-fluid">
            </a>
            <h2 class="item-title"><a href="#"><?php echo $value->name;?></a></h2>
            <strong class="item-price"><?php echo $value->price;?></strong>
            <div class="star-rating">
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
              <span class="icon-star2 text-warning"></span>
            </div>
          </div>
          <!-- <div class="col-lg-4 col-md-6 item-entry mb-4">
            <a href="#" class="product-item md-height bg-gray d-block">
              <img src="" alt="Image" class="img-fluid">
            </a>
            <h2 class="item-title"><a href="#"></a></h2>
            <strong class="item-price"></strong>
          </div>

          <div class="col-lg-4 col-md-6 item-entry mb-4">
            <a href="#" class="product-item md-height bg-gray d-block">
              <img src="../images/model_5.png" alt="Image" class="img-fluid">
            </a>
            <h2 class="item-title"><a href="#">Denim Jacket</a></h2>
            <strong class="item-price"><del>$46.00</del> $28.00</strong> -->

           

            <?php }?>
          </div>
       
        </div>
      </div>
    </div>
<?php
include_once("footer.php");
?>