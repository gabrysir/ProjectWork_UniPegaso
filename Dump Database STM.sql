-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql207.infinityfree.com
-- Creato il: Sept 09, 2025 alle 21:53
-- Versione del server: 11.4.7-MariaDB
-- Versione PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_39159108_stm`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `AUTISTI`
--

CREATE TABLE `AUTISTI` (
  `ID_Autista` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `DataNascita` date DEFAULT NULL,
  `NumeroPatente` varchar(20) NOT NULL,
  `DataScadenzaPatente` date DEFAULT NULL,
  `StatoAssunzione` varchar(20) NOT NULL,
  `CodiceFiscale` varchar(16) DEFAULT NULL,
  `DataAssunzione` date DEFAULT NULL,
  `ContattoEmergenza` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `AUTISTI`
--

INSERT INTO `AUTISTI` (`ID_Autista`, `Nome`, `Cognome`, `DataNascita`, `NumeroPatente`, `DataScadenzaPatente`, `StatoAssunzione`, `CodiceFiscale`, `DataAssunzione`, `ContattoEmergenza`) VALUES
(1, 'Giuseppe', 'Mancini', '1975-02-10', 'RM12345A', '2028-06-30', 'Attivo', 'MNCGPP75B10H501C', '2000-09-01', '3331112220'),
(2, 'Francesca', 'De Luca', '1982-07-20', 'NA67890B', '2029-01-15', 'Attivo', 'DLCRNC82L60F839A', '2005-03-10', '3390001112'),
(3, 'Antonio', 'Conti', '1970-11-05', 'MI98765C', '2027-10-20', 'Attivo', 'CNTNTN70S05H501G', '1998-07-01', '3382223334'),
(4, 'Maria', 'Galli', '1990-03-25', 'FI11223D', '2030-04-01', 'Attivo', 'GLLMRA90C65D612E', '2010-02-01', '3404445556'),
(5, 'Roberto', 'Moretti', '1988-09-12', 'BO44556E', '2029-08-01', 'Attivo', 'MRTFRB88P12A794R', '2012-05-15', '3476667778'),
(6, 'Silvia', 'Riva', '1993-01-30', 'TO77889F', '2031-02-28', 'Attivo', 'RVASLV93A70L219I', '2015-11-01', '3288889990'),
(7, 'Alessio', 'Colombo', '1980-04-01', 'VE00112G', '2028-09-10', 'Attivo', 'CLMALSS80D01M115', '2003-06-20', '3350011223'),
(8, 'Laura', 'Greco', '1991-06-18', 'GE33445H', '2030-12-05', 'Attivo', 'GRCLRA91H58L219J', '2014-08-01', '3491122334'),
(9, 'Fabio', 'Pellegrini', '1973-10-03', 'BA66778I', '2027-03-20', 'Attivo', 'PLLFBA73R03A662K', '2001-01-01', '3662233445'),
(10, 'Chiara', 'Lombardi', '1987-12-07', 'RM55667J', '2029-05-10', 'Attivo', 'LMBCHR87T47H501D', '2008-04-01', '3773344556'),
(11, 'Carlo', 'Vino', '1980-06-02', 'AC11111', '2025-10-25', 'Attivo', 'vincrl80P46f6043', '2025-07-04', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `AUTISTI_QUALIFICHE`
--

CREATE TABLE `AUTISTI_QUALIFICHE` (
  `ID_AutistaQualifica` int(11) NOT NULL,
  `ID_Autista` int(11) NOT NULL,
  `ID_Qualifica` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `AUTISTI_QUALIFICHE`
--

INSERT INTO `AUTISTI_QUALIFICHE` (`ID_AutistaQualifica`, `ID_Autista`, `ID_Qualifica`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 3),
(5, 3, 1),
(6, 3, 4),
(7, 4, 1),
(8, 4, 5),
(9, 5, 1),
(10, 6, 1),
(11, 11, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `BIGLIETTI`
--

CREATE TABLE `BIGLIETTI` (
  `ID_Biglietto` int(11) NOT NULL,
  `ID_Ordine` int(11) NOT NULL,
  `ID_Passeggero` int(11) DEFAULT NULL,
  `ID_Prenotazione` int(11) DEFAULT NULL,
  `TipoBiglietto` varchar(50) NOT NULL,
  `Prezzo` decimal(10,2) NOT NULL,
  `DataEmissione` datetime NOT NULL,
  `DataValiditaInizio` datetime NOT NULL,
  `DataValiditaFine` datetime NOT NULL,
  `StatoBiglietto` varchar(20) NOT NULL COMMENT 'es. Emesso, Validato, Scaduto, Annullato',
  `ModalitaPagamento` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `BIGLIETTI`
--

INSERT INTO `BIGLIETTI` (`ID_Biglietto`, `ID_Ordine`, `ID_Passeggero`, `ID_Prenotazione`, `TipoBiglietto`, `Prezzo`, `DataEmissione`, `DataValiditaInizio`, `DataValiditaFine`, `StatoBiglietto`, `ModalitaPagamento`) VALUES
(1, 1, 1, 1, 'Corsa Singola', '1.50', '2025-06-10 10:00:10', '2025-06-15 06:00:00', '2025-06-15 07:00:00', 'Emesso', 'Carta di Credito'),
(2, 1, 1, NULL, 'Corsa Singola', '1.50', '2025-06-10 10:00:15', '2025-06-15 07:00:00', '2025-06-15 08:00:00', 'Emesso', 'Carta di Credito'),
(3, 2, 2, 2, 'Corsa Singola', '1.50', '2025-06-10 10:30:10', '2025-06-15 06:00:00', '2025-06-15 07:00:00', 'Emesso', 'PayPal'),
(4, 3, NULL, NULL, 'Giornaliero', '5.00', '2025-06-11 11:00:10', '2025-06-11 00:00:00', '2025-06-11 23:59:59', 'Emesso', 'Contanti'),
(5, 4, 3, 3, 'Corsa Singola', '1.50', '2025-06-11 11:30:10', '2025-06-15 14:00:00', '2025-06-15 15:00:00', 'Emesso', 'Carta di Credito'),
(6, 4, 3, NULL, 'Corsa Singola', '1.50', '2025-06-11 11:30:15', '2025-06-15 14:00:00', '2025-06-15 15:00:00', 'Emesso', 'Carta di Credito'),
(7, 5, 4, 4, 'Corsa Singola', '1.50', '2025-06-12 09:00:10', '2025-06-16 07:00:00', '2025-06-16 08:00:00', 'Emesso', 'PayPal'),
(8, 5, 4, NULL, 'Corsa Singola', '1.50', '2025-06-12 09:00:15', '2025-06-16 08:00:00', '2025-06-16 09:00:00', 'Emesso', 'PayPal'),
(9, 6, 5, 5, 'Corsa Singola', '1.50', '2025-06-12 14:00:10', '2025-06-16 15:00:00', '2025-06-16 16:00:00', 'Emesso', 'Contanti'),
(10, 7, NULL, NULL, 'Settimanale', '10.00', '2025-06-13 16:00:10', '2025-06-16 00:00:00', '2025-06-22 23:59:59', 'Emesso', 'Carta di Credito'),
(11, 8, 6, 6, 'Corsa Singola', '1.50', '2025-06-13 17:00:10', '2025-06-17 06:00:00', '2025-06-17 07:00:00', 'Emesso', 'PayPal'),
(12, 9, 7, 7, 'Corsa Singola', '1.50', '2025-06-14 08:30:10', '2025-06-17 08:00:00', '2025-06-17 09:00:00', 'Emesso', 'Contanti'),
(13, 9, 7, NULL, 'Corsa Singola', '1.50', '2025-06-14 08:30:15', '2025-06-17 09:00:00', '2025-06-17 10:00:00', 'Emesso', 'Contanti'),
(14, 10, 8, 8, 'Corsa Singola', '1.50', '2025-06-14 09:00:10', '2025-06-16 08:00:00', '2025-06-16 09:00:00', 'Emesso', 'Carta di Credito'),
(15, 1, 1, 11, 'Corsa Singola', '1.50', '2025-06-14 11:00:10', '2025-06-15 06:00:00', '2025-06-15 07:00:00', 'Emesso', 'Carta di Credito'),
(16, 2, 2, 12, 'Corsa Singola', '1.50', '2025-06-14 12:00:10', '2025-06-15 06:00:00', '2025-06-15 07:00:00', 'Annullato', 'PayPal'),
(17, 3, 3, 13, 'Corsa Singola', '1.50', '2025-06-14 13:00:10', '2025-06-15 14:00:00', '2025-06-15 15:00:00', 'Emesso', 'Contanti'),
(18, 4, 4, 14, 'Corsa Singola', '1.50', '2025-06-15 08:00:10', '2025-06-16 07:00:00', '2025-06-16 08:00:00', 'Emesso', 'Carta di Credito'),
(19, 5, 5, 15, 'Corsa Singola', '1.50', '2025-06-15 09:00:10', '2025-06-16 15:00:00', '2025-06-16 16:00:00', 'Emesso', 'Contanti'),
(20, 6, 6, 16, 'Corsa Singola', '1.50', '2025-06-15 10:00:10', '2025-06-17 06:00:00', '2025-06-17 07:00:00', 'Emesso', 'PayPal'),
(21, 11, 11, NULL, 'Giornaliero', '2.00', '2025-06-15 19:56:00', '2025-06-15 19:56:00', '2025-07-05 01:57:00', 'Emesso', NULL),
(22, 12, 3, NULL, 'Giornaliero', '2.00', '2025-06-15 20:04:00', '2025-06-15 20:04:00', '2025-07-04 02:04:00', 'Emesso', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `COMPONENTI_VEICOLO`
--

CREATE TABLE `COMPONENTI_VEICOLO` (
  `ID_Componente` int(11) NOT NULL,
  `ID_Veicolo` varchar(20) NOT NULL,
  `NomeComponente` varchar(100) NOT NULL,
  `DescrizioneComponente` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `COMPONENTI_VEICOLO`
--

INSERT INTO `COMPONENTI_VEICOLO` (`ID_Componente`, `ID_Veicolo`, `NomeComponente`, `DescrizioneComponente`) VALUES
(1, 'AB123CD', 'Motore Diesel', 'Motore principale'),
(2, 'AB123CD', 'Freni Anteriori', 'Dischi e pastiglie anteriori'),
(3, 'EF456GH', 'Trasmissione Automatica', 'Sistema di cambio marce'),
(4, 'EF456GH', 'Pneumatici Posteriori DX', 'Gomma posteriore destra'),
(5, 'IL789MN', 'Sistema A/C', 'Aria condizionata passeggeri'),
(6, 'OP012QR', 'Batteria Principale', 'Batteria di avviamento'),
(7, 'ST345UV', 'Alternatore', 'Generatore di corrente'),
(8, 'WX678YZ', 'Sospensioni Posteriori', 'Ammortizzatori posteriori'),
(9, 'AZ987BX', 'Sterzo Assistito', 'Sistema di direzione'),
(10, 'CY654DV', 'Impianto Elettrico', 'Cablaggio generale');

-- --------------------------------------------------------

--
-- Struttura della tabella `CORSE`
--

CREATE TABLE `CORSE` (
  `ID_Corsa` int(11) NOT NULL,
  `ID_Itinerario` int(11) NOT NULL,
  `ID_Autista` int(11) NOT NULL,
  `ID_Veicolo` varchar(20) NOT NULL,
  `ID_Turno` int(11) NOT NULL,
  `NumeroLinea` varchar(10) NOT NULL,
  `OrarioPartenzaPrevisto` datetime NOT NULL,
  `OrarioArrivoPrevisto` datetime NOT NULL,
  `OrarioPartenzaEffettivo` datetime DEFAULT NULL,
  `OrarioArrivoEffettivo` datetime DEFAULT NULL,
  `StatoCorsa` varchar(20) NOT NULL COMMENT 'es. Pianificata, In Corso, Completata, Annullata'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `CORSE`
--

INSERT INTO `CORSE` (`ID_Corsa`, `ID_Itinerario`, `ID_Autista`, `ID_Veicolo`, `ID_Turno`, `NumeroLinea`, `OrarioPartenzaPrevisto`, `OrarioArrivoPrevisto`, `OrarioPartenzaEffettivo`, `OrarioArrivoEffettivo`, `StatoCorsa`) VALUES
(1, 1, 1, 'AB123CD', 1, 'L1', '2025-06-15 06:00:00', '2025-06-15 06:45:00', '2025-06-15 06:00:00', '2025-06-15 06:48:00', 'Completata'),
(2, 1, 1, 'AB123CD', 1, 'L1', '2025-06-15 07:00:00', '2025-06-15 07:45:00', '2025-06-15 07:02:00', '2025-06-15 07:49:00', 'Completata'),
(3, 2, 2, 'EF456GH', 2, 'L2', '2025-06-15 14:00:00', '2025-06-15 15:00:00', '2025-06-15 14:00:00', '2025-06-15 15:05:00', 'Completata'),
(4, 3, 3, 'IL789MN', 3, 'AERO', '2025-06-16 07:00:00', '2025-06-16 07:30:00', NULL, NULL, 'Pianificata'),
(5, 1, 4, 'CY654DV', 4, 'L1', '2025-06-16 15:00:00', '2025-06-16 15:45:00', NULL, NULL, 'Pianificata'),
(6, 1, 5, 'ST345UV', 5, 'L1', '2025-06-17 06:00:00', '2025-06-17 06:45:00', NULL, NULL, 'Pianificata'),
(7, 2, 6, 'AZ987BX', 5, 'L2', '2025-06-17 08:00:00', '2025-06-17 09:00:00', NULL, NULL, 'Pianificata'),
(8, 3, 7, 'OP012QR', 3, 'AERO', '2025-06-16 08:00:00', '2025-06-16 08:30:00', NULL, NULL, 'Pianificata'),
(9, 1, 8, 'AB123CD', 1, 'L1', '2025-06-15 08:00:00', '2025-06-15 08:45:00', '2025-06-15 08:00:00', '2025-06-15 08:47:00', 'Completata'),
(10, 2, 9, 'EF456GH', 2, 'L2', '2025-06-15 16:00:00', '2025-06-15 17:00:00', '2025-06-15 16:00:00', '2025-06-15 17:03:00', 'Completata'),
(11, 1, 10, 'CY654DV', 4, 'L1', '2025-06-16 16:00:00', '2025-06-16 16:45:00', NULL, NULL, 'Pianificata'),
(12, 2, 5, 'ST345UV', 5, 'L2', '2025-06-17 10:00:00', '2025-06-17 11:00:00', NULL, NULL, 'Pianificata'),
(13, 3, 7, 'OP012QR', 3, 'AERO', '2025-06-16 09:00:00', '2025-06-16 09:30:00', NULL, NULL, 'Pianificata'),
(14, 1, 8, 'AB123CD', 1, 'L1', '2025-06-15 09:00:00', '2025-06-15 09:45:00', '2025-06-15 09:01:00', '2025-06-15 09:46:00', 'Completata');

-- --------------------------------------------------------

--
-- Struttura della tabella `DISPONIBILITA_AUTISTI`
--

CREATE TABLE `DISPONIBILITA_AUTISTI` (
  `ID_Disponibilita` int(11) NOT NULL,
  `ID_Autista` int(11) NOT NULL,
  `DataInizioIndisponibilita` datetime NOT NULL,
  `DataFineIndisponibilita` datetime NOT NULL,
  `TipoIndisponibilita` varchar(50) NOT NULL COMMENT 'es. Ferie, Malattia, Riposo',
  `Note` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `DISPONIBILITA_AUTISTI`
--

INSERT INTO `DISPONIBILITA_AUTISTI` (`ID_Disponibilita`, `ID_Autista`, `DataInizioIndisponibilita`, `DataFineIndisponibilita`, `TipoIndisponibilita`, `Note`) VALUES
(1, 1, '2025-07-01 00:00:00', '2025-07-15 23:59:59', 'Ferie', 'Ferie estive programmate'),
(2, 2, '2025-06-20 08:00:00', '2025-06-20 17:00:00', 'Malattia', 'Visita medica'),
(3, 3, '2025-06-22 00:00:00', '2025-06-22 23:59:59', 'Riposo', 'Riposo compensativo');

-- --------------------------------------------------------

--
-- Struttura della tabella `FERMATE`
--

CREATE TABLE `FERMATE` (
  `ID_Fermata` int(11) NOT NULL,
  `NomeFermata` varchar(100) NOT NULL,
  `Indirizzo` varchar(255) DEFAULT NULL,
  `Latitudine` decimal(9,6) DEFAULT NULL,
  `Longitudine` decimal(9,6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `FERMATE`
--

INSERT INTO `FERMATE` (`ID_Fermata`, `NomeFermata`, `Indirizzo`, `Latitudine`, `Longitudine`) VALUES
(1, 'Stazione Centrale', 'Piazza Duca d\'Aosta 1, Milano', '45.485000', '9.200000'),
(2, 'Duomo', 'Piazza Duomo, Milano', '45.464000', '9.191000'),
(3, 'Castello Sforzesco', 'Piazza Castello, Milano', '45.470000', '9.179000'),
(4, 'Cadorna', 'Piazzale Luigi Cadorna, Milano', '45.469000', '9.176000'),
(5, 'Porta Genova', 'Piazzale Porta Genova, Milano', '45.454000', '9.175000'),
(6, 'Linate Aeroporto', 'Viale Forlanini, Milano', '45.452000', '9.278000'),
(7, 'San Babila', 'Piazza San Babila, Milano', '45.466000', '9.199000'),
(8, 'Venezia', 'Corso Venezia, Milano', '45.474000', '9.203000'),
(9, 'Repubblica', 'Piazza della Repubblica, Milano', '45.479000', '9.195000'),
(10, 'Garibaldi', 'Piazza Gae Aulenti, Milano', '45.484000', '9.189000'),
(11, 'Centrale FS', 'Piazza della Stazione 1, Firenze', '43.776000', '11.250000'),
(12, 'Ponte Vecchio', 'Ponte Vecchio, Firenze', '43.768000', '11.253000'),
(13, 'stazione centrale di Lecce', 'piazza ferrovia', '11.000000', '12.000000');

-- --------------------------------------------------------

--
-- Struttura della tabella `ITINERARI`
--

CREATE TABLE `ITINERARI` (
  `ID_Itinerario` int(11) NOT NULL,
  `NomeItinerario` varchar(100) NOT NULL,
  `Descrizione` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ITINERARI`
