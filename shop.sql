-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 17, 2019 at 03:50 PM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `thumbnail`, `parent_id`, `status`) VALUES
(1, 'Shoes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ', 'https://www.converse.com.vn/pictures/catalog/products/sneakers/cons/157873c/157873C2781LNEW.jpg', 0, '1'),
(2, 'Women', 'Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', 'http://im.uniqlo.com/images/common/pc/goods/424789/item/31_424789.jpg', 0, '1'),
(3, 'Men', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment', 'http://im.uniqlo.com/images/common/pc/goods/419994/item/05_419994.jpg', 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `fullname`, `email`, `phone`, `address`, `status`) VALUES
(3, 0, 'hothuling', 'linhho@gmail.com', '0913030197', 'dongha city', '0'),
(4, 0, 'NguyenTu Anh', 'anhnguyen@gmail.com', '0985042567', '77 NguyenHue/ Hue city', '0'),
(5, 0, 'luudanh', 'luudanh00078@gmail.com', '09092290909', 'hue city', '0');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `product_id`, `quantity`, `price`, `order_id`) VALUES
(1, 2, 1, 1550000, 3),
(2, 19, 1, 1499000, 3),
(3, 12, 1, 499000, 3),
(4, 9, 2, 798000, 3),
(5, 9, 1, 399000, 4),
(6, 11, 2, 998000, 4),
(7, 2, 1, 1550000, 5),
(8, 9, 1, 399000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `saleoff` double NOT NULL,
  `thumbnail` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `content`, `price`, `saleoff`, `thumbnail`, `category_id`, `status`) VALUES
