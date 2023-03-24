/*Afișați proiectele cu număr maxim de vânzări.*/
/*GROUP BY,HAVING*/
SELECT denumire, MAX(nr_vanzari) as "nr vanzari"
FROM proiecte 
GROUP BY denumire 
HAVING MAX(nr_vanzari)=(SELECT MAX(nr_vanzari) FROM proiecte)
