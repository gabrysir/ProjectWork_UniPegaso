#Manutenzioni Effettuate e Relativi Costi

 SELECT
            M.ID_Manutenzione,
            M.TipoManutenzione,
            M.DescrizioneIntervento,
            M.DataInizioIntervento,
            M.DataFineIntervento,
            M.StatoManutenzione,
            M.CostoRicambi,
            M.CostoManodopera,
            (M.CostoRicambi + M.CostoManodopera) AS CostoTotaleManutenzione,
            V.ID_Veicolo,
            V.Modello AS ModelloVeicolo,
            V.Marca AS MarcaVeicolo,
            GROUP_CONCAT(DISTINCT CONCAT(T.Nome, ' ', T.Cognome) SEPARATOR ', ') AS TecniciCoinvolti,
            GROUP_CONCAT(DISTINCT C.NomeComponente SEPARATOR ', ') AS ComponentiCoinvolti
        FROM
            MANUTENZIONI AS M
        JOIN
            VEICOLI AS V ON M.ID_Veicolo = V.ID_Veicolo
        LEFT JOIN
            MANUTENZIONI_TECNICI AS MT ON M.ID_Manutenzione = MT.ID_Manutenzione
        LEFT JOIN
            TECNICI_MANUTENZIONE AS T ON MT.ID_Tecnico = T.ID_Tecnico
        LEFT JOIN
            MANUTENZIONI_COMPONENTI AS MC ON M.ID_Manutenzione = MC.ID_Manutenzione
        LEFT JOIN
            COMPONENTI_VEICOLO AS C ON MC.ID_Componente = C.ID_Componente
        GROUP BY
            M.ID_Manutenzione, V.ID_Veicolo, V.Modello, V.Marca, M.TipoManutenzione, M.DescrizioneIntervento,
            M.DataInizioIntervento, M.DataFineIntervento, M.StatoManutenzione, M.CostoRicambi, M.CostoManodopera
        ORDER BY
            M.DataInizioIntervento DESC;
