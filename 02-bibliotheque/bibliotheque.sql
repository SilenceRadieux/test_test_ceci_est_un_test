-- 1. Quel est l'id_abonne de Laura ?

SELECT id_abonne
FROM abonne
WHERE prenom = 'Laura';

-- 4

-- 2. L'abonné d'id_abonne 2 est venu emprunté un livre à quelles dates (date_sortie) ?

SELECT date_sortie
FROM emprunt
WHERE id_abonne = 2;
    
-- 18.12.2011 20.03.2012 15.06.2013

-- 3. Combien d'emprunts ont été effectués en tout ?

SELECT COUNT(*)
FROM emprunt;

-- 8

-- 4. Combien de livres sont sortis le 2011-12-19 ?

SELECT COUNT(*)
FROM emprunt
WHERE date_sortie = '2011-12-19';

-- 3    

-- 5. Une Vie est de quel auteur ?

SELECT auteur
FROM livre
WHERE titre = 'Une Vie';

-- GUY DE MAUPASSANT

-- 6. De combien de livres d'Alexandre Dumas dispose-t-on ?

SELECT COUNT(*)
FROM livre
WHERE auteur = 'Alexandre Dumas';

-- 2

-- 7. Quel id_livre est le plus emprunté ?

SELECT id_livre
FROM emprunt
ORDER BY id_livre DESC
LIMIT 1;

-- 105  

-- Requete imbriquee

SELECT id_livre FROM emprunt WHERE date_rendu IS NULL

-- tous les livres non rendus

SELECT * FROM livre WHERE id_livre IN(SELECT id_livre FROM emprunt WHERE date_rendu IS NULL);

-- 1. Afficher le prénom des abonnés ayant emprunté un livre le 2011-12-19

SELECT prenom
FROM abonne
WHERE id_abonne IN
(SELECT id_abonne FROM emprunt WHERE date_sortie = '2011-12-19');

-- 2. Afficher le prénom des abonnés ayant emprunté un livre d'Alphonse Daudet

SELECT prenom
FROM abonne
WHERE id_abonne IN
(SELECT id_abonne FROM emprunt WHERE id_livre IN
(SELECT id_livre FROM livre WHERE auteur = 'Alphonse Daudet'));

-- 3. Afficher le titre des livres que Chloé a empruntés

SELECT titre
FROM livre
WHERE id_livre IN
(SELECT id_livre FROM emprunt WHERE id_abonne IN
(SELECT id_abonne FROM abonne WHERE prenom = 'Chloe'));

-- 4. Afficher le titre des livres que Chloé n'a pas encore empruntés

SELECT titre
FROM livre
WHERE id_livre NOT IN
(SELECT id_livre FROM emprunt WHERE id_abonne IN
(SELECT id_abonne FROM abonne WHERE prenom = 'Chloe'));

-- 5. Afficher le titre des livres que Chloé n'a pas encore rendus

SELECT titre
FROM livre
WHERE id_livre IN
(SELECT id_livre FROM emprunt WHERE date_rendu IS NULL AND id_abonne IN
(SELECT id_abonne FROM abonne WHERE prenom = 'Chloe'));

-- 6. Combien de livres Benoît a empruntés ?

SELECT COUNT(id_livre) 
AS nombre 
FROM emprunt 
WHERE id_abonne IN 
(SELECT id_abonne FROM abonne WHERE prenom = 'Benoit');


-- Afficher le prenom, et les infos des livres que Guillaume a emprunté 

SELECT a.prenom , l.*
FROM abonne a 
INNER JOIN emprunt e 
ON a.id_abonne=e.id_abonne
INNER JOIN livre l 
ON e.id_livre=l.id_livre
WHERE a.prenom='guillaume';

-- 1. Afficher le titre, date de sortie et date de rendu des livres écrits par Alphonse Daudet.

SELECT l.titre , e.date_sortie , e.date_rendu
FROM livre l 
INNER JOIN emprunt e 
ON l.id_livre=e.id_livre
INNER JOIN abonne a 
ON e.id_abonne=a.id_abonne
WHERE l.auteur='Alphonse Daudet';

-- 2. Afficher qui (prénom) a emprunté "Une vie" sur 2011.

SELECT a.prenom
FROM livre l
INNER JOIN emprunt e
ON l.id_livre=e.id_livre
INNER JOIN abonne a
ON e.id_abonne=a.id_abonne
WHERE l.titre="Une Vie" AND e.date_sortie LIKE "2011%";

-- 3. Afficher le nombre de livres empruntés par chaque abonné (prénom).

SELECT a.prenom, COUNT(l.id_livre)
FROM abonne a
INNER JOIN emprunt e
ON a.id_abonne=e.id_abonne
INNER JOIN livre l
ON e.id_livre=l.id_livre
GROUP BY a.prenom;

-- 4. Afficher qui (prénom) a emprunté quels livres (titre) et à quelles dates (date de sortie).

SELECT a.prenom, l.titre, e.date_sortie
FROM abonne a
INNER JOIN emprunt e
ON a.id_abonne=e.id_abonne
INNER JOIN livre l
ON e.id_livre=l.id_livre;

-- Quel abonné n'a jamais emprunté de livre ?

SELECT a.prenom, l.titre, e.date_sortie
FROM abonne a LEFT JOIN emprunt e
ON a.id_abonne=e.id_abonne LEFT JOIN livre l
ON e.id_livre=l.id_livre;

-- 1° Afficher la liste des emprunts (id_emprunt) avec le titre des livres qui existent encore.

SELECT e.id_emprunt, l.titre
FROM emprunt e
INNER JOIN livre l
ON e.id_livre=l.id_livre;

-- 2° Afficher la liste de TOUS les emprunts avec le titre des livres, y compris les emprunts pour lesquels il n'y a plus de livre en bibliothèque.





