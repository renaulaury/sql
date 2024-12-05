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


-- Listage de la structure de la base pour recettedatabase
CREATE DATABASE IF NOT EXISTS `recetteLily` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recetteLily`;

-- Listage de la structure de table recettedatabase. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recettedatabase.categorie : ~0 rows (environ)

-- Listage de la structure de table recettedatabase. ingredients
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id_ingredients` int NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `unite` decimal(20,6) DEFAULT NULL,
  `prix` float DEFAULT NULL,
  PRIMARY KEY (`id_ingredients`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recettedatabase.ingredients : ~30 rows (environ)
INSERT IGNORE INTO `ingredients` (`id_ingredients`, `nom_ingredient`, `unite`, `prix`) VALUES
	(1, 'chouvert', NULL, NULL),
	(2, 'oignons', NULL, NULL),
	(3, 'rizcru', NULL, NULL),
	(4, 'viande', NULL, NULL),
	(5, 'beurre', NULL, NULL),
	(6, 'bouillonboeuf', NULL, NULL),
	(7, 'farine', NULL, NULL),
	(8, 'courgette', NULL, NULL),
	(9, 'canard', NULL, NULL),
	(10, 'tomates', NULL, NULL),
	(11, 'abricots', NULL, NULL),
	(12, 'framboises', NULL, NULL),
	(13, 'cremeliquide', NULL, NULL),
	(14, 'sucreenpoudre', NULL, NULL),
	(15, 'vanille', NULL, NULL),
	(16, 'groseille', NULL, NULL),
	(17, 'beurre', NULL, NULL),
	(18, 'cannelle', NULL, NULL),
	(19, 'huileolive', NULL, NULL),
	(20, 'sojatexture', NULL, NULL),
	(21, 'haricotsrouges', NULL, NULL),
	(22, 'carottes', NULL, NULL),
	(23, 'ail', NULL, NULL),
	(24, 'tomates', NULL, NULL),
	(25, 'oeufs', NULL, NULL),
	(26, 'poivre', NULL, NULL),
	(27, 'pommesdeterre', NULL, NULL),
	(28, 'fromage', NULL, NULL),
	(29, 'lardon', NULL, NULL),
	(30, 'pates', NULL, NULL);

-- Listage de la structure de table recettedatabase. ingredients_recette
CREATE TABLE IF NOT EXISTS `ingredients_recette` (
  `id_ingredient` int NOT NULL DEFAULT '0',
  `id_recette` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '0',
  KEY `FK_ingredients_recette_ingredients` (`id_ingredient`),
  KEY `FK_ingredients_recette_recette` (`id_recette`),
  CONSTRAINT `FK_ingredients_recette_ingredients` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredients` (`id_ingredients`),
  CONSTRAINT `FK_ingredients_recette_recette` FOREIGN KEY (`id_recette`) REFERENCES `recette` (`id_recette`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recettedatabase.ingredients_recette : ~35 rows (environ)
INSERT IGNORE INTO `ingredients_recette` (`id_ingredient`, `id_recette`, `quantity`) VALUES
	(3, 1, 0),
	(1, 1, 0),
	(2, 1, 0),
	(4, 1, 0),
	(5, 2, 0),
	(6, 2, 0),
	(7, 2, 0),
	(8, 3, 0),
	(9, 3, 0),
	(10, 3, 0),
	(11, 3, 0),
	(12, 4, 0),
	(13, 4, 0),
	(14, 4, 0),
	(12, 5, 0),
	(13, 5, 0),
	(15, 5, 0),
	(16, 6, 0),
	(5, 6, 0),
	(7, 6, 0),
	(18, 6, 0),
	(2, 7, 0),
	(19, 7, 0),
	(20, 7, 0),
	(21, 8, 0),
	(22, 8, 0),
	(2, 8, 0),
	(26, 8, 0),
	(23, 9, 0),
	(24, 9, 0),
	(2, 9, 0),
	(27, 10, 0),
	(25, 10, 0),
	(2, 10, 0),
	(7, 10, 0);

-- Listage de la structure de table recettedatabase. recette
CREATE TABLE IF NOT EXISTS `recette` (
  `id_recette` int NOT NULL AUTO_INCREMENT,
  `nom_recette` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `temps_preparation` int DEFAULT NULL,
  `instructions` int DEFAULT NULL,
  `id_categorie` int DEFAULT NULL,
  PRIMARY KEY (`id_recette`) USING BTREE,
  KEY `FK_recette_categorie` (`id_categorie`),
  CONSTRAINT `FK_recette_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table recettedatabase.recette : ~11 rows (environ)
INSERT IGNORE INTO `recette` (`id_recette`, `nom_recette`, `temps_preparation`, `instructions`, `id_categorie`) VALUES
	(1, 'chou farci', 75, NULL, NULL),
	(2, 'sauce au poivre', 15, NULL, NULL),
	(3, 'brochettes de canard', 30, NULL, NULL),
	(4, 'mousse au framboise', 20, NULL, NULL),
	(5, 'panna cotta framboise', 20, NULL, NULL),
	(6, 'muffins aux groseilles', 45, NULL, NULL),
	(7, 'bouillon de legumes', 20, NULL, NULL),
	(8, 'steak vegetarien aux haricots', 15, NULL, NULL),
	(9, 'steakhacheavecsaladeetsauce', 55, NULL, NULL),
	(10, 'rostis maison', 30, NULL, NULL),
	(11, 'patescarbonara', 30, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
recettedatabase