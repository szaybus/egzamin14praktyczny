-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 21 Lis 2016, 14:54
-- Wersja serwera: 10.1.19-MariaDB
-- Wersja PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `egzamin`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekarz`
--

CREATE TABLE `lekarz` (
  `ID_lekarz` int(11) NOT NULL,
  `imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `nr_uprawnien` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `lekarz`
--

INSERT INTO `lekarz` (`ID_lekarz`, `imie`, `nazwisko`, `nr_uprawnien`) VALUES
(1, 'Stefan', 'Mądry', 45852),
(2, 'Małgorzata', 'Bystra', 7895),
(3, 'Albert', 'Chorowity', 74112),
(4, 'Test', 'test2', 142555);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pacjent`
--

CREATE TABLE `pacjent` (
  `ID_pacjent` int(11) NOT NULL,
  `imie` text NOT NULL,
  `nazwisko` text NOT NULL,
  `pesel` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `pacjent`
--

INSERT INTO `pacjent` (`ID_pacjent`, `imie`, `nazwisko`, `pesel`) VALUES
(1, 'Jan', 'Zięba', 12345678912),
(2, 'Adam', 'Brzęczyszczykiewicz', 98765432198),
(3, 'Joanna', 'Nowak', 45612378912),
(4, 'Stefan', 'Burczymucha', 12457896312);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wizyta`
--

CREATE TABLE `wizyta` (
  `ID_wizyta` int(11) NOT NULL,
  `termin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pacjent` int(11) NOT NULL,
  `lekarz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `wizyta`
--

INSERT INTO `wizyta` (`ID_wizyta`, `termin`, `pacjent`, `lekarz`) VALUES
(1, '2016-11-21 12:27:53', 1, 1),
(2, '2016-11-21 12:28:01', 2, 1),
(3, '2016-11-21 12:28:07', 3, 1),
(4, '2016-11-21 12:28:17', 3, 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `lekarz`
--
ALTER TABLE `lekarz`
  ADD PRIMARY KEY (`ID_lekarz`);

--
-- Indexes for table `pacjent`
--
ALTER TABLE `pacjent`
  ADD PRIMARY KEY (`ID_pacjent`);

--
-- Indexes for table `wizyta`
--
ALTER TABLE `wizyta`
  ADD PRIMARY KEY (`ID_wizyta`),
  ADD KEY `pacjent` (`pacjent`),
  ADD KEY `lekarz` (`lekarz`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `lekarz`
--
ALTER TABLE `lekarz`
  MODIFY `ID_lekarz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `pacjent`
--
ALTER TABLE `pacjent`
  MODIFY `ID_pacjent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `wizyta`
--
ALTER TABLE `wizyta`
  MODIFY `ID_wizyta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `wizyta`
--
ALTER TABLE `wizyta`
  ADD CONSTRAINT `wizyta_ibfk_1` FOREIGN KEY (`lekarz`) REFERENCES `lekarz` (`ID_lekarz`),
  ADD CONSTRAINT `wizyta_ibfk_2` FOREIGN KEY (`pacjent`) REFERENCES `pacjent` (`ID_pacjent`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
