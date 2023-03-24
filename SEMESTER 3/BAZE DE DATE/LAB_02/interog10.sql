/*Afisati serviciile solicitate in functie de tipul de sistem, incidentele care au avut loc pe tipul de sistem respectiv si clientii incidentelor*/
/*DISTINCT, WHERE, >2 tabele*/
SELECT DISTINCT SERVICII.denumire,SERVICII.tip_sistem_operare,INCIDENTE.denumire,INCIDENTE.id_incident,CLIENTI.nume,CLIENTI.prenume
FROM SERVICII,INCIDENTE,CLIENTI
WHERE UPPER(SERVICII.tip_sistem_operare)=UPPER(INCIDENTE.tip_sistem_afectat) and CLIENTI.id_client=INCIDENTE.id_client
ORDER BY SERVICII.denumire