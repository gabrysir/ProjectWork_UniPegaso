 SELECT
            A.ID_Autista,
            A.Nome,
            A.Cognome,
            T.DataTurno,
            T.OraInizio,
            T.OraFine
        FROM
            AUTISTI AS A
        JOIN
            TURNI_DI_SERVIZIO AS T ON A.ID_Autista = T.ID_Autista
        ORDER BY
            A.Cognome, A.Nome, T.DataTurno DESC, T.OraInizio DESC;