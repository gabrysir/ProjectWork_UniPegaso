## Visualizza le fermate della Linea L2

SELECT DISTINCT
            F.ID_Fermata,
            F.NomeFermata,
            F.Indirizzo,
            F.Latitudine,
            F.Longitudine,
            I.NomeItinerario AS ItinerarioLinea,
            C.NumeroLinea
        FROM
            FERMATE AS F
        JOIN
            TRATTE AS T_Inizio ON F.ID_Fermata = T_Inizio.ID_FermataInizio
        JOIN
            ITINERARI_TRATTE AS IT_Inizio ON T_Inizio.ID_Tratta = IT_Inizio.ID_Tratta
        JOIN
            ITINERARI AS I ON IT_Inizio.ID_Itinerario = I.ID_Itinerario
        JOIN
            CORSE AS C ON I.ID_Itinerario = C.ID_Itinerario
        WHERE
            C.NumeroLinea = 'L2'
        ORDER BY
            F.NomeFermata;
