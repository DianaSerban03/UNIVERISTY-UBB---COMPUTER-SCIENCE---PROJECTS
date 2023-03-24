/*Afișați proiectul care a adus cel mai mare profit companiei si angajatii care au lucrat la el.*/
/*WHERE,GROUP BY,HAVING,>2 TABELE,M-N*/

SELECT ANGAJATI.nume,ANGAJATI.prenume, denumire, MAX(pret*nr_vanzari)
FROM proiecte,distribuiri
JOIN angajati ON ANGAJATI.id_angajat=DISTRIBUIRI.id_angajat
WHERE PROIECTE.cod=DISTRIBUIRI.cod
GROUP BY ANGAJATI.nume,ANGAJATI.prenume,denumire 
HAVING MAX(pret*nr_vanzari)=(SELECT MAX(pret*nr_vanzari) FROM proiecte)
