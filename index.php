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

    </header>

    <main>
        <h1>Listing des recettes</h1>
        <section class="section_listing">

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

            $sqlQuery = 'SELECT * FROM recette
                INNER JOIN categorie
                ON recette.id_categorie = categorie.id_categorie
                ORDER BY recette.nom_recette ASC';

            $recipesStatement = $bdd->query($sqlQuery); //Pour requete simple sans parametre
            // $recipesStatement = $mysqlClient->prepare($sqlQuery);
            // $recipesStatement->execute();
            $recipes = $recipesStatement->fetchAll(); //Création tableau
            ?>
            <table class="line">
                <thead>
                    <tr class="line_title">
                        <th class="nom_rec">Recettes</th>
                        <th class="nom_cat">Catégorie</th>
                        <th class="tps">Temps de <br>préparation</th>
                    </tr>
                </thead>

                <tbody>
                    <?php
                    foreach ($recipes as $recipe) {
                    ?>
                        <tr>
                            <td class="name"><?php echo "<a href='./detail_recette.php?id=" . $recipe['id_recette'] . "'>" . $recipe['nom_recette'] . "</a>"; ?></td>
                            <td><?php echo $recipe['nom_categorie'] ?></td>
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