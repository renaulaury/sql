<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./styles.css" rel="stylesheet" />
    <title>Détail recette</title>
</head>

<body>
    <header>
        <nav>
            <a href="./index.php">Retour aux recettes</a>
        </nav>
    </header>

    <main>
        <?php
        /*Connexion a la BDD*/
        try {
            $bdd = new PDO(
                'mysql:host=localhost;dbname=recipes;charset=utf8',
                'root',
                '',
                [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION], /*Permet d'afficher erreurs clairement*/
            );
        } catch (Exception $e) {
            die('Erreur : ' . $e->getMessage());
        }

        // Vérification si un ID de recette est passé dans l'URL
        if (isset($_GET['id']) && is_numeric($_GET['id'])) {
            $idRecette = intval($_GET['id']); // Sécurise l'entrée utilisateur

            /*Récupération table recette*/
            // Prépare une requête pour récupérer la recette spécifique
            $sqlQueryRecette = 'SELECT * FROM recette WHERE id_recette = :id'; //Selectionne
            $recipesStatement = $bdd->prepare($sqlQueryRecette); //Prépare requete sql
            $recipesStatement->bindParam(':id', $idRecette, PDO::PARAM_INT); //Le parametre :id sera remplacé par la valeur $idrecette - sera un entier
            $recipesStatement->execute(); //Execute la requete préparée

            // Récupération des données de la recette
            $recettes = $recipesStatement->fetch(PDO::FETCH_ASSOC); //tableau associatif - - clés sont noms des colonnes

            /*Récupération table categorie*/
            // Prépare une requête pour récupérer la categorie spécifique
            $sqlQueryCategorie = 'SELECT * FROM categorie WHERE id_categorie = :id'; //Selectionne
            $catStatement = $bdd->prepare($sqlQueryCategorie); //Prépare requete sql
            // $catStatement->bindParam(':id', $idCategorie, PDO::PARAM_INT); //Le parametre :id sera remplacé par la valeur $idrecette - sera un entier
            $catStatement->bindParam(':id', $recettes['id_categorie'], PDO::PARAM_INT);
            $catStatement->execute(); //Execute la requete préparée

            // Récupération des données de la recette
            $categorie = $catStatement->fetch(PDO::FETCH_ASSOC); //tableau associatif - - clés sont noms des colonnes

            /*Récupération table ingredient*/
            // Prépare une requête pour récupérer les ingredients spécifiques
            $sqlQueryIngredients =
                'SELECT * FROM ingredients_recette 
                INNER JOIN ingredient 
                ON ingredients_recette.id_ingredient = ingredient.id_ingredient
                WHERE ingredients_recette.id_recette = :id';
            $ingStatement = $bdd->prepare($sqlQueryIngredients); //Prépare requete sql
            $ingStatement->bindParam(':id', $idRecette, PDO::PARAM_INT); //Le parametre :id sera remplacé par la valeur $idrecette - sera un entier
            $ingStatement->execute(); //Execute la requete préparée

            // Récupération des données de la recette
            $ingredients = $ingStatement->fetchAll(PDO::FETCH_ASSOC); //tableau associatif - - clés sont noms des colonnes


            // Vérifie si une recette a été trouvée
            if ($recettes) {
        ?>

                <h1>Détail de la recette : </br><?php echo $recettes['nom_recette']; ?></h1>

                <section>
                    <p class="title"><strong>Categorie :</strong> <?php echo $categorie['nom_categorie']; ?></p>
                    <p class="title"><strong>Temps de préparation :</strong> <?php echo $recettes['temps_preparation']; ?> minutes</p>

                    <p class="title ing"><strong>Ingredients :</strong>
                    <ul>
                        <?php foreach ($ingredients as $ingredient) {
                            echo "<li>" . $ingredient['quantity'] . " " . $ingredient['unite_de_mesure'] . " " . $ingredient['nom_ingredient'] . "</li>";
                        }
                        ?>
                    </ul>
                    </p>
                    <p class="title"><strong>Instructions :</strong></br></br> <?php echo $recettes['instructions']; ?></p>
                </section>
        <?php
            } else {
                echo "<p>Recette introuvable.</p>";
            }
        }
        ?>

    </main>
</body>

</html>