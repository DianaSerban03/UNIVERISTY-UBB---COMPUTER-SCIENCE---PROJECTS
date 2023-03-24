/* Afișați în ordine crescatoare clientii care cer cel putin un serviciu si fac parte dintr-o companie.*/
/*WHERE,>2 TABELE*/
SELECT	Clienti.nume, CLIENTI.prenume,CLIENTI.id_client,COMPANII.denumire
FROM CLIENTI, SERVICII,	COMPANII
WHERE CLIENTI.id_client=SERVICII.id_client and CLIENTI.id_companie=COMPANII.id_companie
ORDER BY CLIENTI.nume
