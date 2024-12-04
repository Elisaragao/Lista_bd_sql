-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/12/2024 às 13:47
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistemapedidos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(11) NOT NULL,
  `cliente_nome` varchar(100) DEFAULT NULL,
  `cliente_perc` double DEFAULT NULL,
  `estado_codigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `cliente_nome`, `cliente_perc`, `estado_codigo`) VALUES
(1, 'José da Silva', NULL, 1),
(2, 'Carlos Pereira', NULL, 2),
(3, 'José Silveira', NULL, 3),
(4, 'Carlos Antônio', NULL, 4),
(5, 'Silvio José', NULL, 1),
(6, 'Antônio Carlos', NULL, 2),
(7, 'João Carlos', NULL, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `estado_codigo` int(11) NOT NULL,
  `estado_nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estado`
--

INSERT INTO `estado` (`estado_codigo`, `estado_nome`) VALUES
(1, 'GO'),
(2, 'DF'),
(3, 'SP'),
(4, 'MG'),
(5, 'SC');

-- --------------------------------------------------------

--
-- Estrutura para tabela `grupo`
--

CREATE TABLE `grupo` (
  `grupo_codigo` int(11) NOT NULL,
  `grupo_nome` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `grupo`
--

INSERT INTO `grupo` (`grupo_codigo`, `grupo_nome`) VALUES
(1, 'Escritório'),
(2, 'Limpeza'),
(3, 'Informática');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `item_qtde` int(11) DEFAULT NULL,
  `item_punit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item`
--

INSERT INTO `item` (`item_id`, `pedido_id`, `produto_id`, `item_qtde`, `item_punit`) VALUES
(1, 1, 1, 10, 7),
(2, 1, 2, 8, 1),
(3, 1, 3, 2, 38),
(4, 2, 1, 3, 8),
(5, 2, 3, 1, 40),
(6, 3, 4, 2, 78),
(7, 3, 5, 20, 0),
(8, 4, 6, 30, 2),
(9, 4, 1, 5, 8),
(10, 4, 2, 10, 2),
(11, 5, 3, 3, 40),
(12, 5, 4, 1, 80),
(13, 6, 6, 3, 2),
(14, 6, 5, 20, 1),
(15, 7, 1, 12, 8),
(16, 7, 2, 20, 2),
(17, 8, 3, 4, 35),
(18, 9, 4, 5, 73),
(19, 10, 5, 25, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `pedido_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `pedido_data` date DEFAULT NULL,
  `pedido_tipopg` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`pedido_id`, `cliente_id`, `pedido_data`, `pedido_tipopg`) VALUES
(1, 1, '2017-05-14', 'VVI'),
(2, 1, '2017-05-30', 'VPR'),
(3, 2, '2017-05-18', 'VPR'),
(4, 2, '2017-05-25', 'VVI'),
(5, 3, '2017-06-01', 'VPR'),
(6, 4, '2017-06-14', 'VVI'),
(7, 5, '2017-06-14', 'VPR'),
(8, 6, '2017-06-13', 'VVI'),
(9, 7, '2017-06-12', 'VPR'),
(10, 7, '2017-05-12', 'VVI');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `produto_codigo` int(11) NOT NULL,
  `produto_nome` varchar(100) DEFAULT NULL,
  `produto_punit` double DEFAULT NULL,
  `produto_qtde` int(11) DEFAULT NULL,
  `grupo_codigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`produto_codigo`, `produto_nome`, `produto_punit`, `produto_qtde`, `grupo_codigo`) VALUES
(1, 'Sabonete Liquido', 8.25, 10, 2),
(2, 'Caneta Esferográfica', 2, 100, 1),
(3, 'USB 8', 40, 50, 3),
(4, 'USB 32', 80, 20, 3),
(5, 'Lápis Preto', 1, 10, 2),
(6, 'Detergente', 2, 120, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`estado_codigo`);

--
-- Índices de tabela `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`grupo_codigo`);

--
-- Índices de tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`pedido_id`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`produto_codigo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `estado_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `grupo`
--
ALTER TABLE `grupo`
  MODIFY `grupo_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
