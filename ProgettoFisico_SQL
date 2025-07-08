-- 1. Creazione della tabella PASSEGGERI
CREATE TABLE PASSEGGERI (
    ID_Passeggero INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50) NOT NULL,
    DataNascita DATE,
    Email VARCHAR(100) UNIQUE,
    Telefono VARCHAR(20),
    Indirizzo VARCHAR(255)
);

-- 2. Creazione della tabella ORDINI_ACQUISTO
CREATE TABLE ORDINI_ACQUISTO (
    ID_Ordine INT PRIMARY KEY AUTO_INCREMENT,
    ID_Passeggero INT, -- Potrebbe essere NULL per acquisti anonimi
    DataOraAcquisto DATETIME NOT NULL,
    ImportoTotale DECIMAL(10, 2) NOT NULL,
    MetodoPagamento VARCHAR(50) NOT NULL,
    StatoOrdine VARCHAR(20) NOT NULL, -- Es: 'Completato', 'In Sospeso', 'Annullato', 'Rimborsato'
    EmailAcquirente VARCHAR(100), -- Per contatto anche per acquisti anonimi
    FOREIGN KEY (ID_Passeggero) REFERENCES PASSEGGERI(ID_Passeggero)
);

-- 3. Creazione della tabella FERMATE
CREATE TABLE FERMATE (
    ID_Fermata INT PRIMARY KEY AUTO_INCREMENT,
    NomeFermata VARCHAR(100) NOT NULL UNIQUE,
    Indirizzo VARCHAR(255),
    Latitudine DECIMAL(9, 6),
    Longitudine DECIMAL(9, 6)
);

-- 4. Creazione della tabella TRATTE
CREATE TABLE TRATTE (
    ID_Tratta INT PRIMARY KEY AUTO_INCREMENT,
    ID_FermataInizio INT NOT NULL,
    ID_FermataFine INT NOT NULL,
    DurataMedia INT, -- Durata in minuti
    Distanza DECIMAL(10, 2), -- Distanza in km
    FOREIGN KEY (ID_FermataInizio) REFERENCES FERMATE(ID_Fermata),
    FOREIGN KEY (ID_FermataFine) REFERENCES FERMATE(ID_Fermata),
    CONSTRAINT CHK_Tratta_Fermate_Diverse CHECK (ID_FermataInizio <> ID_FermataFine)
);

-- 5. Creazione della tabella ITINERARI
CREATE TABLE ITINERARI (
    ID_Itinerario INT PRIMARY KEY AUTO_INCREMENT,
    NomeItinerario VARCHAR(100) NOT NULL UNIQUE,
    Descrizione TEXT
);

-- 6. Creazione della tabella di giunzione ITINERARI_TRATTE (per la relazione N:M tra ITINERARI e TRATTE)
CREATE TABLE ITINERARI_TRATTE (
    ID_ItinerarioTratta INT PRIMARY KEY AUTO_INCREMENT,
    ID_Itinerario INT NOT NULL,
    ID_Tratta INT NOT NULL,
    Ordine INT NOT NULL, -- Ordine della tratta all'interno dell'itinerario
    FOREIGN KEY (ID_Itinerario) REFERENCES ITINERARI(ID_Itinerario),
    FOREIGN KEY (ID_Tratta) REFERENCES TRATTE(ID_Tratta),
    UNIQUE (ID_Itinerario, Ordine), -- Una tratta ha un ordine unico in un itinerario
    UNIQUE (ID_Itinerario, ID_Tratta) -- Evita di inserire la stessa tratta più volte nello stesso itinerario
);

-- 7. Creazione della tabella AUTISTI
CREATE TABLE AUTISTI (
    ID_Autista INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50) NOT NULL,
    DataNascita DATE,
    NumeroPatente VARCHAR(20) NOT NULL UNIQUE,
    DataScadenzaPatente DATE,
    StatoAssunzione VARCHAR(20) NOT NULL,
    CodiceFiscale VARCHAR(16) UNIQUE,
    DataAssunzione DATE,
    ContattoEmergenza VARCHAR(20)
);

-- 8. Creazione della tabella QUALIFICHE_AUTISTA
CREATE TABLE QUALIFICHE_AUTISTA (
    ID_Qualifica INT PRIMARY KEY AUTO_INCREMENT,
    NomeQualifica VARCHAR(50) NOT NULL UNIQUE,
    DescrizioneQualifica TEXT
);

-- 9. Creazione della tabella di giunzione AUTISTI_QUALIFICHE (per la relazione N:M tra AUTISTI e QUALIFICHE_AUTISTA)
CREATE TABLE AUTISTI_QUALIFICHE (
    ID_AutistaQualifica INT PRIMARY KEY AUTO_INCREMENT,
    ID_Autista INT NOT NULL,
    ID_Qualifica INT NOT NULL,
    FOREIGN KEY (ID_Autista) REFERENCES AUTISTI(ID_Autista),
    FOREIGN KEY (ID_Qualifica) REFERENCES QUALIFICHE_AUTISTA(ID_Qualifica),
    UNIQUE (ID_Autista, ID_Qualifica)
);

