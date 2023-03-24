/*Afișați cel mai vechi incident nefinalizat,clientul caruia ii apartine si angajatul desemnat sa il rezolve.*/
/*>2 tabele, group by*/

SELECT	CONCAT(ANGAJATI.nume , ANGAJATI.prenume) as "ANGAJAT",CONCAT(CLIENTI.nume,CLIENTI.prenume) as "CLIENT", denumire, MIN(data_inceput) as"data incepere"
FROM incidente LEFT JOIN ANGAJATI ON INCIDENTE.id_angajat=ANGAJATI.id_angajat  LEFT JOIN CLIENTI ON CLIENTI.id_client=INCIDENTE.id_client
GROUP BY ANGAJATI.nume,ANGAJATI.prenume,CLIENTI.nume,CLIENTI.prenume,denumire, data_finalizare 
HAVING MIN(data_inceput)=(SELECT MIN(data_inceput) FROM incidente WHERE data_finalizare IS NULL)