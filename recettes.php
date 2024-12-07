<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./styles.css" rel="stylesheet" />
    <title>Recettes</title>
</head>

<body>
    <header>
        <h1>Listing des recettes</h1>
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

            $sqlQuery = 'SELECT nom_recette, id_categorie, temps_preparation FROM recette';
            $recipesStatement = $bdd->query($sqlQuery);
            // $recipesStatement = $mysqlClient->prepare($sqlQuery);
            // $recipesStatement->execute();
            $recipes = $recipesStatement->fetchAll(); //Création tableau
            ?>
            <table class="line">
                <thead>
                    <tr>
                        <th>Recette</th>
                        <th>Catégorie</th>
                        <th>Temps de préparation</th>
                    </tr>
                </thead>

                <tbody>


                    <?php
                    foreach ($recipes as $recipe) {
                    ?>
                        <tr>
                            <td class="name"><a href="./detail_recette.php"><?php echo $recipe['nom_recette']; ?></a></td>
                            <td><?php echo $recipe['id_categorie']; ?></td>
                            <td><?php echo $recipe['temps_preparation']; ?></td>
                        </tr>
                    <?php
                    } ?>

                </tbody>
            </table>

        </section>
    </main>
</body>

</html>