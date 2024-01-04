use marathon;


/* Jour et mois des épreuves de 2016 avec mois en toute lettre*/
SELECT EP_ID AS EPREUVE 
, date_format(EP_DATE, "%W %M %Y") AS DATE 
FROM EPREUVE
WHERE EP_DATE LIKE '%2016%';



/*list des coureurs noms & prénoms dans une colonne, âge dans une autre*/
SELECT concat(CO_NOM, " ", CO_Prenom) as Name
, CO_NAISSANCE as birth
, curdate()
, timestampdiff(YEAR, Co_naissance, curdate())
/*, timediff(curdate(), co_naissance)*/
/* timestamp(CO_NAISSANCE, CURDATE()) as age*/
FROM coureur
WHERE CO_SEXE = 1;


/* lister le nom et les dates des épreuves de 2016 dont le départ a eu lieu avant 14h*/
SELECT EP_ID as ID
, date_format(EP_DATE,'%W %M %Y') AS Date
, EP_HEURE as Heure
FROM EPREUVE
WHERE EP_HEURE <= "14:00:00" and EP_DATE like "%2016%";

/*liste des coureurs nés entre 1930 & 1960 - du plus vieux au plus jeune avec le sexe en toute lettre*/
SELECT CO_ID as ID
, CO_NOM as Surname
, CO_PRENOM as Name
, CO_NAISSANCE as Birth
, CO_SEXE  as Sexe 
, Replace (CO_SEXE, 1, "Male")
FROM COUREUR
WHERE CO_SEXE = 1
ORDER BY CO_NAISSANCE desc;

/* liste des clubs dont le nom ne commence pas par "Les"*/
SELECT CL_ID as ID
, CL_NOM as Name
FROM club
WHERE CL_NOM NOT LIKE "Les%"; 

/*Liste des coureurs nés en janvier ou en avril. Le prénom et le nom dans la même colonne*/
SELECT CO_ID as ID
, concat(CO_NOM,' ', CO_PRENOM) as Name
, CO_NAISSANCE as Birth
FROM coureur 
WHERE CO_naissance like '%-01-%' 
OR  co_naissance like '%-04-%';

/* Liste des coureurs nés dans les années 40 et précision si c'est une femme ou non*/
SELECT CO_ID as ID
, CO_NOM AS surname
, co_prenom as name 
, concat(replace(replace(co_sexe, '2', 'Yes'), '1', 'No')) as Sex
FROM COUREUR;


/*liste des catégories d'âge dont le nom commence par "M" ou par "B"*/
SELECT CA_ID as ID
, CA_LIBELLE as Name
FROM Categorie_age
WHERE Ca_libelle like 'M%'
 or ca_libelle like 'B%';
 
 /*List des quinze premiers caractères du nom des clubs de Bordeaux*/
SELECT cl_id AS ID
, LEFT (cl_nom, 15) AS Name
, cl_ville as Ville
FROM club
WHERE cl_ville like 'Bordeaux';

/*Remplacer dans les noms des coureurs les "é" "è" par des "e"*/
SELECT co_id AS ID
, replace(replace(co_nom, 'è', 'e' ), 'é', 'e') AS Surname
, replace(replace(co_prenom, 'è', 'e'), 'é', 'e') AS Name
FROM coureur