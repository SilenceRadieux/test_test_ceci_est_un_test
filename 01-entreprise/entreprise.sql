-- SELECT  Le Read de notre CRUD

-- * pour ALL
SELECT * FROM employes; -- affiche toutes les données de la table

SELECT nom, prenom FROM employes; -- affiche les noms et prénoms des employés 

SELECT service FROM employes; 

SELECT DISTINCT service FROM employes; 

SELECT * FROM employes WHERE service='informatique';

SELECT * FROM employes WHERE prenom LIKE 's%'; -- affiche les employés dont le prénom commence par S

SELECT * FROM employes WHERE prenom LIKE '%e'; -- termine par e

SELECT * FROM employes WHERE prenom LIKE '%-%'; -- prénoms composés

SELECT * FROM employes WHERE date_embauche BETWEEN '2000-01-01' AND '2000-12-31'; -- LIKE '2000%' 

-- opérateurs de comparaison :
-- <
-- >
-- =
-- <=
-- >=
-- != OU <>

SELECT * FROM employes WHERE service !='informatique';

SELECT * FROM employes ORDER BY salaire ASC; -- DESC pour décroissant 

SELECT * FROM employes ORDER BY salaire, prenom DESC;

SELECT * FROM employes WHERE sexe='m' ORDER BY salaire;

SELECT * FROM employes ORDER BY salaire LIMIT 0,1;

SELECT * FROM employes ORDER BY salaire DESC LIMIT 1,1;

-- L'alias AS
SELECT salaire*12 AS salaire_annuel FROM employes;

-- fonction d'agrégation    nomFonction()

-- SUM()

SELECT SUM(salaire*12) AS salaires_totaux FROM employes;

-- MIN() et MAX()

SELECT MIN(salaire) FROM employes;

SELECT AVG(salaire) FROM employes;

-- COUNT()

SELECT COUNT(id_employes) FROM employes WHERE sexe='f';

SELECT * FROM employes WHERE service IN('comptabilité', 'informatique');


-- GROUP BY

SELECT service, COUNT(*) AS nbr_employe_service FROM employes GROUP BY service;

-- GROUP BY ... HAVING

SELECT service, COUNT(*) AS nbr_employe_service FROM employes GROUP BY service HAVING nbr_employe_service > 1;

-- EXO 

-- 1 SELECT service, id_employes FROM employes WHERE id_employes='547';

-- 2 SELECT prenom, date_embauche FROM employes WHERE prenom='Amandine';

-- 3 SELECT service, COUNT(*) AS nbr_employe_service FROM employes WHERE service='commercial';

-- 4 SELECT service, SUM(salaire*12) AS salaires_totaux FROM employes WHERE service='commercial';

-- 5 SELECT service, AVG(salaire) AS salaire_moyen FROM employes GROUP BY service;

-- 6 SELECT * FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND '2010-12-31';

-- 8&9 SELECT service, COUNT(*) AS nbr_employe_service FROM employes GROUP BY service HAVING nbr_employe_service > 1;

-- 10 SELECT * FROM employes WHERE service='commercial' ORDER BY salaire DESC LIMIT 1;

-- 11 SELECT * FROM employes ORDER BY date_embauche DESC LIMIT 1;