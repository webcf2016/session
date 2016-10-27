-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 27 Octobre 2016 à 18:30
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `poussession`
--
CREATE DATABASE IF NOT EXISTS `poussession` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `poussession`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(80) DEFAULT NULL,
  `text` text,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `utilisateurid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `title`, `text`, `date`, `utilisateurid`) VALUES
(2, 'sd', 'dfggf dfgfdg', '2015-01-01 03:04:00', 2),
(3, 'dfgfdtg', 'frgtrqgh', '2011-01-01 00:00:00', 2),
(4, 'sddf', 'qsdf', '2011-01-01 00:00:00', 2);

-- --------------------------------------------------------

--
-- Structure de la table `article_has_section`
--

CREATE TABLE `article_has_section` (
  `article_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `article_has_section`
--

INSERT INTO `article_has_section` (`article_id`, `section_id`) VALUES
(2, 1),
(3, 1),
(2, 2),
(2, 3),
(3, 3),
(4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

CREATE TABLE `section` (
  `id` int(10) UNSIGNED NOT NULL,
  `intitule` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `section`
--

INSERT INTO `section` (`id`, `intitule`) VALUES
(1, 'Section A'),
(2, 'Section B'),
(3, 'Section C');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `name`, `firstname`) VALUES
(1, 'aa', 'aaa'),
(2, 'bb', 'bba');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_article_utilisateur1_idx` (`utilisateurid`);

--
-- Index pour la table `article_has_section`
--
ALTER TABLE `article_has_section`
  ADD PRIMARY KEY (`article_id`,`section_id`),
  ADD KEY `fk_article_has_section_section1_idx` (`section_id`),
  ADD KEY `fk_article_has_section_article_idx` (`article_id`);

--
-- Index pour la table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_utilisateur1` FOREIGN KEY (`utilisateurid`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `article_has_section`
--
ALTER TABLE `article_has_section`
  ADD CONSTRAINT `fk_article_has_section_article` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_article_has_section_section1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

