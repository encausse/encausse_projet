-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 24 juin 2024 à 01:10
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sgh`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `adminid` int(10) NOT NULL,
  `adminname` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `usertype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`adminid`, `adminname`, `loginid`, `password`, `status`, `usertype`) VALUES
(1, 'gnanmien', 'admin', '@123456789', 'Active', '');

-- --------------------------------------------------------

--
-- Structure de la table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` int(10) NOT NULL,
  `appointmenttype` varchar(25) NOT NULL,
  `patientid` int(10) NOT NULL,
  `roomid` int(10) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `doctorid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `roomid`, `departmentid`, `appointmentdate`, `appointmenttime`, `doctorid`, `status`, `app_reason`) VALUES
(1, '', 1, 0, 1, '2019-06-17', '03:00:00', 1, 'Approved', 'Fever'),
(2, '', 3, 0, 2, '2021-06-25', '09:22:00', 2, 'Approved', 'this is a demo test'),
(4, '', 5, 0, 4, '2021-06-24', '14:28:00', 5, 'Approved', 'demo demo demo'),
(5, '', 6, 0, 7, '2021-06-24', '11:18:00', 7, 'Approved', 'Demo Test, Demo Reason!!'),
(6, 'ONLINE', 7, 0, 2, '2024-06-23', '06:37:00', 3, 'Pending', 'JJJJJJHHJ'),
(7, 'ONLINE', 8, 0, 1, '2024-06-28', '00:52:00', 0, 'Pending', 'JHJJJ'),
(8, 'ONLINE', 9, 0, 5, '2024-06-27', '05:01:00', 3, 'Pending', 'azdchgf'),
(9, 'ONLINE', 10, 0, 5, '2024-06-25', '04:57:00', 5, 'Pending', 'MALADE');

-- --------------------------------------------------------

--
-- Structure de la table `department`
--

