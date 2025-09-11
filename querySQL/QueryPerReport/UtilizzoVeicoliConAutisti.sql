SELECT
            V.ID_Veicolo,
            V.Modello, -- Utilizza Modello per il veicolo
            C.ID_Corsa,
            C.NumeroLinea,
            DATE(C.OrarioPartenzaPrevisto) AS DataCorsa, -- Estrae la data dall'orario di partenza previsto
            C.OrarioPartenzaPrevisto,
            C.OrarioArrivoPrevisto,
            A.Nome AS NomeAutista,
            A.Cognome AS CognomeAutista
        FROM
            VEICOLI AS V
        JOIN
            CORSE AS C ON V.ID_Veicolo = C.ID_Veicolo
        LEFT JOIN
            AUTISTI AS A ON C.ID_Autista = A.ID_Autista
        ORDER BY
            V.ID_Veicolo, DATE(C.OrarioPartenzaPrevisto) DESC, C.OrarioPartenzaPrevisto DESC;