-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Mar-2021 às 18:30
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
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`) VALUES
(1, 'Lojao Carro', 'hugovasconcelosf@hotmail.com', '$2y$10$AV0D6RdsjOXlj4niIJTloetb1oIkO/kdtIrm/rPqUJOMgjLYQbuoy'),
(3, 'Lojao Carro', 'admin@tecdiary.com', '$2y$10$it3dGVfZ0sb.PLjg7hCB.uHZJ/oMZysE700urD6fw.FTaxHWp35c.'),
(4, 'admin', 'admin@eneylton.com', '$2y$10$e5tWzXMkQMwLDIOsevmEFOfjWUgbDaxdF/W0//TLRPxbzvYzkS5ka'),
(5, 'Marinna', 'maria@gmail.com', '$2y$10$bCIqQjmpnhcDQaTMEL9n1OqOk3pqBmM9k6kJNT48JACoK4SH9M6k6');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vagas`
--

CREATE TABLE `vagas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(225) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `ativo` varchar(45) DEFAULT NULL,
  `data` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vagas`
--

INSERT INTO `vagas` (`id`, `titulo`, `descricao`, `ativo`, `data`) VALUES
(4, 'karinne', 'Silva ', 's', '2021-03-04 22:45:18'),
(5, 'Cocita de AraujoLIMA', 'ookl', 's', '2021-03-04 22:45:38'),
(6, 'Karla', 'reere', 'n', '2021-03-04 23:17:27'),
(7, 'Eneylton', 'dsds', 's', '2021-03-04 23:18:22'),
(8, 'Cocita de AraujoLIMA', 'dsdd', 's', '2021-03-04 23:18:30'),
(9, 'Eneylton', 'sdsd', 's', '2021-03-04 23:18:36'),
(10, 'ds', 'dsds', 's', '2021-03-04 23:18:41'),
(11, 'karinne', 'dsdsd', 'n', '2021-03-04 23:18:47'),
(12, 'Eneylton 2200212', 'sddsd', 'n', '2021-03-04 23:18:54'),
(13, 'Eneylton ookkk', 'dsdsds', 'n', '2021-03-04 23:19:01'),
(14, 'Karla', 'dsds', 's', '2021-03-04 23:19:06'),
(15, 'Eneylton ookkk', 'dssd', 's', '2021-03-04 23:19:17'),
(16, 'tr', 'rere', 's', '2021-03-04 23:19:23'),
(17, 'ererer', 'rerer', 's', '2021-03-04 23:19:28'),
(18, 'Eneylton ookkk', 'erer', 'n', '2021-03-04 23:19:35'),
(19, 'rerer', 'erer', 's', '2021-03-04 23:19:43'),
(20, 'ererer', 'ererer', 's', '2021-03-04 23:19:49');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `vagas`
--
ALTER TABLE `vagas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `vagas`
--
ALTER TABLE `vagas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
