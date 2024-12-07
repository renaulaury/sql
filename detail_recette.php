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
            <a href="./recettes.php">Listing recettes</a>
        </nav>
    </header>

    <main>

        <section>
            <?php
            /*Connexion a la BDD*/
            try {
                $bdd = new PDO(
                    'mysql:host=localhost;dbname=recettelily;charset=utf8',
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
                $recette = $recipesStatement->fetch(PDO::FETCH_ASSOC); //tableau associatif - - clés sont noms des colonnes

                /*Récupération table categorie*/
                $idCategorie = intval($_GET['id']); // Sécurise l'entrée utilisateur
                // Prépare une requête pour récupérer la categorie spécifique
                $sqlQueryCategorie = 'SELECT * FROM categorie WHERE id_categorie = :id'; //Selectionne
                $catStatement = $bdd->prepare($sqlQueryCategorie); //Prépare requete sql
                $catStatement->bindParam(':id', $idCategorie, PDO::PARAM_INT); //Le parametre :id sera remplacé par la valeur $idrecette - sera un entier
                $catStatement->execute(); //Execute la requete préparée

                // Récupération des données de la recette
                $categorie = $catStatement->fetch(PDO::FETCH_ASSOC); //tableau associatif - - clés sont noms des colonnes

                /*Récupération table ingredient*/
                $idIngredient = intval($_GET['id']); // Sécurise l'entrée utilisateur
                // Prépare une requête pour récupérer les ingredients spécifiques
                $sqlQueryIngredient = 'SELECT * FROM ingredient WHERE id_ingredient = :id'; //Selectionne
                $ingStatement = $bdd->prepare($sqlQueryIngredient); //Prépare requete sql
                $ingStatement->bindParam(':id', $idingredient, PDO::PARAM_INT); //Le parametre :id sera remplacé par la valeur $idrecette - sera un entier
                $ingStatement->execute(); //Execute la requete préparée

                // Récupération des données de la recette
                $ingredient = $ingStatement->fetch(PDO::FETCH_ASSOC); //tableau associatif - - clés sont noms des colonnes


                // Vérifie si une recette a été trouvée
                if ($recette) {
            ?>
                    <h1>Détail de la recette : <?php echo $recette['nom_recette']; ?></h1>
                    <section>
                        <p><strong>Ingredients :</strong> <?php echo $ingredient['nom_ingredient']; ?></p>
                        <p><strong>Categorie :</strong> <?php echo $categorie['nom_categorie']; ?></p>
                        <p><strong>Temps de préparation :</strong> <?php echo $recette['temps_preparation']; ?> minutes</p>
                        <p><strong>Instructions :</strong> <?php echo $recette['instructions']; ?></p>
                    </section>
            <?php
                } else {
                    echo "<p>Recette introuvable.</p>";
                }
            }
            ?>
        </section>


    </main>
</body>

</html>