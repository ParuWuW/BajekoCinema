-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2026 at 10:05 AM
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
-- Database: `bajekocinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `booking_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_name`) VALUES
('Action'),
('Comedy'),
('Fantasy'),
('Romance'),
('SciFi'),
('Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `hall`
--

CREATE TABLE `hall` (
  `hall_id` int(11) NOT NULL,
  `theatre_id` int(11) NOT NULL,
  `hall_name` varchar(50) NOT NULL,
  `total_seats` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hall`
--

INSERT INTO `hall` (`hall_id`, `theatre_id`, `hall_name`, `total_seats`) VALUES
(1, 1, 'Hall A', 120),
(2, 1, 'Hall B', 80),
(3, 2, 'Hall A', 100),
(4, 2, 'Hall B', 90);

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `genre` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `duration_min` int(6) NOT NULL,
  `release_date` date DEFAULT NULL,
  `poster_url` text DEFAULT NULL,
  `trailer_url` text DEFAULT NULL,
  `imdb_score` decimal(3,1) DEFAULT NULL,
  `status` enum('upcoming','now_showing','ended') NOT NULL DEFAULT 'upcoming'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `title`, `genre`, `description`, `duration_min`, `release_date`, `poster_url`, `trailer_url`, `imdb_score`, `status`) VALUES
