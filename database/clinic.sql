-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Bulan Mei 2024 pada 14.51
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator`
--

CREATE TABLE `administrator` (
  `id_admin` int(11) NOT NULL,
  `name_admin` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `administrator`
--

INSERT INTO `administrator` (`id_admin`, `name_admin`, `password`) VALUES
(1, 'Admin1', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `appointment`
--

CREATE TABLE `appointment` (
  `id_appointment` int(11) NOT NULL,
  `id_patient` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `date_appointment` date NOT NULL,
  `time_appointment` varchar(50) NOT NULL,
  `status` enum('Booked','Approved','Rejected','Completed') NOT NULL,
  `message` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `appointment`
--

INSERT INTO `appointment` (`id_appointment`, `id_patient`, `id_doctor`, `date_appointment`, `time_appointment`, `status`, `message`) VALUES
(1, 2, 1, '2024-05-09', '09.00 - 10.00', 'Approved', 'Testing'),
(2, 2, 1, '2024-05-16', '09.00 - 10.00', 'Booked', 'Testing'),
(3, 2, 1, '2024-05-23', '11.00 - 12.00', 'Booked', 'Test'),
(4, 3, 6, '2024-05-10', '13.00 - 14.00', 'Approved', 'Test'),
(5, 3, 6, '2024-05-17', '11.00 - 12.00', 'Booked', 'Testing'),
(6, 4, 8, '2024-05-10', '13.00 - 14.00', 'Booked', 'Test'),
(7, 5, 5, '2024-05-13', '13.00 - 14.00', 'Booked', 'Test'),
(8, 6, 4, '2024-05-09', '09.00 - 10.00', 'Approved', 'Test'),
(10, 6, 4, '2024-05-22', '09.00 - 10.00', 'Booked', 'Test'),
(11, 6, 8, '2024-05-31', '09.00 - 10.00', 'Approved', 'Test'),
(12, 5, 7, '2024-05-20', '13.00 - 14.00', 'Booked', 'Test'),
(13, 2, 6, '2024-06-01', '13.00 - 14.00', 'Booked', 'Test');

-- --------------------------------------------------------

--
-- Struktur dari tabel `doctor`
--

CREATE TABLE `doctor` (
  `id_doctor` int(11) NOT NULL,
  `id_specialist` int(11) NOT NULL,
  `name_doctor` varchar(50) NOT NULL,
  `photo_doctor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `doctor`
--

INSERT INTO `doctor` (`id_doctor`, `id_specialist`, `name_doctor`, `photo_doctor`) VALUES
(1, 1, 'Dr. Budi Santoso', '1.jpg'),
(2, 2, 'Dr. Lisa Ayu', '2.jpg'),
(3, 3, 'Dr. Andre Pratama', '3.jpg'),
(4, 4, 'Dr. Rizki Santoso', '4.jpg'),
(5, 5, 'Dr. Amanda Putri', '5.jpg'),
(6, 6, 'Dr. Bella Surya', '6.jpg'),
(7, 4, 'Dr. Cindy Dewi', '7.jpg'),
(8, 3, 'Dr. Nina Wijaya', '8.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `patient`
--

CREATE TABLE `patient` (
  `id_patient` int(11) NOT NULL,
  `name_patient` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `patient`
--

INSERT INTO `patient` (`id_patient`, `name_patient`, `address`, `email`, `password`) VALUES
(1, 'Bintang', 'Cikarang Utara', 'bintang@gmail.com', '123'),
(2, 'Hanif', '', 'hanif@gmail.com', '$2y$10$TDr7UNuXbOQXrfvieDbHdO70ViZ3gFfZRF6ce6D2nxRnUntHwNzGS'),
(3, 'Wira', '', 'wira@gmail.com', '$2y$10$/JFvATbSHrhcVwRKopJMx.wU7iS6ivy9Zv5gQMNfeLfpF1hcoIZMe'),
(4, 'bambang', '', 'bambang@gmail.com', '$2y$10$fOR0g3M0.EQGIrL3FrMRE.U7.BP2GGdGph6f7aHKEfSF4T.SD1C0S'),
(5, 'caca', '', 'caca@gmail.com', '$2y$10$j/hCOczd4.8bC4uM9RgoZ.CmXzNsktlTZfasVOZBejp3OaGj7pLAS'),
(6, 'maya', '', 'maya@gmail.com', '$2y$10$VOIyi8LTwKKjzTBGBUXPYu2/mYf7alqREnyPTRQFIC7hdgN4CL7ZO');

-- --------------------------------------------------------

--
-- Struktur dari tabel `specialist`
--

CREATE TABLE `specialist` (
  `id_specialist` int(11) NOT NULL,
  `name_specialist` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `picture` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `specialist`
--

INSERT INTO `specialist` (`id_specialist`, `name_specialist`, `description`, `picture`) VALUES
(1, 'Opthomology', 'Eye Care: Comprehensive solutions for your vision health.', 'service-1.jpg'),
(2, 'Cardiology', 'Heart Health: Expert care for your cardiovascular well-being.', 'service-2.jpg'),
(3, 'Dental Care', 'Oral Health: Comprehensive dental solutions for a brighter smile.', 'service-3.jpg'),
(4, 'Child Care', 'Pediatric Care: Specialized healthcare for your little ones.', 'service-4.jpg'),
(5, 'Pulmology', 'Lung Health: Expert care for respiratory well-being.', 'service-6.jpg'),
(6, 'Gynecology', 'Women\'s Health: Dedicated care for women\'s reproductive health.', 'service-8.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id_appointment`),
  ADD KEY `id_patient` (`id_patient`),
  ADD KEY `id_doctor` (`id_doctor`);

--
-- Indeks untuk tabel `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id_doctor`),
  ADD KEY `id_specialist` (`id_specialist`);

--
-- Indeks untuk tabel `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id_patient`);

--
-- Indeks untuk tabel `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`id_specialist`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id_appointment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id_doctor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `patient`
--
ALTER TABLE `patient`
  MODIFY `id_patient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id_specialist` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id_patient`),
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id_doctor`);

--
-- Ketidakleluasaan untuk tabel `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`id_specialist`) REFERENCES `specialist` (`id_specialist`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
