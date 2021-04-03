-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 2018 年 3 月 18 日 03:26
-- サーバのバージョン： 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `us_pro`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `whereis_contact`
--

CREATE TABLE `whereis_contact` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `nick_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `inquiries` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `whereis_contact`
--

INSERT INTO `whereis_contact` (`id`, `member_id`, `nick_name`, `email`, `title`, `inquiries`, `created`, `modified`) VALUES
(1, 23, 'さ', 'さ', '１番目', 'さ', '2018-02-23 14:13:35', '2018-03-17 02:19:37'),
(2, 30, 'sa', 'sasa@a', '最初に題', 'asas', '2018-02-25 14:13:21', '2018-03-17 02:20:04'),
(3, 23, 'おいら', 'hiro@yahoo.ne.jp', '初めてのタイトル', 'おらおら', '2018-03-17 11:27:35', '2018-03-17 02:27:35'),
(4, 44, 'fuker', 'sasas', 'toooi', 'ggjfgfu', '0000-00-00 00:00:00', '2018-03-17 12:55:48'),
(5, 23, 'sasa', 'rrrr', 'kkkk', 'fuck', '2018-03-17 22:25:00', '2018-03-17 13:25:00'),
(6, 23, 'ほ', 'ひ', 'か', 'へ', '2018-03-17 22:36:06', '2018-03-17 13:36:06'),
(7, 31, 'ha-i', 'sadd', 'ref', 'griijf', '2018-03-18 10:27:24', '2018-03-18 01:27:24'),
(8, 31, 'ook', 'ss@dd', 'titk', 'tuei', '2018-03-18 11:19:47', '2018-03-18 02:19:47');

-- --------------------------------------------------------

--
-- テーブルの構造 `whereis_map`
--

CREATE TABLE `whereis_map` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `movie_info` text NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `whereis_map`
--

INSERT INTO `whereis_map` (`id`, `member_id`, `lat`, `lng`, `movie_info`, `address`, `created`) VALUES
(8, 23, 41.376239097087634, 2.1782684592468513, '<iframe width=\"1280\" height=\"483\" src=\"https://www.youtube.com/embed/tJiVJV29e6M?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'Passeig de Colom, 1806, 08002 Barcelona, スペイン', '2018-02-19 15:18:10'),
(9, 23, -34.11920017728388, 18.37438080312495, '<iframe width=\"1280\" height=\"483\" src=\"https://www.youtube.com/embed/IJh_ZF0Z5R8?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'Scirpus Rd, The Lakes, Cape Town, 7975 南アフリカ', '2018-02-19 15:21:44'),
(12, 23, 50.848457441169195, 4.354007072387276, '<iframe width=\"1280\" height=\"483\" src=\"https://www.youtube.com/embed/3ftgCOXPWXU?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'Impasse de la Fidélité 1-11, 1000 Bruxelles, ベルギー', '2018-02-22 13:56:16'),
(13, 23, 35.659602902411685, 139.70028441408613, '<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/Od6EeCWytZo?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', '日本、〒150-0043 東京都渋谷区道玄坂２丁目２−１', '2018-02-24 15:49:59'),
(19, 23, 36.32162182071344, 139.01331425396734, '<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/LtfjlJjXOfk?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', '日本、〒370-0849 群馬県高崎市八島町222', '2018-03-01 14:46:31'),
(23, 23, 35.66051928052476, 139.70111089891964, '<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/Od6EeCWytZo?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', '日本、〒150-0041 東京都渋谷区神南１丁目２２−３ 渋谷住友信託ビル', '2018-03-01 17:31:08'),
(24, 31, -37.872171444554844, 175.68377902963869, '<iframe width=\"1280\" height=\"485\" src=\"https://www.youtube.com/embed/eRWXRwOs3dM?ecver=1\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', '487 Buckland Rd, Matamata 3472 ニュージーランド', '2018-03-18 11:22:15');

-- --------------------------------------------------------

--
-- テーブルの構造 `whereis_members`
--

CREATE TABLE `whereis_members` (
  `id` int(11) NOT NULL,
  `nick_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `whereis_members`
--

INSERT INTO `whereis_members` (`id`, `nick_name`, `email`, `password`, `created`, `modified`) VALUES
(23, 'san gen', 'a551.return@gmail.com', 'e37f33f9e82bd757d6978fd7f3216e5b1708d402', '2018-02-25 06:15:11', '2018-02-25 06:15:11'),
(29, 'jou migi', 'kokogento@gmail.com', '5e3de5cc6d68245165df26fce21a5bcae8cfa05c', '2018-02-18 11:26:39', '2018-02-18 11:26:39'),
(30, 'gento', 'aaa@aa', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '2018-02-23 05:33:27', '2018-02-23 05:33:27'),
(31, 'View Whe', 'wheview@gmail.com', '31c93131426366f3254d2d92324830a7e2c5b385', '2018-03-18 01:26:40', '2018-03-18 01:26:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `whereis_contact`
--
ALTER TABLE `whereis_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whereis_map`
--
ALTER TABLE `whereis_map`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `whereis_members`
--
ALTER TABLE `whereis_members`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `whereis_contact`
--
ALTER TABLE `whereis_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `whereis_map`
--
ALTER TABLE `whereis_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `whereis_members`
--
ALTER TABLE `whereis_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