-- 10. Creazione della tabella DISPONIBILITA_AUTISTI
CREATE TABLE DISPONIBILITA_AUTISTI (
    ID_Disponibilita INT PRIMARY KEY AUTO_INCREMENT,
    ID_Autista INT NOT NULL,
    DataInizioIndisponibilita DATETIME NOT NULL,
    DataFineIndisponibilita DATETIME NOT NULL,
    TipoIndisponibilita VARCHAR(50) NOT NULL,
    Note TEXT,
    FOREIGN KEY (ID_Autista) REFERENCES AUTISTI(ID_Autista)
);

-- 11. Creazione della tabella TURNI_SERVIZIO
CREATE TABLE TURNI_SERVIZIO (
    ID_Turno INT PRIMARY KEY AUTO_INCREMENT,
    ID_Autista INT NOT NULL,
    DataTurno DATE NOT NULL,
    OraInizio TIME NOT NULL,
    OraFine TIME NOT NULL,
    DescrizioneTurno VARCHAR(100),
    StatoTurno VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Autista) REFERENCES AUTISTI(ID_Autista)
);

-- 12. Creazione della tabella VEICOLI
CREATE TABLE VEICOLI (
    ID_Veicolo VARCHAR(20) PRIMARY KEY, -- La targa come PK
    Modello VARCHAR(50) NOT NULL,
    Marca VARCHAR(50) NOT NULL,
    AnnoProduzione SMALLINT,
    Capienza SMALLINT,
    StatoOperativo VARCHAR(20) NOT NULL,
    Chilometraggio INT
);

-- 13. Creazione della tabella PIANIFICAZIONI_MANUTENZIONE
CREATE TABLE PIANIFICAZIONI_MANUTENZIONE (
    ID_Pianificazione INT PRIMARY KEY AUTO_INCREMENT,
    ID_Veicolo VARCHAR(20) NOT NULL,
    DataScadenza DATE,
    ChilometraggioPrevisto INT,
    TipoManutenzionePianificata VARCHAR(50) NOT NULL,
    StatoPianificazione VARCHAR(20) NOT NULL,
    Note TEXT,
    FOREIGN KEY (ID_Veicolo) REFERENCES VEICOLI(ID_Veicolo)
);

-- 14. Creazione della tabella MANUTENZIONI
CREATE TABLE MANUTENZIONI (
    ID_Manutenzione INT PRIMARY KEY AUTO_INCREMENT,
    ID_Veicolo VARCHAR(20) NOT NULL,
    ID_Pianificazione INT, -- Potrebbe essere NULL se non deriva da una pianificazione specifica
    DataInizioIntervento DATETIME NOT NULL,
    DataFineIntervento DATETIME,
    TipoManutenzione VARCHAR(50) NOT NULL,
    DescrizioneIntervento TEXT,
    -- CostoManutenzione rimosso per normalizzazione (è un campo calcolato)
    StatoManutenzione VARCHAR(20) NOT NULL,
    CostoRicambi DECIMAL(10, 2),
    CostoManodopera DECIMAL(10, 2),
    FOREIGN KEY (ID_Veicolo) REFERENCES VEICOLI(ID_Veicolo),
    FOREIGN KEY (ID_Pianificazione) REFERENCES PIANIFICAZIONI_MANUTENZIONE(ID_Pianificazione)
);

-- 15. Creazione della tabella COMPONENTI_VEICOLO
CREATE TABLE COMPONENTI_VEICOLO (
    ID_Componente INT PRIMARY KEY AUTO_INCREMENT,
    ID_Veicolo VARCHAR(20) NOT NULL,
    NomeComponente VARCHAR(100) NOT NULL,
    DescrizioneComponente TEXT,
    FOREIGN KEY (ID_Veicolo) REFERENCES VEICOLI(ID_Veicolo)
);

-- 16. Creazione della tabella di giunzione MANUTENZIONI_COMPONENTI (per la relazione N:M tra MANUTENZIONI e COMPONENTI_VEICOLO)
CREATE TABLE MANUTENZIONI_COMPONENTI (
    ID_ManutenzioneComponente INT PRIMARY KEY AUTO_INCREMENT,
    ID_Manutenzione INT NOT NULL,
    ID_Componente INT NOT NULL,
    FOREIGN KEY (ID_Manutenzione) REFERENCES MANUTENZIONI(ID_Manutenzione),
    FOREIGN KEY (ID_Componente) REFERENCES COMPONENTI_VEICOLO(ID_Componente),
    UNIQUE (ID_Manutenzione, ID_Componente)
);

-- 17. Creazione della tabella TECNICI_MANUTENZIONE
CREATE TABLE TECNICI_MANUTENZIONE (
    ID_Tecnico INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50) NOT NULL,
    Specializzazione VARCHAR(100)
);

