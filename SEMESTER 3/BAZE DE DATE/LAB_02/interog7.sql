/*Afisati repartizarea angajatilor pe departamente si sediul din care fac parte*/
/*WHERE,>2 tabele*/
SELECT DISTINCT DEPARTAMENTE.id_departament,departamente.denumire,ANGAJATI.id_angajat,nume,prenume,SEDII.denumire
FROM DEPARTAMENTE,ANGAJATI, SEDII
WHERE DEPARTAMENTE.id_departament=ANGAJATI.id_departament and SEDII.id_sediu=ANGAJATI.id_sediu
ORDER BY DEPARTAMENTE.id_departament