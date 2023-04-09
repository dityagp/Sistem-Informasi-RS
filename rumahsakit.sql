-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2021 pada 07.32
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `appointment`
--

CREATE TABLE `appointment` (
  `id_pendaftaran` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `gejala` varchar(256) NOT NULL,
  `pesan` varchar(256) NOT NULL,
  `status_janji` varchar(50) NOT NULL DEFAULT 'queue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `appointment`
--

INSERT INTO `appointment` (`id_pendaftaran`, `id_user`, `id_jadwal`, `gejala`, `pesan`, `status_janji`) VALUES
(1, 9, 2, 'sakit kepala', 'sakit kepala sebelah', 'queue'),
(3, 9, 9, 'alergi', 'gatal', 'done'),
(4, 9, 3, 'pusing berkunang - kunang', '', 'queue'),
(5, 9, 3, 'gusi bengkak', '', 'done'),
(7, 9, 3, 'sesak nafas', '', 'done'),
(8, 9, 3, 'demam ', 'anak saya demam', 'done'),
(9, 13, 4, 'gigi saya ada karang giginya', 'semoga karang gigi saya bisa segera hilang', 'queue'),
(10, 16, 7, 'nyeri usus', '', 'queue'),
(11, 17, 4, 'gusi bengkak', 'sudah 2 minggu', 'queue');

-- --------------------------------------------------------

--
-- Struktur dari tabel `checkup`
--

CREATE TABLE `checkup` (
  `id_checkup` int(5) NOT NULL,
  `id_user` int(5) NOT NULL,
  `paket` varchar(128) NOT NULL,
  `tanggal` date NOT NULL,
  `pesan` varchar(248) NOT NULL,
  `status_checkup` varchar(10) NOT NULL DEFAULT 'queue'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `checkup`
--

INSERT INTO `checkup` (`id_checkup`, `id_user`, `paket`, `tanggal`, `pesan`, `status_checkup`) VALUES
(1, 9, 'Woman Silver Packet', '2021-01-05', '', 'queue'),
(2, 13, 'Covid-19 Checkup', '2021-06-13', 'Semoga tidak positif aamiinn', 'done'),
(3, 16, 'Covid-19 Checkup', '2021-06-21', '', 'queue'),
(4, 17, 'Covid-19 Checkup', '2021-06-23', 'sudah 3 hari saya demam', 'queue');

-- --------------------------------------------------------

--
-- Struktur dari tabel `doctors`
--

CREATE TABLE `doctors` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` varchar(128) NOT NULL,
  `email_dokter` varchar(128) NOT NULL,
  `spesialisasi` varchar(50) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `doctors`
--

INSERT INTO `doctors` (`id_dokter`, `nama_dokter`, `email_dokter`, `spesialisasi`, `nomor_telepon`, `kota`) VALUES
(1, 'dr. Marthin Limba, Sp. PD', 'marthin.limba@gmail.com', 'Penyakit Dalam', '087702840399', 'surabaya'),
(2, 'drg. Putri', 'putri@gmail.com', 'Gigi', '087702840399', 'jakarta'),
(3, 'dr. Nadira Sp. A', 'nadira@gmail.com', 'Anak', '0871513545212', 'bandung'),
(4, 'dr. Rofiah, Sp.Kk', 'rofiah@gmail.com', 'Kulit Kelamin', '08123456789', 'jakarta'),
(5, 'dr. Sepda, Sp.PD', 'sepda@gmail.com', 'Penyakit Dalam', '0871513545', 'solo'),
(6, 'dr. Roni, Sp.JP', 'roni@gmail.com', 'Jantung', '087702840399', 'jakarta'),
(7, 'dr. Sian, Sp.PD', 'sian@gmail.com', 'Penyakit Dalam', '081333882162', 'surabaya'),
(8, 'dr. Kukuh', 'kukuh@gmail.com', 'Paru-paru', '0871513545212', 'surabaya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedule`
--

CREATE TABLE `schedule` (
  `idSchedule` int(11) NOT NULL,
  `idDoctors` int(11) NOT NULL,
  `dateSchedule` date NOT NULL,
  `daySchedule` varchar(10) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `avail` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `schedule`
--

INSERT INTO `schedule` (`idSchedule`, `idDoctors`, `dateSchedule`, `daySchedule`, `starttime`, `endtime`, `avail`) VALUES
(2, 1, '2020-12-25', 'Rabu', '13:00:00', '00:00:00', 'full'),
(3, 1, '2021-01-09', 'Jumat', '12:00:00', '12:30:00', 'available'),
(4, 2, '2020-12-27', 'Sabtu', '12:00:00', '00:00:00', 'available'),
(5, 3, '2021-01-25', 'Senin', '08:30:00', '09:45:00', 'available'),
(6, 4, '2021-01-09', 'Selasa', '12:00:00', '09:45:00', 'available'),
(7, 5, '2021-01-01', 'Minggu', '15:00:00', '15:45:00', 'available'),
(8, 6, '2020-12-25', 'Kamis', '06:30:00', '09:00:00', 'available'),
(9, 7, '2020-12-16', 'Selasa', '15:00:00', '00:00:00', 'available'),
(10, 8, '2021-01-15', 'Senin', '13:00:00', '15:45:00', 'available');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spesialisasi`
--

CREATE TABLE `spesialisasi` (
  `jenis_spesialisasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `spesialisasi`
--

INSERT INTO `spesialisasi` (`jenis_spesialisasi`) VALUES
('Anak'),
('Bedah Syaraf'),
('Bedah Umum'),
('Dokter Umum'),
('Gigi'),
('Gizi'),
('Jantung'),
('Kandungan'),
('Kanker'),
('Paru-paru'),
('Penyakit Dalam'),
('Psikologi'),
('THT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `usersId` int(11) NOT NULL,
  `usersName` varchar(128) NOT NULL,
  `usersUsername` varchar(128) NOT NULL,
  `usersEmail` varchar(128) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `usersPassword` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`usersId`, `usersName`, `usersUsername`, `usersEmail`, `phoneNumber`, `usersPassword`) VALUES
(11, 'luluk', 'luluk', 'luluk@gmail.com', '087702840399', '$2y$10$BqLMSzvxoPStCnHNK9iFS.ydVMUqXOYMBmaAwKVJB95gmqkbjgK1O'),
(12, 'budi santoso', 'budi', 'budi@gmail.com', '08123456789', '$2y$10$ONSVqnWN/DNQ9d6JePVQA.iZw9wWXBjLB8a2e2HY88zbFxOJx2LFO'),
(13, 'Ditya Galassepda Putri', 'dityagp', 'dityajoe73@gmail.com', '081333882162', '$2y$10$oKpKZB5HV6UCXEaqwYplAOLvKYdo.o8iGb/z6AC48eMhoU2kIxrZW'),
(14, 'Intan Nadira Ayu C.', 'intan', 'intanchairunnissa@student.uns.ac.id', '081226842609', '$2y$10$bVt6ruV9nBvDrCT.BIJDQO6Q0yoSe1ztNtQz6dYR670/UDFMVs7Ay'),
(15, 'Dita Syahra', 'Dita', 'dita@gmail.com', '08133388216', '$2y$10$eeXStNbh4KzrxESdYKe64.Xgwxj4E2B8udS8LCaxzYtx.6hTzY0w6'),
(16, 'risqi andy', 'risqi', 'risqiandy@gmail.com', '081333554466', '$2y$10$dGmgRo2inl7Eaxsbzzqcp.KmbosTKB8DePK2G.MFDEIhv3yGFl5lm'),
(17, 'lala yeye', 'lala', 'lala@gmail.com', '08133364289', '$2y$10$gEYMFHxwtNvQVlYw4cCcBuvWYrM0o5hvdW.4Wu7LWADsQ0rdPORLO');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id_pendaftaran`);

--
-- Indeks untuk tabel `checkup`
--
ALTER TABLE `checkup`
  ADD PRIMARY KEY (`id_checkup`);

--
-- Indeks untuk tabel `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`idSchedule`);

--
-- Indeks untuk tabel `spesialisasi`
--
ALTER TABLE `spesialisasi`
  ADD PRIMARY KEY (`jenis_spesialisasi`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usersId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id_pendaftaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `checkup`
--
ALTER TABLE `checkup`
  MODIFY `id_checkup` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `schedule`
--
ALTER TABLE `schedule`
  MODIFY `idSchedule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `usersId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