-- 18. Creazione della tabella di giunzione MANUTENZIONI_TECNICI (per la relazione N:M tra MANUTENZIONI e TECNICI_MANUTENZIONE)
CREATE TABLE MANUTENZIONI_TECNICI (
    ID_ManutenzioneTecnico INT PRIMARY KEY AUTO_INCREMENT,
    ID_Manutenzione INT NOT NULL,
    ID_Tecnico INT NOT NULL,
    FOREIGN KEY (ID_Manutenzione) REFERENCES MANUTENZIONI(ID_Manutenzione),
    FOREIGN KEY (ID_Tecnico) REFERENCES TECNICI_MANUTENZIONE(ID_Tecnico),
    UNIQUE (ID_Manutenzione, ID_Tecnico)
);

-- 19. Creazione della tabella CORSE
-- Messa dopo VEICOLI, AUTISTI, ITINERARI, TURNI_SERVIZIO per rispettare le FK
CREATE TABLE CORSE (
    ID_Corsa INT PRIMARY KEY AUTO_INCREMENT,
    ID_Itinerario INT NOT NULL,
    ID_Autista INT NOT NULL,
    ID_Veicolo VARCHAR(20) NOT NULL,
    ID_Turno INT NOT NULL,
    NumeroLinea VARCHAR(10) NOT NULL,
    OrarioPartenzaPrevisto DATETIME NOT NULL,
    OrarioArrivoPrevisto DATETIME NOT NULL,
    OrarioPartenzaEffettivo DATETIME,
    OrarioArrivoEffettivo DATETIME,
    StatoCorsa VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Itinerario) REFERENCES ITINERARI(ID_Itinerario),
    FOREIGN KEY (ID_Autista) REFERENCES AUTISTI(ID_Autista),
    FOREIGN KEY (ID_Veicolo) REFERENCES VEICOLI(ID_Veicolo),
    FOREIGN KEY (ID_Turno) REFERENCES TURNI_SERVIZIO(ID_Turno)
);

-- 20. Creazione della tabella PRENOTAZIONI
-- Messa dopo PASSEGGERI e CORSE per rispettare le FK
CREATE TABLE PRENOTAZIONI (
    ID_Prenotazione INT PRIMARY KEY AUTO_INCREMENT,
    ID_Passeggero INT NOT NULL,
    ID_Corsa INT NOT NULL,
    DataOraPrenotazione DATETIME NOT NULL,
    NumeroPosti SMALLINT NOT NULL,
    StatoPrenotazione VARCHAR(20) NOT NULL,
    DataScadenzaPrenotazione DATETIME,
    FOREIGN KEY (ID_Passeggero) REFERENCES PASSEGGERI(ID_Passeggero),
    FOREIGN KEY (ID_Corsa) REFERENCES CORSE(ID_Corsa)
);

-- 21. Creazione della tabella BIGLIETTI
-- Messa dopo ORDINI_ACQUISTO, PASSEGGERI e PRENOTAZIONI per rispettare le FK
CREATE TABLE BIGLIETTI (
    ID_Biglietto INT PRIMARY KEY AUTO_INCREMENT,
    ID_Ordine INT NOT NULL,
    ID_Passeggero INT,
    ID_Prenotazione INT UNIQUE,
    TipoBiglietto VARCHAR(50) NOT NULL,
    Prezzo DECIMAL(10, 2) NOT NULL,
    DataEmissione DATETIME NOT NULL,
    DataValiditaInizio DATETIME NOT NULL,
    DataValiditaFine DATETIME NOT NULL,
    StatoBiglietto VARCHAR(20) NOT NULL,
    ModalitaPagamento VARCHAR(50),
    FOREIGN KEY (ID_Ordine) REFERENCES ORDINI_ACQUISTO(ID_Ordine),
    FOREIGN KEY (ID_Passeggero) REFERENCES PASSEGGERI(ID_Passeggero),
    FOREIGN KEY (ID_Prenotazione) REFERENCES PRENOTAZIONI(ID_Prenotazione)
);

-- 22. Creazione della tabella VALIDAZIONI
-- Messa dopo BIGLIETTI, CORSE, FERMATE per rispettare le FK
CREATE TABLE VALIDAZIONI (
    ID_Validazione INT PRIMARY KEY AUTO_INCREMENT,
    ID_Biglietto INT NOT NULL,
    ID_Corsa INT NOT NULL,
    ID_Fermata INT,
    DataOraValidazione DATETIME NOT NULL,
    FOREIGN KEY (ID_Biglietto) REFERENCES BIGLIETTI(ID_Biglietto),
    FOREIGN KEY (ID_Corsa) REFERENCES CORSE(ID_Corsa),
    FOREIGN KEY (ID_Fermata) REFERENCES FERMATE(ID_Fermata)
);
