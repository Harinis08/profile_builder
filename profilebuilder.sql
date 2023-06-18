-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 15, 2023 at 06:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `profile_builder`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `relevant_info` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `relevant_info`, `created_at`) VALUES
(1, 'Introduction to Python', 'Learn the basics of Python programming language', 'No prior experience required', '2023-05-15 09:44:52'),
(2, 'Data Science with R', 'Learn R programming language and basics of data science', 'Prerequisite: Basic programming knowledge', '2023-05-15 09:44:52'),
(3, 'Web Development with JavaScript', 'Learn to create web applications using JavaScript', 'Prerequisite: HTML and CSS knowledge', '2023-05-15 09:44:52'),
(4, 'Introduction to Artificial Intelligence', 'Learn the basics of AI and machine learning', 'Prerequisite: Basic math knowledge', '2023-05-15 09:44:52'),
(5, 'Java Programming for Beginners', 'Learn the fundamentals of Java programming', 'No prior experience required', '2023-05-15 09:44:52'),
(6, 'Mobile App Development with React Native', 'Learn to build cross-platform mobile apps using React Native', 'Prerequisite: JavaScript knowledge', '2023-05-15 09:44:52'),
(7, 'Database Management with SQL', 'Learn to create and manage databases using SQL', 'Prerequisite: Basic programming knowledge', '2023-05-15 09:44:52'),
(8, 'iOS App Development with Swift', 'Learn to build iOS apps using Swift', 'Prerequisite: Basic programming knowledge', '2023-05-15 09:44:52'),
(9, 'Full Stack Web Development with Node.js', 'Learn to build full-stack web applications using Node.js', 'Prerequisite: JavaScript knowledge', '2023-05-15 09:44:52'),
(10, 'Introduction to Cybersecurity', 'Learn the fundamentals of cybersecurity and how to protect your data', 'No prior experience required', '2023-05-15 09:44:53');

-- --------------------------------------------------------

--
-- Table structure for table `course_names`
--

