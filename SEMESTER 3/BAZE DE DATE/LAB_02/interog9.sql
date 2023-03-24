/* Afișați în ordine crescatoare angajații care au lucrat la cel putin un serviciu*/
/*DISTINCT,WHERE,M-N,>2 TABELE*/
SELECT DISTINCT nume, prenume, functie,angajati.id_angajat
FROM angajati, COLABORARI, servicii 
WHERE colaborari.id_angajat=angajati.id_angajat AND colaborari.cod_serv=servicii.cod_serv
ORDER BY nume