CREATE TABLE `department` (
  `departmentid` int(10) NOT NULL,
  `departmentname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `department`
--

INSERT INTO `department` (`departmentid`, `departmentname`, `description`, `status`) VALUES
(1, 'Medecine', 'on action vise à supprimer les facteurs de risque, surveiller la santé du travailleur en fonction de son âge, et de son milieu de travail et minimiser les conséquences du travail sur la santé', 'Active'),
(2, 'Cardiologie', 'Fournit des soins médicaux aux patients ayant des problèmes cardiaques ou circulatoires.', 'Active'),
(3, 'Gynecologie', 'Étudie et traite les problèmes liés aux voies urinaires féminines et aux organes reproducteurs, tels que l\'endométriose, l\'infertilité et l\'incontinence', 'Active'),
(4, 'Haematologie', 'Ces services hospitaliers travaillent avec le laboratoire. En outre, les médecins traitent les maladies du sang et les tumeurs malignes liées au sang.', 'Active'),
(5, 'Maternité', 'Les maternités assurent des soins prénatals, des accouchements, des soins pendant l\'accouchement et un soutien postnatal.', 'Active'),
(6, 'Nephrologie', 'Surveille et évalue les patients présentant divers problèmes et affections rénales (rénales)', 'Active'),
(7, 'Oncologie', 'Branche de la médecine qui traite du cancer et des tumeurs. Un professionnel de la santé qui pratique l\'oncologie est un oncologue. Le service d\'oncologie propose des traitements, notamment de radiothérapie et de chimiothérapie, pour les tumeurs cancéreuses et les troubles sanguins.', 'Active'),
(8, 'Orthopediste', 'Traite les affections liées au système musculo-squelettique, notamment les articulations, les ligaments, les os, les muscles, les tendons et les nerfs', 'Active'),
(9, 'Radiologie', 'Traite de l\'étude et de l\'application de la technologie d\'imagerie comme XRay', 'Active');

-- --------------------------------------------------------

--
-- Structure de la table `doctor`
--

CREATE TABLE `doctor` (
  `doctorid` int(10) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `education` varchar(25) NOT NULL,
  `experience` float(11,1) NOT NULL,
  `consultancy_charge` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `mobileno`, `departmentid`, `loginid`, `password`, `status`, `education`, `experience`, `consultancy_charge`) VALUES
(1, 'kouadio jules', '7002225650', 1, 'kouajule', 'password', 'Active', 'MBBS', 7.0, 7.00),
(2, 'julien koffi', '7023695696', 2, 'julekof', 'password', 'Active', 'DM', 4.0, 400.00),
(3, 'traore coulibaly', '7014545470', 2, 'coul', 'password', 'Active', 'DM', 7.0, 500.00),
(4, 'bouabre ankoss', '7025558690', 3, 'ankoss', 'password', 'Active', 'MD', 4.0, 155.00),
(5, 'boly yaya', '7854025410', 4, 'yaya', 'password', 'Active', 'DM', 5.0, 75.00),
(6, 'gribgahi alain', '7410002540', 5, 'gribgahi', 'password', 'Active', 'MD', 8.0, 4200.00),
(7, 'drogba alan', '7012569990', 7, 'drogba', 'password', 'Active', 'MD', 5.0, 995.00),
(8, 'kouame ben', '7012225470', 6, 'ben', 'password', 'Active', 'DM', 3.0, 689.00);

-- --------------------------------------------------------

--
-- Structure de la table `doctor_timings`
--

CREATE TABLE `doctor_timings` (
  `doctor_timings_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `available_day` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `doctor_timings`
--

INSERT INTO `doctor_timings` (`doctor_timings_id`, `doctorid`, `start_time`, `end_time`, `available_day`, `status`) VALUES
(17, 35, '09:30:00', '13:00:00', '', 'Active'),
(18, 36, '13:30:00', '17:00:00', '', 'Active'),
(19, 37, '14:00:00', '18:00:00', '', 'Active'),
(20, 38, '17:00:00', '21:00:00', '', 'Active'),
(21, 39, '13:00:00', '19:00:00', '', 'Active'),
(22, 40, '07:00:00', '11:00:00', '', 'Active'),
(23, 41, '13:30:00', '16:30:00', '', 'Active'),
(24, 42, '11:30:00', '14:30:00', '', 'Active'),
(25, 43, '12:30:00', '16:30:00', '', 'Active'),
(26, 44, '21:30:00', '12:30:00', '', 'Active'),
(27, 36, '01:03:00', '13:03:00', '', 'Active'),
(28, 61, '11:11:00', '19:07:00', '', 'Active'),
(29, 35, '11:11:00', '16:44:00', '', 'Active'),
(30, 35, '01:10:00', '16:11:00', '', 'Active'),
(31, 35, '01:02:00', '15:04:00', '2018-03-26', 'Active'),
(32, 35, '16:25:00', '01:00:00', '', 'Active'),
(33, 1, '18:00:00', '00:02:00', '', 'Active'),
(34, 2, '07:36:00', '15:37:00', '', 'Active'),
(35, 7, '09:24:00', '16:24:00', '', 'Active');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `admissiondate` date NOT NULL,
  `admissiontime` time NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `loginid` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissiontime`, `address`, `mobileno`, `city`, `pincode`, `loginid`, `password`, `bloodgroup`, `gender`, `dob`, `status`) VALUES
(1, 'Johnny', '2019-06-15', '18:47:22', 'Dhanmondi', '2125798361', 'Dhaka', '1207', 'admin', '123456789', 'O+', 'MALE', '1990-01-01', 'Active'),
(3, 'Christine Moore', '2021-06-24', '14:38:04', '4327 Â Pride Avenue', '7012225690', 'Elmhurst', '63520', 'christine', 'password', 'A-', 'Female', '1992-02-12', 'Active'),
(4, 'Demoname', '2021-06-24', '15:26:32', 'demo address', '7474747474', 'demo city', '', 'demo', 'password', '', 'Male', '1995-02-02', 'Active'),
(5, 'Thomas Walters', '2021-06-24', '18:44:22', '1723  Cinnamon Lane', '7023658800', 'San Antonio', '', 'thomas', 'password', '', 'Female', '1992-03-12', 'Active'),
(6, 'Eryn Carlos', '2021-06-24', '19:34:27', '2649 Wayside Lane', '7012225896', 'San Jose', '', 'carlos', 'password', '', 'Female', '1994-03-12', 'Active'),
(7, 'ba', '2024-06-22', '02:37:45', 'riviera 2', '0735325125', 'Riviera ', '', 'ba', '987654321', '', 'Male', '2000-06-12', 'Active'),
(8, 'leandre', '2024-06-22', '02:51:41', 'riviera 2', '0708601432', 'Riviera', '', 'leandre', 'leandre0', '', 'Female', '2000-05-27', 'Active'),
(9, 'serge', '2024-06-22', '03:01:33', 'abidjan', '0708070807', 'bouake', '', 'serge', '0708070807', '', 'Male', '1999-06-12', 'Active'),
(10, 'eric', '2024-06-23', '00:57:55', 'bpabidjan', '44444444', 'rio', '', 'eric', '\"\"\"\"\"\"\"\"', '', 'Male', '2000-06-16', 'Active');

-- --------------------------------------------------------

--
-- Structure de la table `register`
--

CREATE TABLE `register` (
  `registerid` int(11) NOT NULL,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `confirmpassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `register`
--

INSERT INTO `register` (`registerid`, `loginname`, `password`, `confirmpassword`) VALUES
(1, 'John', '12345', '12345');

-- --------------------------------------------------------

--
-- Structure de la table `room`
--

CREATE TABLE `room` (
  `roomid` int(10) NOT NULL,
  `roomtype` varchar(25) NOT NULL,
  `roomno` int(10) NOT NULL,
  `noofbeds` int(10) NOT NULL,
  `room_tariff` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `room`
--

INSERT INTO `room` (`roomid`, `roomtype`, `roomno`, `noofbeds`, `room_tariff`, `status`) VALUES
(15, 'GENERAL WARD', 1, 20, 500.00, 'Active'),
(16, 'SPECIAL WARD', 2, 10, 100.00, 'Active'),
(17, 'GENERAL WARD', 2, 10, 500.00, 'Active'),
(18, 'GENERAL WARD', 121, 13, 150.00, 'Active'),
(19, 'GENERAL WARD', 850, 11, 500.00, 'Active');

-- --------------------------------------------------------

--
-- Structure de la table `service_type`
--

CREATE TABLE `service_type` (
  `service_type_id` int(10) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  `servicecharge` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `service_type`
--

INSERT INTO `service_type` (`service_type_id`, `service_type`, `servicecharge`, `description`, `status`) VALUES
(10, 'X-ray', 250.00, 'To take fractured photo copy', 'Active'),
(11, 'Scanning', 450.00, 'To scan body from injury', 'Active'),
(12, 'MRI', 300.00, 'Regarding body scan', 'Active'),
(13, 'Blood Testing', 150.00, 'To detect the type of disease', 'Active'),
(14, 'Diagnosis', 210.00, 'To analyse the diagnosis', 'Active');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `createddateandtime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`userid`, `loginname`, `password`, `patientname`, `mobileno`, `email`, `createddateandtime`) VALUES
(1, 'admin', 'admin', 'admin', '', '', '2017-12-14 11:21:45');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`),
  ADD UNIQUE KEY `adminname` (`adminname`);

--
-- Index pour la table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`);

--
-- Index pour la table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentid`);

--
-- Index pour la table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`);

--
-- Index pour la table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  ADD PRIMARY KEY (`doctor_timings_id`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD KEY `loginid` (`loginid`);

--
-- Index pour la table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`registerid`);

--
-- Index pour la table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomid`);

--
-- Index pour la table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`service_type_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `department`
--
ALTER TABLE `department`
  MODIFY `departmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  MODIFY `doctor_timings_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `register`
--
ALTER TABLE `register`
  MODIFY `registerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `room`
--
ALTER TABLE `room`
  MODIFY `roomid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `service_type`
--
ALTER TABLE `service_type`
  MODIFY `service_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
