-- 1. Qui (prenom) conduit la voiture d'id 503 en requête imbriquée ?

SELECT prenom 
FROM conducteur 
WHERE id_conducteur IN
(SELECT id_conducteur 
FROM association_vehicule_conducteur 
WHERE id_vehicule = 503);

-- 2. Qui conduit quel modèle (prenom, modele) ?

SELECT c.prenom, v.modele 
FROM conducteur c
INNER JOIN association_vehicule_conducteur avc
ON avc.id_conducteur = c.id_conducteur
INNER JOIN vehicule v 
ON avc.id_vehicule = v.id_vehicule; 

-- 3.   Afficher TOUS les conducteurs (prenom) ainsi que les modèles de véhicules.

SELECT c.prenom, v.modele 
FROM conducteur c
LEFT JOIN association_vehicule_conducteur avc
ON avc.id_conducteur = c.id_conducteur
LEFT JOIN vehicule v 
ON avc.id_vehicule = v.id_vehicule;

-- 4.   Afficher TOUS les modèles de véhicules, y compris ceux qui n'ont pas de chauffeur, et le prénom des conducteurs.

SELECT v.modele, c.prenom 
FROM vehicule v
LEFT JOIN association_vehicule_conducteur avc
ON avc.id_vehicule = v.id_vehicule
LEFT JOIN conducteur c
ON avc.id_conducteur = c.id_conducteur;

-- 5. Afficher TOUS les conducteurs (prenom) et TOUS les modèles de véhicules.

SELECT c.prenom, v.modele 
FROM conducteur c
LEFT JOIN association_vehicule_conducteur avc
ON avc.id_conducteur = c.id_conducteur
LEFT JOIN vehicule v 
ON avc.id_vehicule = v.id_vehicule
UNION
(SELECT c.prenom, v.modele 
FROM vehicule v
LEFT JOIN association_vehicule_conducteur avc
ON avc.id_vehicule = v.id_vehicule
LEFT JOIN conducteur c
ON avc.id_conducteur = c.id_conducteur);
