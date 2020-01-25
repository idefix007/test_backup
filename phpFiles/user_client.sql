-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  sam. 25 jan. 2020 à 15:15
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `testdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `user_client`
--

DROP TABLE IF EXISTS `user_client`;
CREATE TABLE IF NOT EXISTS `user_client` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fk_users` int(10) NOT NULL,
  `fk_clients` int(10) NOT NULL,
  `prixVente` double NOT NULL,
  `prixAchat` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users` (`fk_users`),
  KEY `fk_clients` (`fk_clients`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_client`
--

INSERT INTO `user_client` (`id`, `fk_users`, `fk_clients`, `prixVente`, `prixAchat`) VALUES
(1, 1, 1, 50, 100),
(2, 1, 2, 50, 100),
(3, 1, 5, 50, 20),
(4, 1, 6, 50, 50);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `user_client`
--
ALTER TABLE `user_client`
  ADD CONSTRAINT `user_client_ibfk_1` FOREIGN KEY (`fk_users`) REFERENCES `users` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `user_client_ibfk_2` FOREIGN KEY (`fk_clients`) REFERENCES `client` (`client_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
