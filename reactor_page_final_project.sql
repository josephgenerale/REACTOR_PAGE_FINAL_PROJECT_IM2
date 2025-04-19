-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2025 at 03:00 AM
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
-- Database: `reactor_page_final_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `cid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`cid`, `pid`, `uid`, `comment_text`, `date`, `time`) VALUES
(2, 57, 6, 'Ritches', '2025-04-06', '09:17:32'),
(3, 57, 6, 'Yown', '2025-04-06', '09:20:20'),
(7, 57, 3, 'Good', '2025-04-06', '09:55:17'),
(37, 65, 7, 'Yeah You.', '2025-04-15', '17:55:51'),
(38, 65, 6, 'Yoooo', '2025-04-15', '17:57:39'),
(39, 65, 8, 'Heyyyy!', '2025-04-16', '04:19:56'),
(40, 66, 8, 'Comment?', '2025-04-16', '04:20:50'),
(41, 66, 8, 'YYY', '2025-04-18', '06:05:47');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `pid` int(11) NOT NULL,
  `text_content` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`pid`, `text_content`, `date`, `time`, `uid`) VALUES
(3, 'sadsadsad', '2025-03-27', '08:18:43', 5),
(57, 'Let\'s Get it on With It', '2025-04-05', '17:46:27', 3),
(65, 'Yoooooooo!!!', '2025-04-15', '23:55:43', 7),
(66, 'Oggy Oggy Oggy!', '2025-04-16', '10:20:42', 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `firstname` varchar(128) NOT NULL,
  `lastname` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `birthdate` date NOT NULL,
  `password` varchar(512) NOT NULL,
  `bio` text DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `cover_photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `username`, `firstname`, `lastname`, `email`, `gender`, `birthdate`, `password`, `bio`, `profile_pic`, `cover_photo`) VALUES
(3, 'josefina', 'Joseph', 'Generale', 'josephgenerale@gmail.com', 'male', '2025-03-07', '123456', 'Yippie', 'uploads/2x2 2.png', 'uploads/1744509852_439405947_122096711996294914_5353492213005710897_n.jpg'),
(4, 'saa', 'LLL', 'LL', 'd@d', 'male', '2025-03-13', '1234', NULL, NULL, NULL),
(5, 'saaa', 'SSS', 'AAA', 'f@f', 'female', '2025-03-14', '789', '', 'uploads/Screenshot 2023-05-02 145233.png', 'uploads/1743060667_Screenshot 2023-06-06 201032.png'),
(6, 'ba', 'Bobby', 'Bee', 'bobby@ba.com', 'male', '2025-03-06', '123456', 'What is it? ', 'uploads/Screenshot 2023-05-02 145233.png', 'uploads/1744463027_0110.png'),
(7, 'technopower', 'Joseph', 'Mercado', 'ja@j', 'male', '2025-04-11', '123456', NULL, 'uploads/440761459_122100874064294914_5735391723409384029_n.jpg', 'uploads/1744732210_455713973_874835001370791_1561421704192810663_n.jpg'),
(8, 'techno', 'Generale', 'Joseph', 'j@j', 'female', '2025-04-09', '123456', 'Your Time Has Come', 'uploads/Screenshot 2023-05-02 145144.png', 'uploads/1744947061_pngegg (1).png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `post` (`pid`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
