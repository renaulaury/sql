-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour recettelily
CREATE DATABASE IF NOT EXISTS `recettelily` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recettelily`;

-- Listage de la structure de table recettelily. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recettelily.categorie : ~2 rows (environ)
REPLACE INTO `categorie` (`id_categorie`, `nom_categorie`) VALUES
	(1, 'Entrée'),
	(2, 'Plat'),
	(3, 'Dessert');

-- Listage de la structure de table recettelily. ingredient
CREATE TABLE IF NOT EXISTS `ingredient` (
  `id_ingredient` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `unite` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `prix` float DEFAULT NULL,
  PRIMARY KEY (`id_ingredient`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recettelily.ingredient : ~30 rows (environ)
REPLACE INTO `ingredient` (`id_ingredient`, `nom_ingredient`, `unite`, `prix`) VALUES
	(1, 'chouvert', 'nb', 1),
	(2, 'oignons', 'nb', 2),
	(3, 'rizcru', 'g', 2),
	(4, 'viande', 'g', 2),
	(5, 'beurre', 'g', 1),
	(6, 'bouillonboeuf', 'cl', 20),
	(7, 'farine', 'g', 1),
	(8, 'courgette', 'nb', 3),
	(9, 'canard', 'g', 6),
	(10, 'tomates', 'nb', 2),
	(11, 'abricots', 'nb', 2),
	(12, 'framboises', 'g', 5.4),
	(13, 'cremeliquide', 'cl', 3),
	(14, 'sucreenpoudre', 'g', 2),
	(15, 'vanille', 'g', 7),
	(16, 'groseille', 'g', 4),
	(17, 'beurre', 'g', 2),
	(18, 'cannelle', 'g', 6),
	(19, 'huileolive', 'cas', 1),
	(20, 'sojatexture', 'cas', 2),
	(21, 'haricotsrouges', 'g', 3),
	(22, 'carottes', 'nb', 2),
	(23, 'ail', 'nb', 2),
	(24, 'tomates', 'nb', 1),
	(25, 'oeufs', 'nb', 1),
	(26, 'poivre', 'cac', 3),
	(27, 'pommesdeterre', 'g', 2),
	(28, 'fromage', 'g', 2),
	(29, 'lardon', 'g', 3),
	(30, 'pates', 'g', 2),
	(31, 'poivre', 'cac', 2.5);

-- Listage de la structure de table recettelily. ingredients_recette
CREATE TABLE IF NOT EXISTS `ingredients_recette` (
  `id_ingredient` int NOT NULL DEFAULT '0',
  `id_recette` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  KEY `FK_ingredients_recette_ingredients` (`id_ingredient`),
  KEY `FK_ingredients_recette_recette` (`id_recette`),
  CONSTRAINT `FK_ingredients_recette_ingredient` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredient` (`id_ingredient`),
  CONSTRAINT `FK_ingredients_recette_recette` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id_recette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recettelily.ingredients_recette : ~38 rows (environ)
REPLACE INTO `ingredients_recette` (`id_ingredient`, `id_recette`, `quantity`) VALUES
	(3, 1, 2),
	(1, 1, 5),
	(2, 1, 3),
	(4, 1, 4),
	(8, 3, 5),
	(9, 3, 4),
	(10, 3, 7),
	(11, 3, 3),
	(12, 4, 2),
	(13, 4, 11),
	(14, 4, 1),
	(12, 5, 100),
	(13, 5, 1),
	(15, 5, 50),
	(16, 6, 40),
	(5, 6, 1),
	(7, 6, 30),
	(18, 6, 500),
	(2, 7, 4),
	(19, 7, 7),
	(20, 7, 30),
	(21, 8, 100),
	(22, 8, 200),
	(2, 8, 100),
	(26, 8, 4),
	(23, 9, 50),
	(24, 9, 10),
	(2, 9, 22),
	(27, 10, 10),
	(25, 10, 1),
	(2, 10, 70),
	(7, 10, 800),
	(29, 11, 100),
	(30, 11, 150),
	(1, 119, 1),
	(1, 120, 10),
	(1, 121, 2),
	(31, 121, 2);

-- Listage de la structure de vue recettelily. prix_par_recette
-- Création d'une table temporaire pour palier aux erreurs de dépendances de VIEW
CREATE TABLE `prix_par_recette` (
	`nom_recette` VARCHAR(50) NULL COLLATE 'utf8mb4_bin',
	`TOTAL` DOUBLE NULL
) ENGINE=MyISAM;

-- Listage de la structure de table recettelily. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `id_recette` int NOT NULL AUTO_INCREMENT,
  `nom_recette` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `temps_preparation` int DEFAULT NULL,
  `instructions` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `id_categorie` int DEFAULT NULL,
  PRIMARY KEY (`id_recette`) USING BTREE,
  KEY `FK_recette_categorie` (`id_categorie`),
  CONSTRAINT `FK_recette_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recettelily.recette : ~15 rows (environ)
REPLACE INTO `recette` (`id_recette`, `nom_recette`, `temps_preparation`, `instructions`, `id_categorie`) VALUES
	(1, 'chou farci', 70, '', 2),
	(3, 'recette surprise kkk', 25, '', 1),
	(4, 'mousse au framboise', 15, '', 3),
	(5, 'panna cotta framboise', 15, '', 3),
	(6, 'muffins aux groseilles', 40, '', 3),
	(7, 'bouillon de legumes', 15, '', 1),
	(8, 'steak vegetarien aux haricots', 10, '', 2),
	(9, 'steak hache avec salade sauce', 50, '', 2),
	(10, 'rostis maison', 25, '', 1),
	(11, 'patescarbonara', 15, '', 2),
	(114, 'pates bolognaise', 15, 'instructions', 2),
	(118, 'thé', 0, 'verser de l eau', 3),
	(119, 'burger', 20, 'cuire', 1),
	(120, 'burger1', 20, 'cuire', 2),
	(121, 'burger2', 20, 'cuire', 3);

-- Listage de la structure de vue recettelily. prix_par_recette
-- Suppression de la table temporaire et création finale de la structure d'une vue
DROP TABLE IF EXISTS `prix_par_recette`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `prix_par_recette` AS select `recette`.`nom_recette` AS `nom_recette`,sum((`ingredient`.`prix` * `ingredients_recette`.`quantity`)) AS `TOTAL` from ((`recette` join `ingredients_recette` on((`recette`.`id_recette` = `ingredients_recette`.`id_recette`))) join `ingredient` on((`ingredients_recette`.`id_ingredient` = `ingredient`.`id_ingredient`))) group by `recette`.`nom_recette`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