(1, 'COns one star pro', 'Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa.', 'È universalmente riconosciuto che un lettore che osserva il layout di una pagina viene distratto dal contenuto testuale se questo è leggibile.', 105000, 0, 'https://www.converse.com.vn/pictures/catalog/products/sneakers/cons/157872c/157872C3651LNEW.jpg', 1, '1'),
(2, 'Chuck 70s', 'Chuck 70 Vintage Canvas Low', 'Esistono innumerevoli variazioni dei passaggi del Lorem Ipsum, ma la maggior parte hanno subito delle variazioni del tempo, a causa dell’inserimento di passaggi ironici', 1550000, 0, 'https://www.converse.com.vn/pictures/catalog/products/sneakers/chuck-taylor-all-star/164950c/164950C4671LNEW.jpg', 1, '1'),
(3, 'classic', 'Chuck Taylor Classic', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod', 950000, 0, 'https://www.converse.com.vn/pictures/catalog/products/sneakers/chuck-taylor-all-star/121176/121176-2.jpg', 1, '1'),
(4, 'Fleur Gianno', 'Converse X GOLF le Fleur Gianno [Limited Edition]', 'sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet', 3500000, 0, 'https://www.converse.com.vn/pictures/catalog/products/sneakers/chuck-taylor-all-star/167376c/conversexgolflefleurtrailrunlowtopconcord1673763.jpg', 1, '1'),
(5, 'All Star 70', 'Chuck Taylor All Star 70 VLTG Hi', 'On the other hand, we denounce with righteous indignation', 1850000, 0, 'https://www.converse.com.vn/pictures/catalog/products/sneakers/chuck-taylor-all-star/564969c/564969Cshot1.jpg', 1, '1'),
(6, 'VANS OLD SKOOL CLASSIC ', 'Fresh Foam 1080v9', 'New Balance updated the popular Fresh Foam 1080v9 men''s performance shoe with data collected from real runners. The result: Unmatched comfort via a full-length Fresh Foam midsole, presented in a premium double jacquard upper.', 1350000, 0, 'https://bizweb.dktcdn.net/100/140/774/products/vans-old-skool-classic-black-white-vn000d3hy28-1.png?v=1515437120383', 1, '1'),
(7, 'VANS FLAME SK8-HI REISSUE', 'SUMMER SALE* ADIDAS ULTRABOOST UNCAGED “CARBON BLACK”\r\n', 'Đôi giày chạy bộ này có thiết kế đơn giản để mang lại cho bạn cảm giác tự do và không bị hạn chế. Thân giày được đan bằng vải primeknit hỗ trợ và ôm sát chân. Đế giữa linh hoạt và đế ngoài hỗ trợ mang đến một chuyến đi suôn sẻ và thoải mái.\r\n\r\n', 1850000, 0, 'https://bizweb.dktcdn.net/100/140/774/products/vans-flame-sk8-hi-reissue-vn0a2xsbphn-1.png?v=1515547659347', 1, '1'),
(8, 'CHÂN VÁY', ' CHÂN VÁY XÒE IN HỌA TIẾT\r\n', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 799000, 689000, 'http://im.uniqlo.com/images/common/pc/goods/421921/item/00_421921.jpg', 2, '1'),
(9, 'LEGGING', ' HEATTECH QUẦN LEGGING\r\n', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi', 399000, 299000, 'http://im.uniqlo.com/images/common/pc/goods/418437/sub/418437_sub2.jpg', 2, '1'),
(10, 'Quần jeans', ' QUẦN jeans CẠP VỪA ỐNG ôm DÀI ĐẾN MẮT CÁ', 'Lorem Ipsum är en utfyllnadstext från tryck- och förlagsindustrin. Lorem', 999000, 0, 'http://im.uniqlo.com/images/common/pc/goods/420679/item/65_420679_large.jpg', 2, '1'),
(11, 'NỮ PEANUTS ÁO NỈ ', 'NỮ PEANUTS ÁO NỈ DÀI TAY', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 499000, 0, 'http://im.uniqlo.com/images/common/pc/goods/422392/item/03_422392.jpg', 2, '1'),
(12, 'NỮ ÁO KHOÁC NỈ CÓ MŨ KÉO KHÓA', 'NỮ ÁO KHOÁC NỈ CÓ MŨ KÉO KHÓA abcxxxy', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout', 499000, 0, 'http://im.uniqlo.com/images/common/pc/goods/418237/item/01_418237.jpg', 2, '1'),
(13, 'NỮ ultra light down áo parka ', 'NỮ ultra light down áo parka phao siêu nhẹ', 'Various versions have evolved over the years', 1699000, 0, 'http://im.uniqlo.com/images/common/pc/goods/419777/item/47_419777.jpg', 2, '1'),
(14, 'NỮ ÁO LEN COTTON ', 'NỮ ÁO LEN COTTON DỆT 3D TAY LỬNG 3/4', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced', 799000, 0, 'http://im.uniqlo.com/images/common/pc/goods/421925/sub/421925_sub1.jpg', 2, '1'),
(15, 'NỮ ÁO CARDIGAN EXTRA FINE ', 'NỮ ÁO CARDIGAN EXTRA FINE MERINO DÁNG DÀI CỔ V', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam', 999000, 0, 'http://im.uniqlo.com/images/common/pc/goods/421711/item/16_421711.jpg', 2, '1'),
(16, 'NỮ Áo parka chần lông ', 'NỮ Áo parka chần lông giả lông cừu', 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system', 1299000, 0, 'http://im.uniqlo.com/images/common/pc/goods/420213/item/69_420213.jpg', 2, '1'),
(17, 'NỮ ÁO SƠ-MI ', 'NỮ ÁO SƠ-MI SUPIMA COTTON CO GIÃN DÀI TAY', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', 799000, 0, 'http://im.uniqlo.com/images/common/pc/goods/421417/item/61_421417.jpg', 2, '1'),
(18, 'NAM ÁO KHOÁC DENIM', 'NAM ÁO KHOÁC DENIM KIỂU NGẮN', 'a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure', 799000, 0, 'http://im.uniqlo.com/images/common/pc/goods/419962/item/67_419962.jpg', 3, '1'),
(19, 'NAM ultra light down ', 'NAM ultra light down áo phao siêu nhẹ', '', 1499000, 0, 'http://im.uniqlo.com/images/common/pc/goods/419994/item/05_419994.jpg', 3, '1'),
(20, 'NAM ÁO SƠ-MI ', 'NAM ÁO SƠ-MI DẠ KẺ CA-RÔ DÀI TAY', 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et', 499000, 0, 'http://im.uniqlo.com/images/common/pc/goods/421205/item/17_421205.jpg', 3, '1'),
(21, 'NAM HEATTECH QUẦN jeans', 'NAM HEATTECH QUẦN JEANS SLIM FIT', 'dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire', 999000, 899000, 'http://im.uniqlo.com/images/common/pc/goods/418915/item/06_418915.jpg', 3, '1'),
(22, 'NAM ÁO POLO DRY-EX ', 'NAM ÁO POLO DRY-EX VẢI PIQUE NGẮN TAY', 'Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae', 499000, 0, 'http://im.uniqlo.com/images/common/pc/goods/415953/item/69_415953.jpg', 3, '1'),
(23, 'NAM City Stories ÁO NỈ ', 'NAM City Stories ÁO NỈ CÓ MŨ CHUI ĐẦU', '', 799000, 0, 'http://im.uniqlo.com/images/common/pc/goods/425008/item/65_425008.jpg', 3, '1'),
(24, 'NAM ÁO LEN EXTRA FINE MERINO ', 'NAM ÁO LEN EXTRA FINE MERINO CỔ V DÀI TAY', 'On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment', 769900, 0, 'http://im.uniqlo.com/images/common/pc/goods/419189/item/57_419189_large.jpg', 3, '1'),
(25, 'VANS VAULT OG OLD SKOOL LX', 'VANS VAULT OG OLD SKOOL LX (SUEDE/CANVAS) CHECKERBOARD/MAJOLICA', 'Đây là một trong những phối màu mới nhất của dòng giày OLD SKOOL mà VANS Vault vừa mới cho ra mắt trong thời gian gần đây. Đôi giày vẫn được dựa trên form thiết kế OLD SKOOL huyền thoại nhưng điểm độc đáo chắc chắn nằm ở phối màu khi VANS đã khéo léo mang họa tiết Checkerboard cùng gam màu xanh denim ấn tượng. Ở phần mũi giày,', 2050000, 0, 'https://bizweb.dktcdn.net/100/140/774/products/vans-og-old-skool-lx-suede-canvas-checkerboard-majolica-vn0a36c8u9w-1.jpg?v=1538659215270', 1, '1'),
(26, 'VANS OLD SKOOL DESERT', 'VANS OLD SKOOL DESERT SAGE/TRUE WHITE', 'Với phối màu được lấy cảm hứng từ màu cây Ngải đắng thường mọc trên những sa mạc nước Mĩ, cho cảm giác hết sức mới mẻ và tinh tế. Về phần chất liệu thì đôi giày này vẫn tiếp tục duy trì những đặc điểm của dòng OLD SKOOL', 1650000, 0, 'https://bizweb.dktcdn.net/100/140/774/products/vans-old-skool-desert-sage-true-white-vn0a38g1u62-1.jpg?v=1537073891773', 1, '1'),
(27, 'Chuck Taylor All Star ', 'Chuck Taylor All Star Seasonal Canvas Color', 'Chuck Taylor All Star Seasonal Canvas Color là đôi dày ra đời với phong cách phối màu mạnh mẽ, cá tính,phù hợp cho cả nam và nữ ...', 1200000, 0, 'https://www.converse.com.vn/pictures/catalog/products/sneakers/chuck-taylor-all-star/162452c/162452.jpg', 1, '1'),
(28, 'Converse Split ', 'Converse Split Box Crew Tee', 'Converse Split Box Crew Tee là mẫu áo thun mới của nhà converse với thiết kế trẻ trung, năng động :)))', 499000, 0, 'https://www.converse.com.vn/pictures/catalog/products/apparel/10007059426/10007059-A03.jpg', 3, '1'),
(29, 'One Star Pro OG Update', 'One Star Pro OG Update limited', 'One Star Pro OG Update với màu rất chất chơi ...', 1500000, 0, 'https://www.converse.com.vn/pictures/catalog/products/sneakers/cons/157873c/157873C2781LNEW.jpg', 1, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_categories_products` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_categories_products` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
