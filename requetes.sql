/*Requete 1 */
SELECT nom_recette, nom_categorie, temps_preparation 
FROM recette
INNER JOIN categorie ON recette.id_categorie=categorie.id_categorie
ORDER BY temps_preparation DESC

/*Requete 2*/
SELECT nom_recette, nom_categorie, temps_preparation, COUNT(ingredients_recette.id_recette) AS NB_ingredient
FROM recette
INNER JOIN categorie ON recette.id_categorie=categorie.id_categorie
INNER JOIN ingredients_recette ON recette.id_recette=ingredients_recette.id_recette
GROUP BY recette.id_recette
ORDER BY NB_ingredient DESC

/*Requete 3*/
SELECT nom_recette, temps_preparation FROM recette
WHERE temps_preparation > 30

/*Requete 4*/
SELECT nom_recette FROM recette
WHERE nom_recette LIKE '%salade%'

/*Requete 5*/
INSERT INTO recette (nom_recette, temps_preparation, instructions, id_categorie)
VALUES ('pates bolognaise', '20', 'instructions', '2')

/*Requete 6*/
UPDATE recette
SET nom_recette = 'recette surprise'
WHERE id_recette = 3

/*Requete 7*/
DELETE FROM ingredients_recette
WHERE id_recette = 2

DELETE FROM recette
WHERE id_recette = 2

/*Requete 8*/
