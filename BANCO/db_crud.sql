-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Mar-2021 às 00:01
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_crud`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `vagas`
--

CREATE TABLE `vagas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descricao` varchar(225) DEFAULT NULL,
  `ativo` varchar(45) DEFAULT NULL,
  `data` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vagas`
--

INSERT INTO `vagas` (`id`, `titulo`, `descricao`, `ativo`, `data`) VALUES
(15, 'ene', 'ook', 's', '2021-03-05 01:18:02'),
(16, 'Eneylton', '9iu', 's', '2021-03-05 01:18:14'),
(17, 'Jose ', '9oi', 'n', '2021-03-05 01:18:26'),
(18, 'Karinna', 'rertyuio', 'n', '2021-03-05 01:18:37'),
(19, 'Jose ', '', 'n', '2021-03-05 01:18:48'),
(20, 'Maria', 'asd', 's', '2021-03-05 01:19:00'),
(21, 'ene', 'gf', 's', '2021-03-05 01:19:12'),
(22, 'Eneylton', '77665', 'n', '2021-03-05 01:19:46'),
(23, 'jk', '90', 'n', '2021-03-05 01:20:01'),
(24, 'gh', '78', 'n', '2021-03-05 01:20:15'),
(25, 'Eneylton', 'yu', 's', '2021-03-05 01:20:29'),
(26, 'Maria', '87', 's', '2021-03-05 01:20:40'),
(27, 'Karinna', 'cv', 'n', '2021-03-05 01:20:56'),
(28, 'Jose ', '89', 'n', '2021-03-05 01:21:08'),
(29, 'Jose ', 'qa', 's', '2021-03-05 01:21:18'),
(30, 'Karinna', 'oi', 's', '2021-03-05 01:21:29'),
(31, 'Jose ', 'hj', 's', '2021-03-05 01:21:45'),
(32, 'Karinna', 'uhj', 'n', '2021-03-05 01:21:59'),
(33, 'ene', 'mn', 's', '2021-03-05 01:22:09'),
(34, 'Eneylton', 'uio', 's', '2021-03-05 01:22:22');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `vagas`
--
ALTER TABLE `vagas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `vagas`
--
ALTER TABLE `vagas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
