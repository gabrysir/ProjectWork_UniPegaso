# Query SQL per contare i biglietti per tipo
  
        SELECT
            TipoBiglietto,
            COUNT(ID_Biglietto) AS NumeroBigliettiVenduti
        FROM
            BIGLIETTI
        GROUP BY
            TipoBiglietto
        ORDER BY
            NumeroBigliettiVenduti DESC;