(1, 'Dune: Part Two', 'SciFi', 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.', 166, '2024-02-28', 'resources/images/dune.png', NULL, 8.7, 'now_showing'),
(2, 'Oppenheimer', 'Thriller', 'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.', 180, '2023-07-21', 'resources/images/oppenheimer.png', NULL, 8.5, 'now_showing'),
(3, 'Barbie', 'Comedy', 'Barbie and Ken discover the joys and perils of living in the real world.', 114, '2023-07-21', 'resources/images/barbie.png', NULL, 7.0, 'now_showing'),
(4, 'Killers of the Flower Moon', 'Thriller', 'Members of the Osage tribe are murdered under mysterious circumstances in the 1920s.', 206, '2023-10-20', 'resources/images/flowermoon.png', NULL, 8.0, 'now_showing'),
(5, 'Poor Things', 'Fantasy', 'The incredible tale of Bella Baxter, a young woman brought back to life by an unorthodox scientist.', 141, '2023-12-08', 'resources/images/poorthings.png', NULL, 8.1, 'now_showing'),
(6, 'Deadpool 3', 'Action', 'Wade Wilson returns for another meta, violent, and hilarious adventure.', 127, '2024-07-26', 'resources/images/deadpool.png', NULL, 0.0, 'upcoming'),
(7, 'Joker: Folie à Deux', 'Thriller', 'Sequel to Joker, featuring Arthur Fleck and Harley Quinn.', 138, '2024-10-04', 'resources/images/jocker.png', NULL, 0.0, 'upcoming'),
(8, 'Avatar 3', 'SciFi', 'The third installment in James Cameron’s Avatar franchise.', 190, '2025-12-19', 'resources/images/avatar.png', NULL, 0.0, 'upcoming'),
(9, 'Gladiator 2', 'Action', 'Follows Lucius, the son of Maximus’s love Lucilla, years after the first film.', 160, '2024-11-22', 'resources/images/gladiator.png', NULL, 0.0, 'upcoming'),
(10, 'Mickey 17', 'SciFi', 'An unlikely hero, Mickey Barnes, signs up for a dangerous human expedition.', 140, '2024-03-29', 'resources/images/mickey17.png', NULL, 0.0, 'upcoming'),
(11, 'Avatar: The Way of Water', 'SciFi', 'Jake Sully and Neytiri fight to protect their family and Pandora.', 192, '2022-12-16', 'resources/images/avatar.png', NULL, 7.6, 'ended'),
(12, 'Top Gun: Maverick', 'Action', 'Pete “Maverick” Mitchell confronts his past while training a new generation of Top Gun graduates.', 130, '2022-05-27', 'resources/images/topgun.png', NULL, 8.2, 'ended');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `seat_id` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `row_label` char(2) NOT NULL,
  `seat_number` int(11) NOT NULL,
  `is_booked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`seat_id`, `hall_id`, `row_label`, `seat_number`, `is_booked`) VALUES
(1, 1, 'A', 1, 0),
(2, 1, 'A', 2, 0),
(3, 1, 'A', 3, 0),
(4, 1, 'A', 4, 0),
(5, 1, 'A', 5, 0),
(6, 1, 'A', 6, 0),
(7, 1, 'A', 7, 0),
(8, 1, 'A', 8, 0),
(9, 1, 'B', 1, 0),
(10, 1, 'B', 2, 0),
(11, 1, 'B', 3, 0),
(12, 1, 'B', 4, 0),
(13, 1, 'B', 5, 0),
(14, 1, 'B', 6, 0),
(15, 1, 'B', 7, 0),
(16, 1, 'B', 8, 0),
(17, 1, 'C', 1, 0),
(18, 1, 'C', 2, 0),
(19, 1, 'C', 3, 0),
(20, 1, 'C', 4, 0),
(21, 1, 'C', 5, 0),
(22, 1, 'C', 6, 0),
(23, 1, 'C', 7, 0),
(24, 1, 'C', 8, 0),
(25, 1, 'D', 1, 0),
(26, 1, 'D', 2, 0),
(27, 1, 'D', 3, 0),
(28, 1, 'D', 4, 0),
(29, 1, 'D', 5, 0),
(30, 1, 'D', 6, 0),
(31, 1, 'D', 7, 0),
(32, 1, 'D', 8, 0),
(33, 1, 'E', 1, 0),
(34, 1, 'E', 2, 0),
(35, 1, 'E', 3, 0),
(36, 1, 'E', 4, 0),
(37, 1, 'E', 5, 0),
(38, 1, 'E', 6, 0),
(39, 1, 'E', 7, 0),
(40, 1, 'E', 8, 0),
(41, 2, 'A', 1, 0),
(42, 2, 'A', 2, 0),
(43, 2, 'A', 3, 0),
(44, 2, 'A', 4, 0),
(45, 2, 'A', 5, 0),
(46, 2, 'A', 6, 0),
(47, 2, 'A', 7, 0),
(48, 2, 'A', 8, 0),
(49, 2, 'B', 1, 0),
(50, 2, 'B', 2, 0),
(51, 2, 'B', 3, 0),
(52, 2, 'B', 4, 0),
(53, 2, 'B', 5, 0),
(54, 2, 'B', 6, 0),
(55, 2, 'B', 7, 0),
(56, 2, 'B', 8, 0),
(57, 2, 'C', 1, 0),
(58, 2, 'C', 2, 0),
(59, 2, 'C', 3, 0),
(60, 2, 'C', 4, 0),
(61, 2, 'C', 5, 0),
(62, 2, 'C', 6, 0),
(63, 2, 'C', 7, 0),
(64, 2, 'C', 8, 0),
(65, 2, 'D', 1, 0),
(66, 2, 'D', 2, 0),
(67, 2, 'D', 3, 0),
(68, 2, 'D', 4, 0),
(69, 2, 'D', 5, 0),
(70, 2, 'D', 6, 0),
(71, 2, 'D', 7, 0),
(72, 2, 'D', 8, 0),
(73, 2, 'E', 1, 0),
(74, 2, 'E', 2, 0),
(75, 2, 'E', 3, 0),
(76, 2, 'E', 4, 0),
(77, 2, 'E', 5, 0),
(78, 2, 'E', 6, 0),
(79, 2, 'E', 7, 0),
(80, 2, 'E', 8, 0),
(81, 3, 'A', 1, 0),
(82, 3, 'A', 2, 0),
(83, 3, 'A', 3, 0),
(84, 3, 'A', 4, 0),
(85, 3, 'A', 5, 0),
(86, 3, 'A', 6, 0),
(87, 3, 'A', 7, 0),
(88, 3, 'A', 8, 0),
(89, 3, 'B', 1, 0),
(90, 3, 'B', 2, 0),
(91, 3, 'B', 3, 0),
(92, 3, 'B', 4, 0),
(93, 3, 'B', 5, 0),
(94, 3, 'B', 6, 0),
(95, 3, 'B', 7, 0),
(96, 3, 'B', 8, 0),
(97, 3, 'C', 1, 0),
(98, 3, 'C', 2, 0),
(99, 3, 'C', 3, 0),
(100, 3, 'C', 4, 0),
(101, 3, 'C', 5, 0),
(102, 3, 'C', 6, 0),
(103, 3, 'C', 7, 0),
(104, 3, 'C', 8, 0),
(105, 3, 'D', 1, 0),
(106, 3, 'D', 2, 0),
(107, 3, 'D', 3, 0),
(108, 3, 'D', 4, 0),
(109, 3, 'D', 5, 0),
(110, 3, 'D', 6, 0),
(111, 3, 'D', 7, 0),
(112, 3, 'D', 8, 0),
(113, 3, 'E', 1, 0),
(114, 3, 'E', 2, 0),
(115, 3, 'E', 3, 0),
(116, 3, 'E', 4, 0),
(117, 3, 'E', 5, 0),
(118, 3, 'E', 6, 0),
(119, 3, 'E', 7, 0),
(120, 3, 'E', 8, 0),
(121, 4, 'A', 1, 0),
(122, 4, 'A', 2, 0),
(123, 4, 'A', 3, 0),
(124, 4, 'A', 4, 0),
(125, 4, 'A', 5, 0),
(126, 4, 'A', 6, 0),
(127, 4, 'A', 7, 0),
(128, 4, 'A', 8, 0),
(129, 4, 'B', 1, 0),
(130, 4, 'B', 2, 0),
(131, 4, 'B', 3, 0),
(132, 4, 'B', 4, 0),
(133, 4, 'B', 5, 0),
(134, 4, 'B', 6, 0),
(135, 4, 'B', 7, 0),
(136, 4, 'B', 8, 0),
(137, 4, 'C', 1, 0),
(138, 4, 'C', 2, 0),
(139, 4, 'C', 3, 0),
(140, 4, 'C', 4, 0),
(141, 4, 'C', 5, 0),
(142, 4, 'C', 6, 0),
(143, 4, 'C', 7, 0),
(144, 4, 'C', 8, 0),
(145, 4, 'D', 1, 0),
(146, 4, 'D', 2, 0),
(147, 4, 'D', 3, 0),
(148, 4, 'D', 4, 0),
(149, 4, 'D', 5, 0),
(150, 4, 'D', 6, 0),
(151, 4, 'D', 7, 0),
(152, 4, 'D', 8, 0),
(153, 4, 'E', 1, 0),
(154, 4, 'E', 2, 0),
(155, 4, 'E', 3, 0),
(156, 4, 'E', 4, 0),
(157, 4, 'E', 5, 0),
(158, 4, 'E', 6, 0),
(159, 4, 'E', 7, 0),
(160, 4, 'E', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `show_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `theatre_id` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `show_date` date NOT NULL,
  `start_time` time NOT NULL,
  `status` enum('scheduled','cancelled','completed') NOT NULL DEFAULT 'scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `movie_id`, `theatre_id`, `hall_id`, `show_date`, `start_time`, `status`) VALUES
(1, 1, 1, 1, '2026-06-26', '12:00:00', 'scheduled'),
(2, 1, 1, 2, '2026-06-26', '18:00:00', 'scheduled'),
(3, 1, 2, 3, '2026-06-27', '14:00:00', 'scheduled'),
(4, 1, 2, 4, '2026-06-27', '20:00:00', 'scheduled'),
(5, 1, 1, 1, '2026-06-28', '13:00:00', 'scheduled'),
(6, 1, 2, 4, '2026-06-28', '19:00:00', 'scheduled'),
(7, 2, 1, 2, '2026-06-26', '13:00:00', 'scheduled'),
(8, 2, 1, 1, '2026-06-26', '20:00:00', 'scheduled'),
(9, 2, 2, 4, '2026-06-27', '11:00:00', 'scheduled'),
(10, 2, 2, 3, '2026-06-27', '19:00:00', 'scheduled'),
(11, 2, 1, 2, '2026-06-28', '14:00:00', 'scheduled'),
(12, 2, 2, 3, '2026-06-28', '21:00:00', 'scheduled'),
(13, 3, 1, 1, '2026-06-26', '15:00:00', 'scheduled'),
(14, 3, 1, 2, '2026-06-26', '21:00:00', 'scheduled'),
(15, 3, 2, 3, '2026-06-27', '16:00:00', 'scheduled'),
(16, 3, 2, 4, '2026-06-27', '22:00:00', 'scheduled'),
(17, 3, 1, 1, '2026-06-28', '11:00:00', 'scheduled'),
(18, 3, 2, 4, '2026-06-28', '17:00:00', 'scheduled'),
(19, 4, 1, 2, '2026-06-26', '10:00:00', 'scheduled'),
(20, 4, 1, 1, '2026-06-26', '17:00:00', 'scheduled'),
(21, 4, 2, 4, '2026-06-27', '13:00:00', 'scheduled'),
(22, 4, 2, 3, '2026-06-27', '20:00:00', 'scheduled'),
(23, 4, 1, 2, '2026-06-28', '12:00:00', 'scheduled'),
(24, 4, 2, 3, '2026-06-28', '18:00:00', 'scheduled'),
(25, 5, 1, 1, '2026-06-26', '11:00:00', 'scheduled'),
(26, 5, 1, 2, '2026-06-26', '19:00:00', 'scheduled'),
(27, 5, 2, 3, '2026-06-27', '15:00:00', 'scheduled'),
(28, 5, 2, 4, '2026-06-27', '21:00:00', 'scheduled'),
(29, 5, 1, 1, '2026-06-28', '16:00:00', 'scheduled'),
(30, 5, 2, 4, '2026-06-28', '20:00:00', 'scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `theatre`
--

CREATE TABLE `theatre` (
  `theatre_id` int(11) NOT NULL,
  `theatre_name` varchar(150) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `theatre`
--

INSERT INTO `theatre` (`theatre_id`, `theatre_name`, `address`, `phone`, `email`) VALUES
(1, 'Civil Mall', 'Kathmandu', '014444444', 'civilmall@bajekocinema.com'),
(2, 'Labim Mall', 'Lalitpur', '015555555', 'labimmall@bajekocinema.com');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `status` enum('active','cancelled') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_seat`
--

CREATE TABLE `ticket_seat` (
  `ticket_seat_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `seat_price` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `isVerified` tinyint(1) NOT NULL,
  `role` varchar(10) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `fullName`, `email`, `phone`, `password`, `isVerified`, `role`, `image`) VALUES
(5, 'Admin', 'admin@gmail.com', '0000000000', '$2a$10$2ZGxrOg5fWMsENbTWAS4H.zjvtNAxz.5r0ZlwjNWDTI5iQKnzDgk2', 1, 'admin', 'resources/images/download.png'),
(6, 'Rabina Lama', 'rabina@gmail.com', '9840382829', '$2a$10$DlJJoDAgDrs.4bKEn0.QUOShEwyaT/tJhO3cHwfig.rH3sT6aooda', 1, 'user', 'resources/images/rabina.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_booking_user` (`user_id`),
  ADD KEY `fk_booking_show` (`show_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_name`);

--
-- Indexes for table `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`hall_id`),
  ADD KEY `fk_hall_theatre` (`theatre_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `genre` (`genre`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `hall_id` (`hall_id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`show_id`),
  ADD KEY `fk_show_movie` (`movie_id`),
  ADD KEY `hall_id` (`hall_id`),
  ADD KEY `theatre_id` (`theatre_id`);

--
-- Indexes for table `theatre`
--
ALTER TABLE `theatre`
  ADD PRIMARY KEY (`theatre_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD UNIQUE KEY `booking_id` (`booking_id`);

--
-- Indexes for table `ticket_seat`
--
ALTER TABLE `ticket_seat`
  ADD PRIMARY KEY (`ticket_seat_id`),
  ADD UNIQUE KEY `uq_ticket_seat` (`ticket_id`,`seat_id`),
  ADD KEY `fk_ts_seat` (`seat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hall`
--
ALTER TABLE `hall`
  MODIFY `hall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `show_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `theatre`
--
ALTER TABLE `theatre`
  MODIFY `theatre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket_seat`
--
ALTER TABLE `ticket_seat`
  MODIFY `ticket_seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hall`
--
ALTER TABLE `hall`
  ADD CONSTRAINT `fk_hall_theatre` FOREIGN KEY (`theatre_id`) REFERENCES `theatre` (`theatre_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
