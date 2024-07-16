-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2024 at 06:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocerydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `firstName` varchar(125) NOT NULL,
  `lastName` varchar(125) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `confirmCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `firstName`, `lastName`, `email`, `mobile`, `address`, `password`, `type`, `confirmCode`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '6464651', 'okay', '$2y$10$YBXuhHjY0hPampT12IqhGuozoVI040.b6B/PqPwYDxVs4Xi1cRTT.', 'admin', '789456'),
(2, 'Hiakosi', 'Castaneda', 'joana@gmail.com', '09368790811', 'ADDRESS 1 BLK 15 LOT 17 DRIVE ST.', '21232f297a57a5a743894a0e4a801fc3', 'staff', '131527'),
(3, 'Jhenny', 'Lee', 'lee@gmail.com', '09207601999', 'longos', '69a9dc1da83c4c3e58a5ecb7c9de78fa', 'admin', '139474'),
(4, 'Farzam', 'Imdad', 'farzamimdad22@gmail.com', '123', '', '$2y$10$YBXuhHjY0hPampT12IqhGuozoVI040.b6B/PqPwYDxVs4Xi1cRTT.', 'admin', '123'),
(5, 'Ayesha', 'Khan', 'kk2072863@gmail.com', '0', 'xyz', '$2y$10$T6GZ4ZWD.5mN4zEGmOeLS.uE1GtcUK6HtgMtm3bwGLuTfi0iA1WP6', 'admin', '789');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `uid`, `pid`, `quantity`) VALUES
(11, 2, 12, 0),
(12, 0, 46, 0),
(15, 43, 47, 0),
(19, 42, 54, 0),
(20, 42, 53, 0),
(21, 0, 47, 0),
(22, 0, 99, 0),
(23, 46, 81, 0),
(24, 0, 82, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `oplace` text NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `dstatus` varchar(10) NOT NULL DEFAULT 'no',
  `odate` date NOT NULL,
  `ddate` date NOT NULL,
  `delivery` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uid`, `pid`, `quantity`, `oplace`, `mobile`, `dstatus`, `odate`, `ddate`, `delivery`) VALUES
(90, 47, 82, 1, 'zamm', '03116184663', 'no', '2024-03-25', '0000-00-00', 'Express Delivery +100php upon '),
(91, 49, 82, 1, 'House No. 185 W Block Scheme NO. 3 Farid Town Sahiwal', '03116184663', 'Yes', '2024-05-27', '2024-10-11', 'Express Delivery +100php upon '),
(92, 49, 82, 10, 'xyz', '03116184663', 'no', '2024-05-28', '0000-00-00', 'Express Delivery +100php upon '),
(93, 49, 82, 10, 'xyz', '03116184663', 'no', '2024-05-28', '0000-00-00', 'Express Delivery +Rs.100 upon ');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `pName` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `piece` int(11) NOT NULL,
  `description` text NOT NULL,
  `available` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `pCode` varchar(20) NOT NULL,
  `picture` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `pName`, `price`, `piece`, `description`, `available`, `category`, `type`, `item`, `pCode`, `picture`) VALUES