--

INSERT INTO `ITINERARI` (`ID_Itinerario`, `NomeItinerario`, `Descrizione`) VALUES
(1, 'Linea Urbana Nord', 'Itinerario che copre la zona nord della città'),
(2, 'Linea Urbana Sud', 'Itinerario che copre la zona sud della città'),
(3, 'Linea Aeroporto', 'Itinerario diretto per l\'aeroporto di Linate');

-- --------------------------------------------------------

--
-- Struttura della tabella `ITINERARI_TRATTE`
--

CREATE TABLE `ITINERARI_TRATTE` (
  `ID_ItinerarioTratta` int(11) NOT NULL,
  `ID_Itinerario` int(11) NOT NULL,
  `ID_Tratta` int(11) NOT NULL,
  `Ordine` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ITINERARI_TRATTE`
--

INSERT INTO `ITINERARI_TRATTE` (`ID_ItinerarioTratta`, `ID_Itinerario`, `ID_Tratta`, `Ordine`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 10, 5),
(6, 2, 5, 1),
(7, 2, 4, 2),
(8, 3, 1, 1),
(9, 3, 6, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `MANUTENZIONI`
--

CREATE TABLE `MANUTENZIONI` (
  `ID_Manutenzione` int(11) NOT NULL,
  `ID_Veicolo` varchar(20) NOT NULL,
  `ID_Pianificazione` int(11) DEFAULT NULL,
  `DataInizioIntervento` datetime NOT NULL,
  `DataFineIntervento` datetime DEFAULT NULL,
  `TipoManutenzione` varchar(50) NOT NULL COMMENT 'es. Ordinaria, Straordinaria, Preventiva',
  `DescrizioneIntervento` text DEFAULT NULL,
  `StatoManutenzione` varchar(20) NOT NULL COMMENT 'es. In Corso, Completata, Annullata',
  `CostoRicambi` decimal(10,2) DEFAULT NULL,
  `CostoManodopera` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `MANUTENZIONI`
--

INSERT INTO `MANUTENZIONI` (`ID_Manutenzione`, `ID_Veicolo`, `ID_Pianificazione`, `DataInizioIntervento`, `DataFineIntervento`, `TipoManutenzione`, `DescrizioneIntervento`, `StatoManutenzione`, `CostoRicambi`, `CostoManodopera`) VALUES
(1, 'IL789MN', 3, '2025-09-01 09:00:00', '2025-09-01 12:00:00', 'Ordinaria', 'Sostituzione filtri aria e carburante', 'Completata', '50.00', '30.00'),
(2, 'OP012QR', 4, '2025-06-28 08:00:00', NULL, 'Straordinaria', 'Controllo e riparazione impianto elettrico', 'In Corso', '120.00', '80.00'),
(3, 'AB123CD', NULL, '2025-06-25 14:00:00', '2025-06-25 16:00:00', 'Correttiva', 'Riparazione faro anteriore', 'Completata', '25.00', '20.00'),
(4, 'EF456GH', NULL, '2025-06-20 09:00:00', '2025-06-20 11:30:00', 'Ordinaria', 'Cambio olio motore', 'Completata', '80.00', '40.00'),
(5, 'OP012QR', 1, '2025-06-20 08:00:00', '2025-06-23 09:30:00', 'Preventiva', '', 'In Attesa Ricambi', '250.00', '100.00');

-- --------------------------------------------------------

--
-- Struttura della tabella `MANUTENZIONI_COMPONENTI`
--

CREATE TABLE `MANUTENZIONI_COMPONENTI` (
  `ID_ManutenzioneComponente` int(11) NOT NULL,
  `ID_Manutenzione` int(11) NOT NULL,
  `ID_Componente` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `MANUTENZIONI_COMPONENTI`
--

INSERT INTO `MANUTENZIONI_COMPONENTI` (`ID_ManutenzioneComponente`, `ID_Manutenzione`, `ID_Componente`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 10),
(4, 3, 1),
(5, 4, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `MANUTENZIONI_TECNICI`
--

CREATE TABLE `MANUTENZIONI_TECNICI` (
  `ID_ManutenzioneTecnico` int(11) NOT NULL,
  `ID_Manutenzione` int(11) NOT NULL,
  `ID_Tecnico` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `MANUTENZIONI_TECNICI`
--

INSERT INTO `MANUTENZIONI_TECNICI` (`ID_ManutenzioneTecnico`, `ID_Manutenzione`, `ID_Tecnico`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 2, 4),
(6, 5, 1),
(7, 5, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `ORDINI_ACQUISTO`
--

CREATE TABLE `ORDINI_ACQUISTO` (
  `ID_Ordine` int(11) NOT NULL,
  `ID_Passeggero` int(11) DEFAULT NULL,
  `DataOraAcquisto` datetime NOT NULL,
  `ImportoTotale` decimal(10,2) NOT NULL,
  `MetodoPagamento` varchar(50) NOT NULL,
  `StatoOrdine` varchar(20) NOT NULL,
  `EmailAcquirente` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `ORDINI_ACQUISTO`
--

INSERT INTO `ORDINI_ACQUISTO` (`ID_Ordine`, `ID_Passeggero`, `DataOraAcquisto`, `ImportoTotale`, `MetodoPagamento`, `StatoOrdine`, `EmailAcquirente`) VALUES
(1, 1, '2025-06-10 10:00:00', '3.00', 'Carta di Credito', 'Completato', 'mario.rossi@example.com'),
(2, 2, '2025-06-10 10:30:00', '1.50', 'PayPal', 'Completato', 'giulia.bianchi@example.com'),
(3, NULL, '2025-06-11 11:00:00', '5.00', 'Contanti', 'Completato', 'cliente.anonimo1@example.com'),
(4, 3, '2025-06-11 11:30:00', '1.50', 'Carta di Credito', 'Completato', 'luca.verdi@example.com'),
(5, 4, '2025-06-12 09:00:00', '3.00', 'PayPal', 'Completato', 'sara.ferrari@example.com'),
(6, 5, '2025-06-12 14:00:00', '1.50', 'Contanti', 'Completato', 'marco.russo@example.com'),
(7, NULL, '2025-06-13 16:00:00', '10.00', 'Carta di Credito', 'Completato', 'cliente.anonimo2@example.com'),
(8, 6, '2025-06-13 17:00:00', '1.50', 'PayPal', 'Completato', 'anna.esposito@example.com'),
(9, 7, '2025-06-14 08:30:00', '3.00', 'Contanti', 'Completato', 'paolo.ricci@example.com'),
(10, 8, '2025-06-14 09:00:00', '1.50', 'Carta di Credito', 'Completato', 'laura.bruno@example.com'),
(11, 11, '2025-06-28 19:55:00', '2.00', 'PayPal', 'Completato', 'gabry@gil.com'),
(12, 3, '2025-06-15 20:03:00', '2.00', 'Contanti', 'Completato', 'pp@ii.it'),
(13, 13, '2025-06-16 10:18:00', '2.00', 'Carta di Credito', 'Completato', 'pp@ii.it');

-- --------------------------------------------------------

--
-- Struttura della tabella `PASSEGGERI`
--

CREATE TABLE `PASSEGGERI` (
  `ID_Passeggero` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `DataNascita` date DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Indirizzo` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `PASSEGGERI`
--

INSERT INTO `PASSEGGERI` (`ID_Passeggero`, `Nome`, `Cognome`, `DataNascita`, `Email`, `Telefono`, `Indirizzo`) VALUES
(1, 'Mario', 'Rossi', '1985-05-15', 'mario.rossi@example.com', '3331234567', 'Via Roma 1, Milano'),
(2, 'Giulia', 'Bianchi', '1992-11-22', 'giulia.bianchi@example.com', '3398765432', 'Piazza Duomo 5, Milano'),
(3, 'Luca', 'Verdi', '1978-03-10', 'luca.verdi@example.com', '3381122334', 'Corso Vittorio Emanuele 10, Roma'),
(4, 'Sara', 'Ferrari', '2000-07-01', 'sara.ferrari@example.com', '3405566778', 'Via Dante 3, Napoli'),
(5, 'Marco', 'Russo', '1995-09-28', 'marco.russo@example.com', '3479988776', 'Viale Marconi 7, Firenze'),
(6, 'Anna', 'Esposito', '1980-01-05', 'anna.esposito@example.com', '3281122333', 'Via Garibaldi 12, Torino'),
(7, 'Paolo', 'Ricci', '1970-04-18', 'paolo.ricci@example.com', '3354455667', 'Via Toledo 20, Bari'),
(8, 'Laura', 'Bruno', '1998-12-03', 'laura.bruno@example.com', '3490011223', 'Lungarno Mediceo 4, Pisa'),
(9, 'Davide', 'Gallo', '1989-06-20', 'davide.gallo@example.com', '3667788990', 'Via Indipendenza 15, Bologna'),
(10, 'Elena', 'Conti', '1990-08-08', 'elena.conti@example.com', '3771122335', 'Via XX Settembre 25, Genova'),
(11, 'Gabriele', 'Sirsi', '1997-10-17', 'gabry@gmm.it', NULL, NULL),
(12, 'Alessandro', 'Sirsi', '2001-03-03', 'ale@gmm.it', '3333333', 'via roma Lecee'),
(13, 'anna', 'Franchi', '2000-06-07', 'ann@ttt.it', NULL, NULL),
(14, 'Carlo', 'Sirsi', '1980-10-27', 'car@tin.it', NULL, 'via roma ');

-- --------------------------------------------------------

--
-- Struttura della tabella `PIANIFICAZIONI_MANUTENZIONE`
--

CREATE TABLE `PIANIFICAZIONI_MANUTENZIONE` (
  `ID_Pianificazione` int(11) NOT NULL,
  `ID_Veicolo` varchar(20) NOT NULL,
  `DataScadenza` date DEFAULT NULL,
  `ChilometraggioPrevisto` int(11) DEFAULT NULL,
  `TipoManutenzionePianificata` varchar(50) NOT NULL,
  `StatoPianificazione` varchar(20) NOT NULL COMMENT 'es. Prevista, Rinviata, Completata',
  `Note` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `PIANIFICAZIONI_MANUTENZIONE`
--

INSERT INTO `PIANIFICAZIONI_MANUTENZIONE` (`ID_Pianificazione`, `ID_Veicolo`, `DataScadenza`, `ChilometraggioPrevisto`, `TipoManutenzionePianificata`, `StatoPianificazione`, `Note`) VALUES
(1, 'AB123CD', '2025-07-01', 160000, 'Manutenzione Ordinaria', 'Completata', 'Controllo generale e cambio olio'),
(2, 'EF456GH', '2025-08-15', 100000, 'Ispezione Freni', 'Prevista', 'Controllo usura pastiglie e dischi'),
(3, 'IL789MN', '2025-09-01', 190000, 'Sostituzione Filtri', 'Completata', 'Sostituzione filtri aria e carburante'),
(4, 'OP012QR', '2025-06-30', 55000, 'Revisione Minore', 'In Corso', 'Controllo fluidi e luci');

-- --------------------------------------------------------

--
-- Struttura della tabella `PRENOTAZIONI`
--

CREATE TABLE `PRENOTAZIONI` (
  `ID_Prenotazione` int(11) NOT NULL,
  `ID_Passeggero` int(11) NOT NULL,
  `ID_Corsa` int(11) NOT NULL,
  `DataOraPrenotazione` datetime NOT NULL,
  `NumeroPosti` smallint(6) NOT NULL,
  `StatoPrenotazione` varchar(20) NOT NULL COMMENT 'es. Confermato, In Attesa, Annullato',
  `DataScadenzaPrenotazione` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `PRENOTAZIONI`
--

INSERT INTO `PRENOTAZIONI` (`ID_Prenotazione`, `ID_Passeggero`, `ID_Corsa`, `DataOraPrenotazione`, `NumeroPosti`, `StatoPrenotazione`, `DataScadenzaPrenotazione`) VALUES
(1, 1, 1, '2025-06-09 15:00:00', 1, 'Confermato', '2025-06-15 05:59:00'),
(2, 2, 1, '2025-06-09 15:30:00', 1, 'Confermato', '2025-06-15 05:59:00'),
(3, 3, 3, '2025-06-10 10:00:00', 2, 'Confermato', '2025-06-15 13:59:00'),
(4, 4, 4, '2025-06-10 11:00:00', 1, 'Confermato', '2025-06-16 06:59:00'),
(5, 5, 5, '2025-06-11 09:00:00', 1, 'Confermato', '2025-06-16 14:59:00'),
(6, 6, 6, '2025-06-11 10:00:00', 1, 'Confermato', '2025-06-17 05:59:00'),
(7, 7, 7, '2025-06-12 12:00:00', 1, 'Confermato', '2025-06-17 07:59:00'),
(8, 8, 8, '2025-06-12 13:00:00', 1, 'Confermato', '2025-06-16 07:59:00'),
(9, 9, 9, '2025-06-13 09:30:00', 2, 'Confermato', '2025-06-15 15:59:00'),
(10, 10, 10, '2025-06-13 10:00:00', 1, 'Confermato', '2025-06-16 15:59:00'),
(11, 1, 1, '2025-06-14 11:00:00', 1, 'In Attesa', '2025-06-15 05:59:00'),
(12, 2, 2, '2025-06-14 12:00:00', 1, 'Annullato', '2025-06-15 06:59:00'),
(13, 3, 3, '2025-06-14 13:00:00', 1, 'Confermato', '2025-06-15 13:59:00'),
(14, 4, 4, '2025-06-15 08:00:00', 1, 'Confermato', '2025-06-16 06:59:00'),
(15, 5, 5, '2025-06-15 09:00:00', 1, 'Pianificato', '2025-06-16 14:59:00'),
(16, 6, 6, '2025-06-15 10:00:00', 1, 'Pianificato', '2025-06-17 05:59:00'),
(17, 7, 7, '2025-06-15 11:00:00', 1, 'Confermato', '2025-06-17 07:59:00'),
(18, 8, 8, '2025-06-15 12:00:00', 1, 'Confermato', '2025-06-16 07:59:00'),
(19, 9, 9, '2025-06-15 13:00:00', 1, 'Confermato', '2025-06-15 15:59:00'),
(20, 10, 10, '2025-06-15 14:00:00', 1, 'Confermato', '2025-06-16 15:59:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `QUALIFICHE_AUTISTA`
--

CREATE TABLE `QUALIFICHE_AUTISTA` (
  `ID_Qualifica` int(11) NOT NULL,
  `NomeQualifica` varchar(50) NOT NULL,
  `DescrizioneQualifica` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `QUALIFICHE_AUTISTA`
--

INSERT INTO `QUALIFICHE_AUTISTA` (`ID_Qualifica`, `NomeQualifica`, `DescrizioneQualifica`) VALUES
(1, 'Patente D', 'Abilitazione alla guida di autobus'),
(2, 'Corso Sicurezza', 'Corso di sicurezza sul lavoro specifico per autisti'),
(3, 'Primo Soccorso', 'Certificazione di primo soccorso'),
(4, 'Linea Nord', 'Abilitazione per le linee della zona nord'),
(5, 'Linea Sud', 'Abilitazione per le linee della zona sud'),
(6, 'Guida mezzi pesanti', 'guida anche per macchine movimento terra');

-- --------------------------------------------------------

--
-- Struttura della tabella `TECNICI_MANUTENZIONE`
--

CREATE TABLE `TECNICI_MANUTENZIONE` (
  `ID_Tecnico` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Cognome` varchar(50) NOT NULL,
  `Specializzazione` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `TECNICI_MANUTENZIONE`
--

INSERT INTO `TECNICI_MANUTENZIONE` (`ID_Tecnico`, `Nome`, `Cognome`, `Specializzazione`) VALUES
(1, 'Daniele', 'Esposito', 'Meccanico veicoli pesanti'),
(2, 'Federica', 'Rizzo', 'Elettricista auto/bus'),
(3, 'Giovanni', 'Sala', 'Gommista specializzato'),
(4, 'Martina', 'Moretti', 'Specialista diagnostica elettronica');

-- --------------------------------------------------------

--
-- Struttura della tabella `TRATTE`
--

CREATE TABLE `TRATTE` (
  `ID_Tratta` int(11) NOT NULL,
  `ID_FermataInizio` int(11) NOT NULL,
  `ID_FermataFine` int(11) NOT NULL,
  `DurataMedia` int(11) DEFAULT NULL COMMENT 'Durata in minuti',
  `Distanza` decimal(10,2) DEFAULT NULL COMMENT 'Distanza in Km'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `TRATTE`
--

INSERT INTO `TRATTE` (`ID_Tratta`, `ID_FermataInizio`, `ID_FermataFine`, `DurataMedia`, `Distanza`) VALUES
(1, 1, 2, 10, '2.50'),
(2, 2, 3, 8, '2.00'),
(3, 3, 4, 7, '1.80'),
(4, 4, 5, 12, '3.00'),
(5, 5, 6, 20, '8.00'),
(6, 1, 7, 15, '4.00'),
(7, 7, 8, 5, '1.00'),
(8, 8, 9, 7, '1.50'),
(9, 9, 10, 4, '0.80'),
(10, 10, 1, 10, '2.20'),
(11, 5, 10, 8, '3.20'),
(12, 11, 13, 25, '30.00');

-- --------------------------------------------------------

--
-- Struttura della tabella `TURNI_DI_SERVIZIO`
--

CREATE TABLE `TURNI_DI_SERVIZIO` (
  `ID_Turno` int(11) NOT NULL,
  `ID_Autista` int(11) NOT NULL,
  `DataTurno` date NOT NULL,
  `OraInizio` time NOT NULL,
  `OraFine` time NOT NULL,
  `DescrizioneTurno` varchar(100) DEFAULT NULL,
  `StatoTurno` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `TURNI_DI_SERVIZIO`
--

INSERT INTO `TURNI_DI_SERVIZIO` (`ID_Turno`, `ID_Autista`, `DataTurno`, `OraInizio`, `OraFine`, `DescrizioneTurno`, `StatoTurno`) VALUES
(1, 1, '2025-06-15', '06:00:00', '14:00:00', 'Turno Mattina Linea Nord', 'Completato'),
(2, 2, '2025-06-15', '14:00:00', '22:00:00', 'Turno Pomeriggio Linea Sud', 'Completato'),
(3, 3, '2025-06-16', '07:00:00', '15:00:00', 'Turno Mattina Linea Aeroporto', 'Pianificato'),
(4, 4, '2025-06-16', '15:00:00', '23:00:00', 'Turno Pomeriggio Linea Nord', 'Pianificato'),
(5, 5, '2025-06-17', '06:00:00', '14:00:00', 'Turno Mattina Linea Urbana', 'Pianificato');

-- --------------------------------------------------------

--
-- Struttura della tabella `VALIDAZIONI`
--

CREATE TABLE `VALIDAZIONI` (
  `ID_Validazione` int(11) NOT NULL,
  `ID_Biglietto` int(11) NOT NULL,
  `ID_Corsa` int(11) NOT NULL,
  `ID_Fermata` int(11) DEFAULT NULL,
  `DataOraValidazione` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `VALIDAZIONI`
--

INSERT INTO `VALIDAZIONI` (`ID_Validazione`, `ID_Biglietto`, `ID_Corsa`, `ID_Fermata`, `DataOraValidazione`) VALUES
(1, 1, 1, 1, '2025-06-15 06:05:00'),
(2, 2, 2, 2, '2025-06-15 07:10:00'),
(3, 3, 3, 4, '2025-06-15 14:15:00'),
(4, 4, 4, 1, '2025-06-16 07:05:00'),
(5, 5, 5, 5, '2025-06-16 15:05:00'),
(6, 6, 6, 6, '2025-06-17 06:05:00'),
(7, 7, 7, 7, '2025-06-17 08:05:00'),
(8, 8, 8, 8, '2025-06-16 08:05:00'),
(9, 9, 9, 9, '2025-06-15 16:05:00'),
(10, 10, 10, 10, '2025-06-16 16:05:00'),
(11, 11, 1, 1, '2025-06-15 06:06:00'),
(12, 13, 3, 4, '2025-06-15 14:16:00'),
(13, 14, 4, 1, '2025-06-16 07:06:00'),
(14, 15, 5, 5, '2025-06-16 15:06:00'),
(15, 16, 6, 6, '2025-06-17 06:06:00'),
(16, 17, 7, 7, '2025-06-17 08:06:00'),
(17, 18, 8, 8, '2025-06-16 08:06:00'),
(18, 19, 9, 9, '2025-06-15 16:06:00'),
(19, 20, 10, 10, '2025-06-16 16:06:00'),
(20, 1, 1, 2, '2025-06-15 06:15:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `VEICOLI`
--

CREATE TABLE `VEICOLI` (
  `ID_Veicolo` varchar(20) NOT NULL COMMENT 'Es. Targa del veicolo',
  `Modello` varchar(50) NOT NULL,
  `Marca` varchar(50) NOT NULL,
  `AnnoProduzione` smallint(6) DEFAULT NULL,
  `Capienza` smallint(6) DEFAULT NULL,
  `StatoOperativo` varchar(20) NOT NULL COMMENT 'es. In Servizio, In Manutenzione, Fuori Servizio',
  `Chilometraggio` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `VEICOLI`
--

INSERT INTO `VEICOLI` (`ID_Veicolo`, `Modello`, `Marca`, `AnnoProduzione`, `Capienza`, `StatoOperativo`, `Chilometraggio`) VALUES
('AB123CD', 'Citaro', 'Mercedes-Benz', 2018, 80, 'In Servizio', 150000),
('EF456GH', 'Urbanway', 'Iveco Bus', 2020, 90, 'In Servizio', 90000),
('IL789MN', 'Lion\'s City', 'MAN', 2017, 75, 'In Servizio', 180000),
('OP012QR', 'New City', 'Solaris', 2021, 85, 'In Manutenzione', 50000),
('ST345UV', 'Crossway', 'Iveco Bus', 2019, 70, 'In Servizio', 120000),
('WX678YZ', 'Evadys', 'Iveco Bus', 2016, 60, 'Fuori Servizio', 250000),
('AZ987BX', 'Citea', 'VDL', 2022, 95, 'In Servizio', 30000),
('CY654DV', 'Urbino', 'Solaris', 2018, 80, 'In Servizio', 100000);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `AUTISTI`
--
ALTER TABLE `AUTISTI`
  ADD PRIMARY KEY (`ID_Autista`),
  ADD UNIQUE KEY `NumeroPatente` (`NumeroPatente`),
  ADD UNIQUE KEY `CodiceFiscale` (`CodiceFiscale`),
  ADD KEY `idx_autisti_cognome_nome` (`Cognome`,`Nome`);

--
-- Indici per le tabelle `AUTISTI_QUALIFICHE`
--
ALTER TABLE `AUTISTI_QUALIFICHE`
  ADD PRIMARY KEY (`ID_AutistaQualifica`),
  ADD UNIQUE KEY `ID_Autista` (`ID_Autista`,`ID_Qualifica`),
  ADD KEY `idx_autisti_qualifiche_autista_fk` (`ID_Autista`),
  ADD KEY `idx_autisti_qualifiche_qualifica_fk` (`ID_Qualifica`);

--
-- Indici per le tabelle `BIGLIETTI`
--
ALTER TABLE `BIGLIETTI`
  ADD PRIMARY KEY (`ID_Biglietto`),
  ADD UNIQUE KEY `ID_Prenotazione` (`ID_Prenotazione`),
  ADD KEY `idx_biglietti_ordine_fk` (`ID_Ordine`),
  ADD KEY `idx_biglietti_passeggero_fk` (`ID_Passeggero`),
  ADD KEY `idx_biglietti_dataemissione` (`DataEmissione`),
  ADD KEY `idx_biglietti_validitainizio` (`DataValiditaInizio`),
  ADD KEY `idx_biglietti_validitafine` (`DataValiditaFine`),
  ADD KEY `idx_biglietti_stato` (`StatoBiglietto`);

--
-- Indici per le tabelle `COMPONENTI_VEICOLO`
--
ALTER TABLE `COMPONENTI_VEICOLO`
  ADD PRIMARY KEY (`ID_Componente`),
  ADD KEY `ID_Veicolo` (`ID_Veicolo`);

--
-- Indici per le tabelle `CORSE`
--
ALTER TABLE `CORSE`
  ADD PRIMARY KEY (`ID_Corsa`),
  ADD KEY `ID_Itinerario` (`ID_Itinerario`),
  ADD KEY `ID_Autista` (`ID_Autista`),
  ADD KEY `ID_Veicolo` (`ID_Veicolo`),
  ADD KEY `ID_Turno` (`ID_Turno`),
  ADD KEY `idx_corse_numerolinea` (`NumeroLinea`),
  ADD KEY `idx_corse_partenza_previsto` (`OrarioPartenzaPrevisto`),
  ADD KEY `idx_corse_arrivo_previsto` (`OrarioArrivoPrevisto`),
  ADD KEY `idx_corse_stato` (`StatoCorsa`);

--
-- Indici per le tabelle `DISPONIBILITA_AUTISTI`
--
ALTER TABLE `DISPONIBILITA_AUTISTI`
  ADD PRIMARY KEY (`ID_Disponibilita`),
  ADD KEY `idx_disponibilita_autisti_autista_fk` (`ID_Autista`),
  ADD KEY `idx_disponibilita_autisti_datainizio` (`DataInizioIndisponibilita`),
  ADD KEY `idx_disponibilita_autisti_datafine` (`DataFineIndisponibilita`);

--
-- Indici per le tabelle `FERMATE`
--
ALTER TABLE `FERMATE`
  ADD PRIMARY KEY (`ID_Fermata`),
  ADD UNIQUE KEY `NomeFermata` (`NomeFermata`),
  ADD KEY `idx_fermate_indirizzo` (`Indirizzo`);

--
-- Indici per le tabelle `ITINERARI`
--
ALTER TABLE `ITINERARI`
  ADD PRIMARY KEY (`ID_Itinerario`),
  ADD UNIQUE KEY `NomeItinerario` (`NomeItinerario`);

--
-- Indici per le tabelle `ITINERARI_TRATTE`
--
ALTER TABLE `ITINERARI_TRATTE`
  ADD PRIMARY KEY (`ID_ItinerarioTratta`),
  ADD UNIQUE KEY `ID_Itinerario` (`ID_Itinerario`,`Ordine`),
  ADD UNIQUE KEY `ID_Itinerario_2` (`ID_Itinerario`,`ID_Tratta`),
  ADD KEY `idx_itinerari_tratte_itinerario_fk` (`ID_Itinerario`),
  ADD KEY `idx_itinerari_tratte_tratta_fk` (`ID_Tratta`);

--
-- Indici per le tabelle `MANUTENZIONI`
--
ALTER TABLE `MANUTENZIONI`
  ADD PRIMARY KEY (`ID_Manutenzione`),
  ADD KEY `idx_manutenzioni_veicolo_fk` (`ID_Veicolo`),
  ADD KEY `idx_manutenzioni_pianificazione_fk` (`ID_Pianificazione`),
  ADD KEY `idx_manutenzioni_datainizio` (`DataInizioIntervento`),
  ADD KEY `idx_manutenzioni_stato` (`StatoManutenzione`),
  ADD KEY `idx_manutenzioni_tipo` (`TipoManutenzione`);

--
-- Indici per le tabelle `MANUTENZIONI_COMPONENTI`
--
ALTER TABLE `MANUTENZIONI_COMPONENTI`
  ADD PRIMARY KEY (`ID_ManutenzioneComponente`),
  ADD UNIQUE KEY `ID_Manutenzione` (`ID_Manutenzione`,`ID_Componente`),
  ADD KEY `idx_manutenzioni_componenti_manutenzione_fk` (`ID_Manutenzione`),
  ADD KEY `idx_manutenzioni_componenti_componente_fk` (`ID_Componente`);

--
-- Indici per le tabelle `MANUTENZIONI_TECNICI`
--
ALTER TABLE `MANUTENZIONI_TECNICI`
  ADD PRIMARY KEY (`ID_ManutenzioneTecnico`),
  ADD UNIQUE KEY `ID_Manutenzione` (`ID_Manutenzione`,`ID_Tecnico`),
  ADD KEY `idx_manutenzioni_tecnici_manutenzione_fk` (`ID_Manutenzione`),
  ADD KEY `idx_manutenzioni_tecnici_tecnico_fk` (`ID_Tecnico`);

--
-- Indici per le tabelle `ORDINI_ACQUISTO`
--
ALTER TABLE `ORDINI_ACQUISTO`
  ADD PRIMARY KEY (`ID_Ordine`),
  ADD KEY `idx_ordini_acquisto_dataora` (`DataOraAcquisto`),
  ADD KEY `idx_ordini_acquisto_stato` (`StatoOrdine`),
  ADD KEY `idx_ordini_acquisto_passeggero_fk` (`ID_Passeggero`);

--
-- Indici per le tabelle `PASSEGGERI`
--
ALTER TABLE `PASSEGGERI`
  ADD PRIMARY KEY (`ID_Passeggero`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `idx_passeggeri_cognome_nome` (`Cognome`,`Nome`);

--
-- Indici per le tabelle `PIANIFICAZIONI_MANUTENZIONE`
--
ALTER TABLE `PIANIFICAZIONI_MANUTENZIONE`
  ADD PRIMARY KEY (`ID_Pianificazione`),
  ADD KEY `idx_pianificazioni_manutenzione_veicolo_fk` (`ID_Veicolo`),
  ADD KEY `idx_pianificazioni_manutenzione_datascadenza` (`DataScadenza`),
  ADD KEY `idx_pianificazioni_manutenzione_stato` (`StatoPianificazione`);

--
-- Indici per le tabelle `PRENOTAZIONI`
--
ALTER TABLE `PRENOTAZIONI`
  ADD PRIMARY KEY (`ID_Prenotazione`),
  ADD UNIQUE KEY `ID_Passeggero` (`ID_Passeggero`,`ID_Corsa`,`DataOraPrenotazione`),
  ADD KEY `idx_prenotazioni_passeggero_fk` (`ID_Passeggero`),
  ADD KEY `idx_prenotazioni_corsa_fk` (`ID_Corsa`),
  ADD KEY `idx_prenotazioni_dataora` (`DataOraPrenotazione`),
  ADD KEY `idx_prenotazioni_stato` (`StatoPrenotazione`);

--
-- Indici per le tabelle `QUALIFICHE_AUTISTA`
--
ALTER TABLE `QUALIFICHE_AUTISTA`
  ADD PRIMARY KEY (`ID_Qualifica`),
  ADD UNIQUE KEY `NomeQualifica` (`NomeQualifica`);

--
-- Indici per le tabelle `TECNICI_MANUTENZIONE`
--
ALTER TABLE `TECNICI_MANUTENZIONE`
  ADD PRIMARY KEY (`ID_Tecnico`),
  ADD KEY `idx_tecnici_manutenzione_cognome_nome` (`Cognome`,`Nome`),
  ADD KEY `idx_tecnici_manutenzione_specializzazione` (`Specializzazione`);

--
-- Indici per le tabelle `TRATTE`
--
ALTER TABLE `TRATTE`
  ADD PRIMARY KEY (`ID_Tratta`),
  ADD KEY `idx_tratte_fermatainizio_fk` (`ID_FermataInizio`),
  ADD KEY `idx_tratte_fermatafine_fk` (`ID_FermataFine`),
  ADD KEY `idx_tratte_duratamedia` (`DurataMedia`);

--
-- Indici per le tabelle `TURNI_DI_SERVIZIO`
--
ALTER TABLE `TURNI_DI_SERVIZIO`
  ADD PRIMARY KEY (`ID_Turno`),
  ADD UNIQUE KEY `ID_Autista` (`ID_Autista`,`DataTurno`,`OraInizio`),
  ADD KEY `idx_turni_servizio_autista_fk` (`ID_Autista`),
  ADD KEY `idx_turni_servizio_dataturno` (`DataTurno`),
  ADD KEY `idx_turni_servizio_stato` (`StatoTurno`);

--
-- Indici per le tabelle `VALIDAZIONI`
--
ALTER TABLE `VALIDAZIONI`
  ADD PRIMARY KEY (`ID_Validazione`),
  ADD UNIQUE KEY `ID_Biglietto` (`ID_Biglietto`,`DataOraValidazione`),
  ADD KEY `idx_validazioni_biglietto_fk` (`ID_Biglietto`),
  ADD KEY `idx_validazioni_corsa_fk` (`ID_Corsa`),
  ADD KEY `idx_validazioni_fermata_fk` (`ID_Fermata`),
  ADD KEY `idx_validazioni_dataora` (`DataOraValidazione`);

--
-- Indici per le tabelle `VEICOLI`
--
ALTER TABLE `VEICOLI`
  ADD PRIMARY KEY (`ID_Veicolo`),
  ADD KEY `idx_veicoli_modello_marca` (`Modello`,`Marca`),
  ADD KEY `idx_veicoli_statooperativo` (`StatoOperativo`),
  ADD KEY `idx_veicoli_chilometraggio` (`Chilometraggio`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `AUTISTI`
--
ALTER TABLE `AUTISTI`
  MODIFY `ID_Autista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `AUTISTI_QUALIFICHE`
--
ALTER TABLE `AUTISTI_QUALIFICHE`
  MODIFY `ID_AutistaQualifica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `BIGLIETTI`
--
ALTER TABLE `BIGLIETTI`
  MODIFY `ID_Biglietto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `COMPONENTI_VEICOLO`
--
ALTER TABLE `COMPONENTI_VEICOLO`
  MODIFY `ID_Componente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `CORSE`
--
ALTER TABLE `CORSE`
  MODIFY `ID_Corsa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `DISPONIBILITA_AUTISTI`
--
ALTER TABLE `DISPONIBILITA_AUTISTI`
  MODIFY `ID_Disponibilita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `FERMATE`
--
ALTER TABLE `FERMATE`
  MODIFY `ID_Fermata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `ITINERARI`
--
ALTER TABLE `ITINERARI`
  MODIFY `ID_Itinerario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `ITINERARI_TRATTE`
--
ALTER TABLE `ITINERARI_TRATTE`
  MODIFY `ID_ItinerarioTratta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `MANUTENZIONI`
--
ALTER TABLE `MANUTENZIONI`
  MODIFY `ID_Manutenzione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `MANUTENZIONI_COMPONENTI`
--
ALTER TABLE `MANUTENZIONI_COMPONENTI`
  MODIFY `ID_ManutenzioneComponente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `MANUTENZIONI_TECNICI`
--
ALTER TABLE `MANUTENZIONI_TECNICI`
  MODIFY `ID_ManutenzioneTecnico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `ORDINI_ACQUISTO`
--
ALTER TABLE `ORDINI_ACQUISTO`
  MODIFY `ID_Ordine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `PASSEGGERI`
--
ALTER TABLE `PASSEGGERI`
  MODIFY `ID_Passeggero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `PIANIFICAZIONI_MANUTENZIONE`
--
ALTER TABLE `PIANIFICAZIONI_MANUTENZIONE`
  MODIFY `ID_Pianificazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `PRENOTAZIONI`
--
ALTER TABLE `PRENOTAZIONI`
  MODIFY `ID_Prenotazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `QUALIFICHE_AUTISTA`
--
ALTER TABLE `QUALIFICHE_AUTISTA`
  MODIFY `ID_Qualifica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `TECNICI_MANUTENZIONE`
--
ALTER TABLE `TECNICI_MANUTENZIONE`
  MODIFY `ID_Tecnico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `TRATTE`
--
ALTER TABLE `TRATTE`
  MODIFY `ID_Tratta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT per la tabella `TURNI_DI_SERVIZIO`
--
ALTER TABLE `TURNI_DI_SERVIZIO`
  MODIFY `ID_Turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `VALIDAZIONI`
--
ALTER TABLE `VALIDAZIONI`
  MODIFY `ID_Validazione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
