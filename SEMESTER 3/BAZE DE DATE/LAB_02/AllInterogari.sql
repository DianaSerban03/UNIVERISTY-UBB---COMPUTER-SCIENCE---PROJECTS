--1) Afisati serviciile solicitate in functie de tipul de sistem, incidentele care au avut loc pe tipul de sistem respectiv si clientii incidentelor
/*DISTINCT, WHERE, >2 tabele*/
SELECT DISTINCT SERVICII.denumire,SERVICII.tip_sistem_operare,INCIDENTE.denumire,INCIDENTE.id_incident,CLIENTI.nume,CLIENTI.prenume
FROM SERVICII,INCIDENTE,CLIENTI
WHERE UPPER(SERVICII.tip_sistem_operare)=UPPER(INCIDENTE.tip_sistem_afectat) and CLIENTI.id_client=INCIDENTE.id_client
ORDER BY SERVICII.denumire

--2) Afișați în ordine crescatoare angajații care au lucrat la cel putin un serviciu*/
/*DISTINCT,WHERE,M-N,>2 TABELE*/
SELECT DISTINCT nume, prenume, functie,angajati.id_angajat
FROM angajati, COLABORARI, servicii 
WHERE colaborari.id_angajat=angajati.id_angajat AND colaborari.cod_serv=servicii.cod_serv
ORDER BY nume

--3) Afisati partenerii care au contribuit la proiectele cumparate si cumparatorii lor */
/*>2 tabele*/
SELECT PARTENERI.denumire, PROIECTE.denumire, CUMPARATORI.nume
FROM PARTENERI
JOIN PROIECTE ON PROIECTE.id_partener=PARTENERI.id_partener
JOIN CUMPARATORI ON CUMPARATORI.id_cumparator=PROIECTE.id_cumparator
ORDER BY PARTENERI.denumire

--4) Afisati repartizarea angajatilor pe departamente si sediul din care fac parte*/
/*WHERE,>2 tabele*/
SELECT DISTINCT DEPARTAMENTE.id_departament,departamente.denumire,ANGAJATI.id_angajat,nume,prenume,SEDII.denumire
FROM DEPARTAMENTE,ANGAJATI, SEDII
WHERE DEPARTAMENTE.id_departament=ANGAJATI.id_departament and SEDII.id_sediu=ANGAJATI.id_sediu
ORDER BY DEPARTAMENTE.id_departament

--5) Afișați în ordine crescatoare clientii care cer cel putin un serviciu si fac parte dintr-o companie.*/
/*WHERE,>2 TABELE*/
SELECT	Clienti.nume, CLIENTI.prenume,CLIENTI.id_client,COMPANII.denumire
FROM CLIENTI, SERVICII,	COMPANII
WHERE CLIENTI.id_client=SERVICII.id_client and CLIENTI.id_companie=COMPANII.id_companie
ORDER BY CLIENTI.nume

--6) Afișați cel mai vechi incident nefinalizat,clientul caruia ii apartine si angajatul desemnat sa il rezolve.*/
/*>2 tabele, group by*/
SELECT	CONCAT(ANGAJATI.nume , ANGAJATI.prenume) as "ANGAJAT",CONCAT(CLIENTI.nume,CLIENTI.prenume) as "CLIENT", denumire, MIN(data_inceput) as"data incepere"
FROM incidente LEFT JOIN ANGAJATI ON INCIDENTE.id_angajat=ANGAJATI.id_angajat  LEFT JOIN CLIENTI ON CLIENTI.id_client=INCIDENTE.id_client
GROUP BY ANGAJATI.nume,ANGAJATI.prenume,CLIENTI.nume,CLIENTI.prenume,denumire, data_finalizare 
HAVING MIN(data_inceput)=(SELECT MIN(data_inceput) FROM incidente WHERE data_finalizare IS NULL)

--7) Afișați proiectul care a adus cel mai mare profit companiei si angajatii care au lucrat la el.*/
/*WHERE,GROUP BY,HAVING,>2 TABELE,M-N*/
SELECT ANGAJATI.nume,ANGAJATI.prenume, denumire, MAX(pret*nr_vanzari)
FROM proiecte,distribuiri
JOIN angajati ON ANGAJATI.id_angajat=DISTRIBUIRI.id_angajat
WHERE PROIECTE.cod=DISTRIBUIRI.cod
GROUP BY ANGAJATI.nume,ANGAJATI.prenume,denumire 
HAVING MAX(pret*nr_vanzari)=(SELECT MAX(pret*nr_vanzari) FROM proiecte)

--8) Afișați în ordine crescatoare angajații care au lucrat la cel putin un proiect.*/
/*DISTINCT,WHERE,M-N,>2 TABELE*/
SELECT DISTINCT nume, prenume, functie,angajati.id_angajat
FROM angajati, distribuiri, proiecte 
WHERE distribuiri.id_angajat=angajati.id_angajat AND distribuiri.cod=proiecte.cod 
ORDER BY nume

--9) Afișați proiectele cu număr maxim de vânzări.*/
/*GROUP BY,HAVING*/
SELECT denumire, MAX(nr_vanzari) as "nr vanzari"
FROM proiecte 
GROUP BY denumire 
HAVING MAX(nr_vanzari)=(SELECT MAX(nr_vanzari) FROM proiecte)

--10) Afisati proiectele care au fost finalizate in ultimii 5 ani*/
/*WHERE*/
SELECT p.denumire, p.pret, p.nr_vanzari FROM PROIECTE p
WHERE p.data_finalizarii IS NOT NULL and  YEAR(SYSDATETIME())-YEAR(p.data_finalizarii)<= 5
