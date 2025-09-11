# Query SQL per il report sulla puntualità delle corse
    
        SELECT
            C.ID_Corsa,
            C.NumeroLinea,
            C.OrarioPartenzaPrevisto,
            C.OrarioArrivoPrevisto,
            C.OrarioArrivoEffettivo,
            TIMEDIFF(C.OrarioArrivoEffettivo, C.OrarioArrivoPrevisto) AS RitardoArrivo,
            CASE
                WHEN TIMEDIFF(C.OrarioArrivoEffettivo, C.OrarioArrivoPrevisto) <= '00:05:00' THEN 'In Orario'
                WHEN TIMEDIFF(C.OrarioArrivoEffettivo, C.OrarioArrivoPrevisto) > '00:05:00' THEN 'In Ritardo'
                ELSE 'Dato Non Disponibile'
            END AS StatoPuntualita
        FROM
            CORSE AS C
        WHERE
            C.StatoCorsa = 'Completata'
            AND C.OrarioArrivoEffettivo IS NOT NULL
            AND C.OrarioArrivoPrevisto IS NOT NULL
        ORDER BY
            C.OrarioArrivoPrevisto DESC;