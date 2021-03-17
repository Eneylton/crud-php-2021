-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Mar-2021 às 16:06
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
-- Banco de dados: `db_phpcarrinho`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `nome` varchar(45) DEFAULT NULL,
  `qtd` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `produtos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id`, `data`, `nome`, `qtd`, `subtotal`, `produtos_id`) VALUES
(1, '2021-03-17 15:03:35', 'teclado', '13.00', '69.29', 2),
(2, '2021-03-17 15:03:47', 'mouse', '20.00', '333.20', 3),
(3, '2021-03-17 15:03:50', 'notbook', '65.00', '664.30', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(225) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `imagem` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `preco`, `qtd`, `imagem`) VALUES
(1, 'notbook', '10.22', 30, 'e'),
(2, 'teclado', '5.33', 10, 'e'),
(3, 'mouse', '16.66', 40, 'e'),
(4, 'teclado', NULL, 12, NULL),
(5, 'mouse', NULL, 20, NULL),
(6, 'notbook', NULL, 65, NULL);

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
(5, 'Marinna', 'maria@gmail.com', '$2y$10$bCIqQjmpnhcDQaTMEL9n1OqOk3pqBmM9k6kJNT48JACoK4SH9M6k6'),
(6, 'Admin', 'admin@gmail.com', '$2y$10$bCIqQjmpnhcDQaTMEL9n1OqOk3pqBmM9k6kJNT48JACoK4SH9M6k6'),
(7, 'ene', 'ene@gmail.com', '$2y$10$2FoE5yQAdJ5BMOTLkMN0wOnIek0ybJJVIEOips8Z0ocuQn/CE0eue'),
(8, 'ene', 'eneylton@hotmail.com', '$2y$10$exJaA.k4RyOuR3/bExI46uw2OE5CwHexrWwSJzQAux93AXRqSrt2K');

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
(20, 'ererer', 'ererer', 's', '2021-03-04 23:19:49'),
(21, 'Eneylton', 'rrr', 's', '2021-03-05 22:06:20'),
(22, 'Eneylton', 'ddd', 's', '2021-03-05 23:25:31');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_produtos_idx` (`produtos_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `vagas`
--
ALTER TABLE `vagas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_produtos` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