CREATE TABLE `course_names` (
  `id` int(11) NOT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `areas_of_interest` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_names`
--

INSERT INTO `course_names` (`id`, `course_name`, `areas_of_interest`) VALUES
(1, 'Machine Learning Fundamentals', 'Data Science'),
(2, 'Data Visualization Techniques', 'Data Science'),
(3, 'Statistical Analysis for Data Science', 'Data Science'),
(4, 'Deep Learning and Neural Networks', 'Data Science'),
(5, 'Natural Language Processing', 'Data Science'),
(6, 'Big Data Analytics', 'Data Science'),
(7, 'Predictive Modeling and Forecasting', 'Data Science'),
(8, 'Time Series Analysis', 'Data Science'),
(9, 'Data Mining and Exploration', 'Data Science'),
(10, 'Data Science Capstone Project', 'Data Science'),
(11, 'HTML and CSS Basics', 'Web Development'),
(12, 'JavaScript Fundamentals', 'Web Development'),
(13, 'Responsive Web Design', 'Web Development'),
(14, 'Front-End Frameworks (e.g., React)', 'Web Development'),
(15, 'Back-End Development (e.g., Node.js)', 'Web Development'),
(16, 'Database Management (e.g., MySQL)', 'Web Development'),
(17, 'Web Application Security', 'Web Development'),
(18, 'API Development and Integration', 'Web Development'),
(19, 'Web Performance Optimization', 'Web Development'),
(20, 'Full-Stack Web Development', 'Web Development'),
(21, 'Introduction to Artificial Intelligence', 'Artificial Intelligence'),
(22, 'Machine Learning Algorithms', 'Artificial Intelligence'),
(23, 'Computer Vision', 'Artificial Intelligence'),
(24, 'Natural Language Processing', 'Artificial Intelligence'),
(25, 'Deep Learning and Neural Networks', 'Artificial Intelligence'),
(26, 'Reinforcement Learning', 'Artificial Intelligence'),
(27, 'AI Ethics and Responsible AI', 'Artificial Intelligence'),
(28, 'AI in Healthcare', 'Artificial Intelligence'),
(29, 'AI in Finance', 'Artificial Intelligence'),
(30, 'AI Capstone Project', 'Artificial Intelligence'),
(31, 'Introduction to Cyber Security', 'Cyber Security'),
(32, 'Network Security', 'Cyber Security'),
(33, 'Web Application Security', 'Cyber Security'),
(34, 'Ethical Hacking', 'Cyber Security'),
(35, 'Digital Forensics', 'Cyber Security'),
(36, 'Cryptography', 'Cyber Security'),
(37, 'Cyber Security Governance', 'Cyber Security'),
(38, 'Security Operations and Incident Response', 'Cyber Security'),
(39, 'Penetration Testing', 'Cyber Security'),
(40, 'Cyber Security Capstone Project', 'Cyber Security'),
(41, 'Python Programming', 'Programming Languages'),
(42, 'Java Programming', 'Programming Languages'),
(43, 'JavaScript Programming', 'Programming Languages'),
(44, 'C++ Programming', 'Programming Languages'),
(45, 'Ruby Programming', 'Programming Languages'),
(46, 'Go Programming', 'Programming Languages'),
(47, 'Swift Programming', 'Programming Languages'),
(48, 'R Programming', 'Programming Languages'),
(49, 'PHP Programming', 'Programming Languages'),
(50, 'Kotlin Programming', 'Programming Languages');

-- --------------------------------------------------------

--
-- Table structure for table `feedback1`
--

CREATE TABLE `feedback1` (
  `feedback` varchar(150) DEFAULT NULL,
  `mentee_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback1`
--

INSERT INTO `feedback1` (`feedback`, `mentee_name`) VALUES
('Start working more to improve your Ai skills!', 'anu'),
('Start working more to improve your Ai skills!', 'anu'),
('Work harder', 'anu'),
('good', 'anu'),
('needs improvement', 'anu');

-- --------------------------------------------------------

--
-- Table structure for table `mentee`
--

CREATE TABLE `mentee` (
  `mentee_id` int(11) NOT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `school_or_college` varchar(100) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `tech_skills` varchar(100) DEFAULT NULL,
  `areas_of_interest` varchar(100) DEFAULT NULL,
  `job_titles` varchar(100) DEFAULT NULL,
  `job_locations` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mentee`
--

INSERT INTO `mentee` (`mentee_id`, `uname`, `school_or_college`, `start_year`, `end_year`, `tech_skills`, `areas_of_interest`, `job_titles`, `job_locations`) VALUES
(1, 'harini', 'Amrita School of Engg', 2020, 2024, 'html, css, javascript', 'Web development', 'Developer', 'India'),
(11, 'karish', '1r3gt4g', 111, 222, 'C, python, cpp', 'Machine learning', 'Data analyst', 'Texas'),
(31, 'anu', '1r3gt4g', 3453, 3432, 'html,css, nodejs, python', 'Artificial Intelligence', 'Web development', 'Hyderabad'),
(111, 'shruti', 'Amrita School of Engg', 2020, 2024, 'C, python, cpp, java', 'Machine learning', 'Data analyst', 'Hyderabad'),
(1234, 'archana', '1r3gt4g', 2013, 2018, 'html,css, nodejs, java', 'Artificial Intelligence', 'Web development', 'Hyderabad'),
(4453, 'meenuv', 'IIT', 341, 435, 'Cryptography, Blockchain', 'Data Science', 'Data Scientist', 'India'),
(12345, 'hello', 'Amrita School of Engg', 1234, 1234, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

CREATE TABLE `mentor` (
  `mentor_id` int(11) NOT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `tech_skills` varchar(100) DEFAULT NULL,
  `areas_of_interest` varchar(100) DEFAULT NULL,
  `job_titles` varchar(100) DEFAULT NULL,
  `job_locations` varchar(100) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mentor`
--

INSERT INTO `mentor` (`mentor_id`, `uname`, `degree`, `major`, `tech_skills`, `areas_of_interest`, `job_titles`, `job_locations`, `experience`) VALUES
(2, 'sarah', 'BTech', 'CSE', 'html, css, javascript', 'Web development', 'Developer', 'Kolkata', 3),
(26, 'meens', 'BTech', 'CSE', 'html,css, nodejs', 'Artificial Intelligence', 'Web development', 'Hyderabad', 4),
(27, 'amba123', 'BTech', 'CSE', 'html,css, nodejs', 'Artificial Intelligence', 'Web development', 'Hyderabad', 3),
(123, 'divya', 'BTech', 'CSE', 'html, css, javascript', 'Artificial Intelligence', 'Developer', 'Hyderabad', 8),
(1234, 'gokul', 'BTech', 'CSE', 'html,css, nodejs, python', 'Machine learning', 'Data analyst', 'India', 4),
(2341, 'harriesh', 'BTech', 'CSE', 'html,css, nodejs, python', 'Artificial Intelligence', 'Web development', 'Hyderabad', 9),
(9978, 'mahimac', 'BTECH', 'Computer Science', 'C,C++,Java,Data Science', 'Data Science', 'Data Analyst', 'India', 8);

-- --------------------------------------------------------

--
-- Table structure for table `pagevisit`
--

CREATE TABLE `pagevisit` (
  `uname` varchar(255) NOT NULL,
  `visit_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pagevisit`
--

INSERT INTO `pagevisit` (`uname`, `visit_count`) VALUES
('amba123', 10),
('anu', 28),
('archana', 7),
('divya', 5),
('harriesh', 3),
('meens', 2),
('meenuv', 11);

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `mentor_uname` varchar(255) NOT NULL,
  `mentee_uname` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `mentor_uname`, `mentee_uname`, `status`, `created_at`) VALUES
(23, 'amba123', 'anu', 'accepted', '2023-06-15 04:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`id`, `fname`, `lname`, `uname`, `pass`, `email`, `phone`, `city`, `country`, `role`) VALUES
(26, 'meenakshi', 'prashant', 'meens', 'aad4ac49407b69fc8d593afbad0853cc', 'meenakshi@gmail.com', '9876543211', 'Kochi', 'India', 'mentor'),
(27, 'amba', 'amba', 'amba123', '7d47963563420b553f8fa4c121021105', 'amba@gmail.com', '9876543210', 'Paris', 'France', 'mentor'),
(31, 'anu', 'duvu', 'anu', '9904fd42e4977d5815b5d5679a935ed5', 'ananyaduvvuri@gmail.com', '9894107200', 'COIMBATORE', 'India', 'mentee'),
(36, 'karishma', 'kumar', 'karish', '25208bb007b5ee33a516016d6c7a3a4f', 'hemanthskumar11@gmail.com', '07397 659486', 'Coimbatore', 'India', 'mentee'),
(40, 'Harini', 'S', 'harini', 'b2f7d6e27829d7da30ab470e11a67a6e', 'harini@gmail.com', '7381947599', 'Kolkata', 'India', 'mentee'),
(41, 'Sarah', 'Michelle', 'sarah', '9e9d7a08e048e9d604b79460b54969c3', 'sarahmichelle@gmail.com', '9876123450', 'Banglore', 'India', 'mentor'),
(42, 'divya', 'divya', 'divya', '2cdd7064b290132617248dbfd85f740e', 'divya96@gmail.com', '9176227537', 'Coimbatore', 'India', 'mentor'),
(48, 'archana', 'archana', 'archana', '46ff90e8e3c3c1cb6cae3a539082ffc9', 'hemanthskumar11@gmail.com', '1234567890', 'Coimbatore', 'India', 'mentee'),
(49, 'harriesh', 'harriesh', 'harriesh', '3fa5030d068dac47ab33f56a9a67e5a8', 'hemanthskumar11@gmail.com', '07397 659486', 'Coimbatore', 'India', 'mentor'),
(51, 'gokul', 's', 'gokul', '60603dce42f421636f4c218f977f9616', 'gocool@gmail.com', '1234567810', 'Coimbatore', 'India', 'mentor'),
(52, 'shruti', 'bala', 'shruti', '73d98b481fe4148fea2b01c63b46d188', 'shrutibala@gmail.com', '1234567899', 'Coimbatore', 'India', 'mentee'),
(53, 'hello', 'hello', 'hello', 'f30aa7a662c728b7407c54ae6bfd27d1', 'hello@gmail.com', '9876543210', 'COIMBATORE', 'India', 'mentee'),
(54, 'Meenu', 'V', 'meenuv', 'd662ae00ece9fbc464e9dbe447d4ad93', 'meenuv@gmail.com', '2323343214', 'San Deigo', 'UAE', 'mentee'),
(55, 'mahima', 'c', 'mahimac', 'a3a6c91a13b7ca9c6a9c9d7a40c1c5c9', 'mahimac@gmail.com', '4434343434', 'Kochi', 'India', 'mentor');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(11) NOT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `tech_skills` varchar(100) DEFAULT NULL,
  `areas_of_interest` varchar(100) DEFAULT NULL,
  `entry_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `uname`, `tech_skills`, `areas_of_interest`, `entry_datetime`) VALUES
(1, 'anu', 'html,css, nodejs, python, java', 'Artificial Intelligence', '2023-05-22 23:29:34'),
(4, 'anu', 'html,css, nodejs, python', 'Artificial Intelligence', '2023-05-22 23:34:33'),
(5, 'harini', 'html, css', 'Web development', '2023-05-23 21:24:39'),
(7, 'harini', 'html, css, javascript', 'Web development', '2023-05-23 21:25:33'),
(8, 'archana', 'html,css, nodejs, python', 'Artificial Intelligence', '2023-05-23 22:27:36'),
(9, 'shruti', 'C, python, cpp', 'Machine learning', '2023-05-24 15:24:42'),
(10, 'shruti', 'C, python, cpp, java', 'Machine learning', '2023-05-24 15:26:55'),
(11, 'archana', 'html,css, nodejs, java', 'Artificial Intelligence', '2023-05-24 16:28:28'),
(12, 'hello', '', '', '2023-05-24 22:38:53'),
(13, 'meenuv', 'Cryptography, Blockchain', 'Data Science', '2023-06-15 01:47:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

CREATE TABLE `user_courses` (
  `user_course_id` int(11) NOT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_courses`
--

INSERT INTO `user_courses` (`user_course_id`, `uname`, `course_id`, `status`) VALUES
(21, 'harini', 14, 'on_progress'),
(22, 'meenuv', 4, 'on_progress'),
(23, 'meenuv', 8, 'on set'),
(24, 'meenuv', 10, 'completed'),
(25, 'anu', 21, 'completed'),
(26, 'anu', 21, 'completed'),
(27, 'anu', 26, 'completed');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_names`
--
ALTER TABLE `course_names`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mentee`
--
ALTER TABLE `mentee`
  ADD PRIMARY KEY (`mentee_id`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- Indexes for table `mentor`
--
ALTER TABLE `mentor`
  ADD PRIMARY KEY (`mentor_id`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- Indexes for table `pagevisit`
--
ALTER TABLE `pagevisit`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mentor_uname` (`mentor_uname`),
  ADD KEY `mentee_uname` (`mentee_uname`);

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_uname_tech_skills` (`uname`,`tech_skills`);

--
-- Indexes for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`user_course_id`),
  ADD KEY `uname` (`uname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `course_names`
--
ALTER TABLE `course_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `user_course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mentee`
--
ALTER TABLE `mentee`
  ADD CONSTRAINT `mentee_ibfk_1` FOREIGN KEY (`uname`) REFERENCES `signup` (`uname`);

--
-- Constraints for table `mentor`
--
ALTER TABLE `mentor`
  ADD CONSTRAINT `mentor_ibfk_1` FOREIGN KEY (`uname`) REFERENCES `signup` (`uname`);

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`mentor_uname`) REFERENCES `mentor` (`uname`),
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`mentee_uname`) REFERENCES `mentee` (`uname`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`uname`) REFERENCES `signup` (`uname`);

--
-- Constraints for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_ibfk_1` FOREIGN KEY (`uname`) REFERENCES `signup` (`uname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
