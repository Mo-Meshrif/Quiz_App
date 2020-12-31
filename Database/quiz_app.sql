-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 31, 2020 at 01:48 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer1` varchar(255) NOT NULL,
  `answer2` varchar(255) NOT NULL,
  `answer3` varchar(255) NOT NULL,
  `answer4` varchar(255) NOT NULL,
  `correctAnswer` varchar(255) NOT NULL,
  `question_answer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `answer1`, `answer2`, `answer3`, `answer4`, `correctAnswer`, `question_answer`) VALUES
(1, 'Four', 'Five', 'Six', 'Seven', 'Seven', 1),
(2, '357', '375', '365', '356', '365', 2),
(3, '6', '7', '8', '9', '7', 3),
(4, 'Camel', 'Lion', 'Tiger', 'Cat', 'Camel', 4),
(5, '24', '25', '26', '27', '26', 5),
(6, 'Two', 'Three', 'Four', 'Five', 'Three', 6),
(7, 'North', 'South', 'East', 'West', 'East', 7),
(8, 'February', 'March', 'April', 'May', 'February', 8),
(9, 'Doctor', 'Teacher', 'Nurse', 'Postman', 'Postman', 9),
(10, 'oxygen ', 'monoxide', 'Carbon dioxide', 'Nitrogen', 'Carbon dioxide', 10);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `questionLevel` varchar(255) NOT NULL,
  `questionsCatogory` varchar(255) NOT NULL,
  `questionType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `questionLevel`, `questionsCatogory`, `questionType`) VALUES
(1, 'How many days do we have in a week ?', 'Easy', 'General Knowledge', 'Time'),
(2, 'How many days are there in a year ?', 'Easy', 'General Knowledge', 'Time'),
(3, 'How many colors are there in a rainbow ?', 'Easy', 'General Knowledge', 'Nature'),
(4, 'Which animal is known as the Ship of the Desert ?', 'Easy', 'General Knowledge', 'Animals'),
(5, 'How many letters are there in the English alphabet ?', 'Easy', 'General Knowledge', 'Lamguages'),
(6, 'How many sides are there in a triangle ? ', 'Easy', 'General Knowledge', 'Math'),
(7, 'In which direction does the sun rise ?', 'Easy', 'General Knowledge', 'Nature'),
(8, 'Which month of the year has the least number of days?', 'Easy', 'General Knowledge', 'Time'),
(9, 'What do you call the person who brings a letter to your home from post office ?', 'Easy', 'General Knowledge', 'Jobs'),
(10, 'What type of gas do plants absorb ?', 'Easy', 'General Knowledge', 'Science');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question_answer` (`question_answer`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_answer`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
