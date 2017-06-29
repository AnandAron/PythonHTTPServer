-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2017 at 05:19 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zonaldesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Username` text NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `de_login`
--

CREATE TABLE `de_login` (
  `employee_id` int(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `district` text NOT NULL,
  `state` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `user` (
  `customer_id` int(10) NOT NULL,
  `name` text NOT NULL,
  `mobile_no` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `address` varchar(200) NOT NULL,
  `pincode` text NOT NULL,
  `state` text NOT NULL,
  `country` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(5) NOT NULL,
  `category` text NOT NULL,
  `sub_category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sm_login`
--

CREATE TABLE `sm_login` (
  `employee_id` int(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `State` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `technician_details`
--

CREATE TABLE `technician_details` (
  `technician_id` int(10) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_no` text NOT NULL,
  `zone` text NOT NULL,
  `availability` text NOT NULL,
  `service_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(10) NOT NULL,
  `category` text NOT NULL,
  `sub-category` text NOT NULL,
  `priority` text NOT NULL,
  `description` text NOT NULL,
  `status` text NOT NULL,
  `DOR` date NOT NULL,
  `customer_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ze_login`
--

CREATE TABLE `ze_login` (
  `employee_id` int(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `zone` text NOT NULL,
  `district` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `zonal_engineer`
--

CREATE TABLE `zonal_engineer` (
  `employee_id` int(10) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile_no` text NOT NULL,
  `qualification` text NOT NULL,
  `father_name` text NOT NULL,
  `mother_name` text NOT NULL,
  `UID` varchar(20) NOT NULL,
  `Role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `register`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `zonal_engineer`
--
ALTER TABLE `zonal_engineer`
  ADD PRIMARY KEY (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `user`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000001;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
