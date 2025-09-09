# Visualizza Tempi di Percorrenza di Tutte le Linee

SELECT
            I.ID_Itinerario,
            I.NomeItinerario,
            SUM(T.DurataMedia) AS TempoTotalePercorrenzaMinuti -- Calcola la somma delle durate medie delle tratte
        FROM
            ITINERARI AS I
        JOIN
            ITINERARI_TRATTE AS IT ON I.ID_Itinerario = IT.ID_Itinerario
        JOIN
            TRATTE AS T ON IT.ID_Tratta = T.ID_Tratta
        GROUP BY
            I.ID_Itinerario, I.NomeItinerario
        ORDER BY
            TempoTotalePercorrenzaMinuti ASC; -- Ordina dal più breve al più lungo
