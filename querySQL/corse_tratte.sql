# Elenco Corse e Relative Tratte

 SELECT
            C.ID_Corsa,
            C.NumeroLinea,
            C.OrarioPartenzaPrevisto,
            C.OrarioArrivoPrevisto,
            C.StatoCorsa,
            I.NomeItinerario,
            IT.Ordine AS OrdineTratta,
            T.ID_Tratta,
            F_Inizio.NomeFermata AS FermataInizio,
            F_Fine.NomeFermata AS FermataFine,
            T.DurataMedia AS DurataTrattaMinuti,
            T.Distanza AS DistanzaTrattaKm
        FROM
            CORSE AS C
        JOIN
            ITINERARI AS I ON C.ID_Itinerario = I.ID_Itinerario
        JOIN
            ITINERARI_TRATTE AS IT ON I.ID_Itinerario = IT.ID_Itinerario
        JOIN
            TRATTE AS T ON IT.ID_Tratta = T.ID_Tratta
        JOIN
            FERMATE AS F_Inizio ON T.ID_FermataInizio = F_Inizio.ID_Fermata
        JOIN
            FERMATE AS F_Fine ON T.ID_FermataFine = F_Fine.ID_Fermata
        ORDER BY
            C.ID_Corsa, IT.Ordine;
