-- Indici su Chiavi Esterne (FK):
-- Le chiavi esterne sono quasi sempre candidati ideali per gli indici,
-- poiché sono utilizzate frequentemente nelle clausole JOIN per collegare le tabelle.
CREATE INDEX IDX_ORDINI_ACQUISTO_ID_Passeggero ON ORDINI_ACQUISTO (ID_Passeggero);
CREATE INDEX IDX_TRATTE_ID_FermataInizio ON TRATTE (ID_FermataInizio);
CREATE INDEX IDX_TRATTE_ID_FermataFine ON TRATTE (ID_FermataFine);
CREATE INDEX IDX_ITINERARI_TRATTE_ID_Itinerario ON ITINERARI_TRATTE (ID_Itinerario);
CREATE INDEX IDX_ITINERARI_TRATTE_ID_Tratta ON ITINERARI_TRATTE (ID_Tratta);
CREATE INDEX IDX_AUTISTI_QUALIFICHE_ID_Autista ON AUTISTI_QUALIFICHE (ID_Autista);
CREATE INDEX IDX_AUTISTI_QUALIFICHE_ID_Qualifica ON AUTISTI_QUALIFICHE (ID_Qualifica);
CREATE INDEX IDX_DISPONIBILITA_AUTISTI_ID_Autista ON DISPONIBILITA_AUTISTI (ID_Autista);
CREATE INDEX IDX_TURNI_SERVIZIO_ID_Autista ON TURNI_SERVIZIO (ID_Autista);
CREATE INDEX IDX_PIANIFICAZIONI_MANUTENZIONE_ID_Veicolo ON PIANIFICAZIONI_MANUTENZIONE (ID_Veicolo);
CREATE INDEX IDX_MANUTENZIONI_ID_Veicolo ON MANUTENZIONI (ID_Veicolo);
CREATE INDEX IDX_MANUTENZIONI_ID_Pianificazione ON MANUTENZIONI (ID_Pianificazione);
CREATE INDEX IDX_COMPONENTI_VEICOLO_ID_Veicolo ON COMPONENTI_VEICOLO (ID_Veicolo);
CREATE INDEX IDX_MANUTENZIONI_COMPONENTI_ID_Manutenzione ON MANUTENZIONI_COMPONENTI (ID_Manutenzione);
CREATE INDEX IDX_MANUTENZIONI_COMPONENTI_ID_Componente ON MANUTENZIONI_COMPONENTI (ID_Componente);
CREATE INDEX IDX_MANUTENZIONI_TECNICI_ID_Manutenzione ON MANUTENZIONI_TECNICI (ID_Manutenzione);
CREATE INDEX IDX_MANUTENZIONI_TECNICI_ID_Tecnico ON MANUTENZIONI_TECNICI (ID_Tecnico);
CREATE INDEX IDX_CORSE_ID_Itinerario ON CORSE (ID_Itinerario);
CREATE INDEX IDX_CORSE_ID_Autista ON CORSE (ID_Autista);
CREATE INDEX IDX_CORSE_ID_Veicolo ON CORSE (ID_Veicolo);
CREATE INDEX IDX_CORSE_ID_Turno ON CORSE (ID_Turno);
CREATE INDEX IDX_PRENOTAZIONI_ID_Passeggero ON PRENOTAZIONI (ID_Passeggero);
CREATE INDEX IDX_PRENOTAZIONI_ID_Corsa ON PRENOTAZIONI (ID_Corsa);
CREATE INDEX IDX_BIGLIETTI_ID_Ordine ON BIGLIETTI (ID_Ordine);
CREATE INDEX IDX_BIGLIETTI_ID_Passeggero ON BIGLIETTI (ID_Passeggero);
CREATE INDEX IDX_BIGLIETTI_ID_Prenotazione ON BIGLIETTI (ID_Prenotazione); -- Già UNIQUE, ma un indice esplicito può aiutare
CREATE INDEX IDX_VALIDAZIONI_ID_Biglietto ON VALIDAZIONI (ID_Biglietto);
CREATE INDEX IDX_VALIDAZIONI_ID_Corsa ON VALIDAZIONI (ID_Corsa);
CREATE INDEX IDX_VALIDAZIONI_ID_Fermata ON VALIDAZIONI (ID_Fermata);


-- Indici su Colonne Frequentemente Interrogate (WHERE, ORDER BY, GROUP BY):

-- PASSEGGERI:
-- Per ricerche rapide per email (già UNIQUE, quindi indicizzato), nome o cognome.
CREATE INDEX IDX_PASSEGGERI_NomeCognome ON PASSEGGERI (Nome, Cognome);

-- FERMATE:
-- Per ricerche rapide per nome fermata (già UNIQUE, quindi indicizzato).

-- BIGLIETTI:
-- Per ricerche per stato, tipo o intervallo di validità.
CREATE INDEX IDX_BIGLIETTI_StatoBiglietto ON BIGLIETTI (StatoBiglietto);
CREATE INDEX IDX_BIGLIETTI_DataValiditaFine ON BIGLIETTI (DataValiditaFine);
CREATE INDEX IDX_BIGLIETTI_TipoBiglietto ON BIGLIETTI (TipoBiglietto);

-- VALIDAZIONI:
-- Per ricerche per data/ora di validazione.
CREATE INDEX IDX_VALIDAZIONI_DataOraValidazione ON VALIDAZIONI (DataOraValidazione);

-- CORSE:
-- Per ricerche per numero di linea, stato o orari previsti/effettivi.
CREATE INDEX IDX_CORSE_NumeroLinea ON CORSE (NumeroLinea);
CREATE INDEX IDX_CORSE_StatoCorsa ON CORSE (StatoCorsa);
CREATE INDEX IDX_CORSE_OrarioPartenzaPrevisto ON CORSE (OrarioPartenzaPrevisto);

-- AUTISTI:
-- Per ricerche per stato di assunzione o numero di patente (già UNIQUE, quindi indicizzato).
CREATE INDEX IDX_AUTISTI_StatoAssunzione ON AUTISTI (StatoAssunzione);

-- VEICOLI:
-- Per ricerche per stato operativo o chilometraggio.
CREATE INDEX IDX_VEICOLI_StatoOperativo ON VEICOLI (StatoOperativo);

-- MANUTENZIONI:
-- Per ricerche per tipo di manutenzione o stato.
CREATE INDEX IDX_MANUTENZIONI_TipoManutenzione ON MANUTENZIONI (TipoManutenzione);
CREATE INDEX IDX_MANUTENZIONI_StatoManutenzione ON MANUTENZIONI (StatoManutenzione);
