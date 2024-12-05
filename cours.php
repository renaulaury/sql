<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    /*Connexion a la BDD*/
        try 
        {
            $mysqlClient = new PDO('mysql:host=localhost;dbname=recettelily;charset=utf8', 
            'root', 
            '',
            [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION], /*Permet d'afficher erreurs clairement*/
        );
            
        }
        catch (Exception $e)
        {
            die('Erreur : ' . $e->getMessage());
        }

    $recipesStatement = $mysqlClient->prepare('SELECT * FROM recette'); /*requete*/
    $recipesStatement->execute(); 
    $recipe = $recipesStatement->fetchAll();

    $sqlQuery = 'SELECT nom_recette, temps_preparation FROM recette';
    $recipesStatement = $mysqlClient->prepare($sqlQuery);
    $recipesStatement->execute();
    $recipes = $recipesStatement->fetchAll();

    foreach ($recipes as $recipe) {
        ?>
        <p><?php echo $recipe['nom_recette']; ?></p>
        <p><?php echo $recipe['temps_preparation']; ?></p>
        <?php
    }

    


    ?>
</body>
</html>