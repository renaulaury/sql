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
SELECT nom_recette, SUM(quantity * prix) AS total
FROM recette
INNER JOIN ingredients_recette ON recette.id_recette=ingredients_recette.id_recette
INNER JOIN ingredients ON ingredients_recette.id_ingredient=ingredients.id_ingredients
WHERE recette.id_recette = 5


SELECT nom_recette, SUM(quantity * prix) AS total
FROM recette
INNER JOIN ingredients_recette ON recette.id_recette=ingredients_recette.id_recette
INNER JOIN ingredients ON ingredients_recette.id_ingredient=ingredients.id_ingredients
GROUP BY recette.id_recette ORDER BY total DESC

/*Requete 9*/
SELECT nom_recette, quantity, prix
FROM recette
INNER JOIN ingredients_recette ON recette.id_recette=ingredients_recette.id_recette
INNER JOIN ingredients ON ingredients_recette.id_ingredient=ingredients.id_ingredients
WHERE recette.id_recette = 5

/*Requete 10*/
INSERT INTO ingredients (nom_ingredient, unite, prix)
VALUES ('poivre', 'cac', '2.5')

/*Requete 11*/
UPDATE ingredients
SET prix = '5.40'
WHERE ingredients.id_ingredients = 12

/*Requete 12*/
SELECT nom_categorie, COUNT(nom_recette)
FROM recette
INNER JOIN categorie ON recette.id_categorie=categorie.id_categorie
GROUP BY nom_categorie

/*Requete 13*/
SELECT nom_recette FROM recette
WHERE nom_recette LIKE '%framboise%'

/*Requete 14*/
UPDATE recette
SET temps_preparation = temps_preparation - 5

/*Requete 15*/
SELECT recette.nom_recette
FROM recette 
WHERE recette.id_recette NOT IN (
	SELECT ingredients_recette.id_recette
 	FROM ingredients_recette 
 	INNER JOIN ingredient
	ON ingredients_recette.id_ingredient = ingredient.id_ingredient
   WHERE ingredient.prix > 2 
	AND ingredients_recette.id_recette = recette.id_recette
)

/*Requete 16*/
SELECT nom_recette, temps_preparation
FROM recette
WHERE temps_preparation < 30

/*Requete 17*/
SELECT nom_recette, id_ingredient
FROM recette
LEFT JOIN ingredients_recette ON recette.id_recette = ingredients_recette.id_recette
WHERE id_ingredient IS NULL

/*Requete 18*/
SELECT nom_ingredient, COUNT(ingredient.id_ingredient) AS nb
FROM recette
INNER JOIN ingredients_recette ON recette.id_recette = ingredients_recette.id_recette
INNER JOIN ingredient ON ingredients_recette.id_ingredient = ingredient.id_ingredient
GROUP BY nom_ingredient
HAVING nb > 3

/*Requete 19*/
INSERT INTO ingredients_recette (id_ingredient, id_recette, quantity)
VALUES ("31", "121", "2")

/*Requete 20*/
SELECT nom_recette, SUM(prix * quantity) AS total
FROM recette
INNER JOIN ingredients_recette ON recette.id_recette = ingredients_recette.id_recette
INNER JOIN ingredient ON ingredients_recette.id_ingredient = ingredient.id_ingredient
GROUP BY nom_recette
ORDER BY total DESC