#Prenotazioni del Passeggero Verdi

SELECT
            B.ID_Biglietto,
            B.TipoBiglietto,
            B.Prezzo,
            B.DataEmissione,
            B.DataValiditaInizio,
            B.DataValiditaFine,
            B.StatoBiglietto,
            B.ModalitaPagamento,
            P.Nome AS NomePasseggero,
            P.Cognome AS CognomePasseggero,
            P.Email AS EmailPasseggero,
            OA.ID_Ordine,
            OA.DataOraAcquisto AS DataOraOrdine,
            PR.ID_Prenotazione,
            PR.DataOraPrenotazione
        FROM
            BIGLIETTI AS B
        LEFT JOIN
            PASSEGGERI AS P ON B.ID_Passeggero = P.ID_Passeggero
        LEFT JOIN
            ORDINI_ACQUISTO AS OA ON B.ID_Ordine = OA.ID_Ordine
        LEFT JOIN
            PRENOTAZIONI AS PR ON B.ID_Prenotazione = PR.ID_Prenotazione
        WHERE
            P.Cognome = 'Verdi' AND PR.ID_Prenotazione IS NOT NULL
        ORDER BY
            B.DataEmissione DESC;