(77, 'Knorr Instant Noodles Chicken 50g 1Pack\r\n', 75, 1, 'Chicken flavour has a careful blend of herbs and spices that gives it a rich taste. It is definitely an all time favourite!\r\n\r\n', 100, '', '', 'noodles', 'aa', 'chicken.jpg'),
(78, 'Knorr Instant Noodles Chatt Patta 50g 1Pack\r\n', 75, 1, 'This magical mix contains a masala, chatpattaflavour- it is definitely a favourite for all!\r\n\r\n', 100, '', '', 'noodles', 'bb', 'chatpata.jpg'),
(79, 'Knorr Chatpatta Noodles Pack of 4.', 300, 3, 'This magical mix contains a masala, chatpattaflavour- it is definitely a favourite for all!\r\nPack of 3.', 100, '', '', 'noodles', 'cc', 'pack.jpg'),
(80, 'Knorr Chicken Noodles Pack of 4', 300, 4, 'Chicken flavour has a careful blend of herbs and spices that gives it a rich taste. It is definitely an all time favourite!\r\nPack of 4.', 100, '', '', 'noodles', 'dd', 'Pack of 3.jpg'),
(81, 'Kolson\'s Pasta Cut Vermicelli 400g', 150, 1, 'Vermicelli or seviyan is a traditional type of pasta round in section that is thicker than spaghetti.\r\n', 100, '', '', 'noodles', 'ee', 'kolson.webp'),
(82, 'PRB Egg Noodles 400g', 595, 1, 'Season a wide range of roasted and grilled chicken delicacies with this flavorful and spicy Bayara Chicken Seasoning. Its rich taste and aroma will enhance the taste of your dish easily.\r\n\r\n', 100, '', '', 'noodles', 'ff', 'prb.webp'),
(83, 'Magic Sarap 4packs', 185, 4, '8g set of 4', 100, '', '', 'seasoning', 'qq', '1539232659.PNG'),
(84, 'Coke 300ml set of 24 pcs', 290, 24, '300 ml 24pcs', 100, '', '', 'drink', 'qwe', '1539403731.PNG'),
(85, 'Sprite 350ml 24pcs', 300, 24, '350ml 24pcs', 100, '', '', 'drink', 'qwer', '1539403840.PNG'),
(86, 'Kopiko Blanca Cream 30g set of 2', 160, 2, '30g set of 2packs', 100, '', '', 'drink', 'qwrt', '1539404335.jpg'),
(87, 'Milo 22g set of 2packs', 160, 24, '22g 2packs/24pcs', 100, '', '', 'drink', 'ryrty', '1539404929.jpg'),
(88, 'Coke 1.5L 6bottles', 1150, 6, 'coke 1.5L 6B', 100, '', '', 'drink', 'mnb', '1539405194.jpg'),
(90, 'Nestle Mineral Water 550 ML ', 65, 1, '500ml/ 1 bottle', 100, '', '', 'drink', 'ads', 'water.jpg'),
(91, 'LAYS CLASSIC PARTY PACK', 100, 1, '', 100, '', 'other', 'snack', 'asdaa', 'lays.jpg'),
(92, 'DORITOS FLAME GRILLED', 1090, 1, '180g/1 pack', 100, '', 'other', 'snack', 'adf', '4.PNG'),
(93, 'SUPER CRISP NIMKOMIX', 75, 1, '', 100, '', '', 'snack', 'gfhjgj', '3.png'),
(94, 'PRINGLES ORIGINAL 40GM', 525, 1, '40GM', 100, '', '', 'snack', 'lkfjd', '2.png'),
(95, 'PRINGLES ORIGINAL 165G', 1400, 1, '1 pack', 100, '', '', 'snack', 'lk', '1.PNG'),
(96, 'Nestle KitKat 2 Finger Bar', 135, 1, 'Indulge in an iconic break with our 2 finger KitKat collection. Comprising of crispy wafer topped in smooth milk chocolate, the bars in our range are perfect for worktime breaks and make the ideal companion to your afternoon cuppa.\r\nChoose from classic milk or dark chocolate or go for something different with honeycomb, dark mint, orange or chocolate hazelnut spread. Whatever mood your taste buds are in, you’ll find the perfect break in our 2 finger KitKat collection.', 100, '', '', 'sweet', 'kt', 'kitkat.jpg'),
(97, 'Cadbury Twirl Chocolate, 43g', 480, 1, '', 100, '', '', 'sweet', 'n', 'twirl.jpg'),
(98, 'Toblerone Milk Chocolate, 100g\r\n', 600, 1, '', 100, '', '', 'sweet', 'tbl', 'toblerone.jpg'),
(99, 'Palmolive silky  12ml+conditioner 10ml/24s', 200, 24, 'shampoo12ml+conditioner10ml', 100, '', 'other', 'shampoo', 'r', '1539448680.PNG'),
(100, 'Palmolive shampoo aroma-vitality 13.5ml 48s', 270, 48, '13.5ml/48sets', 100, '', '', 'shampoo', 'v', '1539448775.PNG'),
(101, 'Palmolive shampoo antiDandruff 13.5ml 48s', 270, 100, '13.5ml/48sets', 100, '', '', 'shampoo', 'e', '1539448866.PNG'),
(102, 'Safeguard Soap', 125, 1, '', 100, '', '', 'soap', 'a', '3.png'),
(103, 'Lux 3in1', 375, 3, '3sets 100g', 100, '', '', 'soap', 'nl', 'lux.jpg'),
(104, 'Palmolive pack of 5', 300, 7, '5sets 135g', 100, '', '', 'soap', 'ewr', 'palmolive.jpg'),
(105, 'Snickers Minis Chocolate Pack, 227g', 1950, 12, 'Snickers Minis Chocolate Pack contains 12 mini snickers', 100, '', '', 'sweet', 'n', 'snickers pack.jpg'),
(106, 'Toblerone Dark Chocolate, 100g', 600, 1, '', 100, '', '', 'sweet', 'tbd', 'toblerone dark.jpg'),
(107, 'Nestle Kit Kat 4-Fingers, 41.5g\r\n', 230, 1, '', 100, '', '', 'sweet', 'kk4p', 'kitkat 4p.jpg'),
(109, 'Cadbury Dairy Milk Whole Nut\r\n', 390, 1, 'Cadbury Dairy Milk Whole Nut, 45g (Imported)', 50, '', '', 'sweet', 'cdbwn', 'cadbury wnut.jpg'),
(110, 'Cadbury Dairy Milk Fruit & Nut', 390, 1, 'Cadbury Dairy Milk Fruit & Nut Chocolate, 49g (Imported)\r\n', 50, '', '', 'sweet', 'cdbfn', 'cadbury f&n.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(120) NOT NULL,
  `password` varchar(100) NOT NULL,
  `confirmCode` varchar(10) NOT NULL,
  `activation` varchar(10) NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `email`, `mobile`, `address`, `password`, `confirmCode`, `activation`) VALUES
(44, 'Jo', 'Castaneda', 'joanmcastaneda@gmail.com', '09368790811', 'ADDRESS 1 BLK 15 LOT 17 DRIVE ST.', '69a9dc1da83c4c3e58a5ecb7c9de78fa', '0', 'yes'),
(45, 'KO', 'KOOOO', 'ko@w.com', '123', 'ADDRESS 1 BLK 15 LOT 17 DRIVE ST.', '25d55ad283aa400af464c76d713c07ad', '289477', 'no'),
(46, 'Czyke', 'Correa', 'czyke@yahoo.com', '09368790811', 'ADDRESS 1 BLK 15 LOT 17 DRIVE ST.', '7c09a95be9c2e9612c2bda758fc17e42', '0', 'yes'),
(49, 'Farzam', 'Imdad', 'farzamimdad22@gmail.com', '03116184663', 'xyz', '$2y$10$YBXuhHjY0hPampT12IqhGuozoVI040.b6B/PqPwYDxVs4Xi1cRTT.', '0', 'yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
