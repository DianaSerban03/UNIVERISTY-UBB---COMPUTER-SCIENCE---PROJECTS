/* Afișați în ordine crescatoare angajații care au lucrat la cel putin un proiect.*/
/*DISTINCT,WHERE,M-N,>2 TABELE*/
SELECT DISTINCT nume, prenume, functie,angajati.id_angajat
FROM angajati, distribuiri, proiecte 
WHERE distribuiri.id_angajat=angajati.id_angajat AND distribuiri.cod=proiecte.cod 
ORDER BY nume
