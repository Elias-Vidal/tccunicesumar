
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `caixa` (
  `id` int(11) NOT NULL,
  `tipo` enum('entrada','saida') NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `data_transacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `caixa` (`id`, `tipo`, `descricao`, `valor`, `forma_pagamento`, `data_transacao`) VALUES
(1, 'entrada', 'Venda: 5x Farinha', 10.00, 'Pix', '2026-05-19 01:30:56'),
(2, 'saida', 'fornecedor farinha', 5.00, 'Pix', '2026-05-19 01:31:37'),
(4, 'saida', 'ovos', 100.00, 'Dinheiro', '2026-05-19 01:36:34'),
(5, 'entrada', 'Fechamento 10', 14.00, 'Dinheiro', '2026-05-21 01:12:45'),
(6, 'entrada', 'Fechamento 10', 10.00, 'Pix', '2026-05-21 01:12:45'),
(7, 'entrada', 'Fechamento 001', 3.00, 'Dinheiro', '2026-05-21 01:24:37'),
(11, 'entrada', 'Fechamento Comanda 6', 156.00, 'Cartão de Débito', '2026-05-23 02:03:38'),
(12, 'entrada', 'Fechamento Comanda 8', 45.00, 'Pix', '2026-05-23 02:03:54'),
(14, 'entrada', 'Fechamento Comanda 4', 15.00, 'Dinheiro', '2026-05-23 02:04:17'),
(17, 'entrada', 'Fechamento Comanda 12', 15.00, 'Dinheiro', '2026-05-30 01:32:32'),
(18, 'entrada', 'Fechamento Comanda 12', 5.00, 'Cartão de Débito', '2026-05-30 01:32:32'),
(19, 'saida', 'Fornecedor A', 20.00, 'Pix', '2026-05-30 01:35:53'),
(20, 'entrada', 'troco', 100.00, 'Dinheiro', '2026-05-30 01:36:59'),
(21, 'entrada', 'Fechamento Comanda 11', 13.00, 'Dinheiro', '2026-06-10 01:30:50'),
(22, 'entrada', 'Fechamento Comanda 13', 9.00, 'Pix', '2026-06-10 01:49:44'),
(23, 'entrada', 'Fechamento Comanda 15', 10.00, 'Dinheiro', '2026-06-10 02:04:16'),
(24, 'entrada', 'Fechamento Comanda 16', 10.00, 'Dinheiro', '2026-06-10 02:11:32'),
(25, 'entrada', 'Fechamento Comanda 17', 2.00, 'Dinheiro', '2026-06-11 01:01:34'),
(26, 'entrada', 'Fechamento Comanda 18', 15.00, 'Dinheiro', '2026-06-11 01:04:39'),
(27, 'entrada', 'Venda PDV - Comanda #19', 15.00, 'Dinheiro', '2026-06-11 01:06:35'),
(28, 'entrada', 'Venda PDV - Comanda #26', 15.00, 'Pix', '2026-06-11 01:16:07'),
(29, 'entrada', 'Venda PDV - Comanda #25', 50.00, 'Cartão de Crédito', '2026-06-11 01:16:14'),
(30, 'entrada', 'Venda PDV - Comanda #24', 50.00, 'Cartão de Débito', '2026-06-11 01:16:21'),
(31, 'entrada', 'Venda PDV - Comanda #23', 10.00, 'Dinheiro', '2026-06-11 01:16:27'),
(32, 'entrada', 'Venda PDV - Comanda #23', 10.00, 'Pix', '2026-06-11 01:16:27'),
(33, 'entrada', 'Venda PDV - Comanda #22', 30.00, 'Cartão de Crédito', '2026-06-11 01:16:33'),
(34, 'entrada', 'Venda PDV - Comanda #21', 59.00, 'Cartão de Crédito', '2026-06-11 01:16:38'),
(35, 'entrada', 'Venda PDV - Comanda #20', 22.00, 'Dinheiro', '2026-06-11 01:16:43'),
(36, 'entrada', 'Venda PDV - Comanda #27', 40.00, 'Pix', '2026-06-11 01:55:22'),
(37, 'entrada', 'Venda PDV - Comanda #27', 50.00, 'Cartão de Débito', '2026-06-11 01:55:22'),
(38, 'saida', 'Conta luz', 150.00, 'Pix', '2026-06-11 01:55:53'),
(39, 'entrada', 'Venda PDV - Comanda #28', 9.00, 'Dinheiro', '2026-06-11 02:05:33'),
(40, 'entrada', 'Venda PDV - Comanda #28', 8.00, 'Pix', '2026-06-11 02:05:33'),
(41, 'entrada', 'Venda PDV - Comanda #28', 21.50, 'Cartão de Crédito', '2026-06-11 02:05:33'),
(42, 'entrada', 'Venda PDV - Comanda #28', 0.50, 'Cartão de Débito', '2026-06-11 02:05:33'),
(43, 'entrada', 'Venda PDV - Comanda #29', 10.00, 'Dinheiro', '2026-06-16 00:14:38'),
(44, 'entrada', 'troco notas de 10', 50.00, 'Dinheiro', '2026-06-16 00:15:02'),
(45, 'saida', 'internet loja', 100.00, 'Pix', '2026-06-16 00:15:20'),
(46, 'entrada', 'Venda PDV - Comanda #30', 10.00, 'Dinheiro', '2026-06-27 00:15:31'),
(47, 'entrada', 'Venda PDV - Comanda #30', 40.00, 'Pix', '2026-06-27 00:15:31'),
(48, 'entrada', 'Venda PDV - Comanda #30', 5.00, 'Cartão de Crédito', '2026-06-27 00:15:31'),
(49, 'entrada', 'Venda PDV - Comanda #32', 390.00, 'Cartão de Crédito', '2026-06-27 01:12:44'),
(50, 'entrada', 'Venda PDV - Comanda #31', 4.00, 'Pix', '2026-06-27 01:14:43'),
(51, 'entrada', 'Venda PDV - Comanda #31', 40.00, 'Cartão de Débito', '2026-06-27 01:14:43'),
(52, 'entrada', 'Pacote chiclete balcao', 5.00, 'Pix', '2026-06-27 01:15:42'),
(53, 'entrada', 'Venda PDV - Comanda #33', 119.00, 'Dinheiro', '2026-06-27 01:23:41'),
(54, 'entrada', 'Venda PDV - Comanda #34', 90.00, 'Pix', '2026-06-27 01:26:02'),
(55, 'entrada', 'Venda PDV - Comanda #35', 80.00, 'Cartão de Crédito', '2026-06-27 01:26:09'),
(56, 'entrada', 'Venda PDV - Comanda #36', 390.00, 'Cartão de Débito', '2026-06-27 01:26:15'),
(57, 'entrada', 'Venda PDV - Comanda #37', 8.00, 'Dinheiro', '2026-06-27 01:26:25'),
(58, 'entrada', 'Venda PDV - Comanda #37', 100.00, 'Cartão de Débito', '2026-06-27 01:26:25'),
(59, 'entrada', 'Venda PDV - Comanda #38', 160.00, 'Pix', '2026-06-27 01:26:29'),
(60, 'saida', '137 reais sangria caixa', 137.00, 'Dinheiro', '2026-06-27 01:27:03'),
(61, 'entrada', 'Venda PDV - Comanda #68', 200.00, 'Dinheiro', '2026-06-27 03:14:34'),
(62, 'entrada', 'Venda PDV - Comanda #67', 10.00, 'Dinheiro', '2026-06-27 03:14:51'),
(63, 'entrada', 'Venda PDV - Comanda #67', 50.00, 'Pix', '2026-06-27 03:14:51'),
(64, 'entrada', 'Venda PDV - Comanda #67', 50.00, 'Cartão de Crédito', '2026-06-27 03:14:51'),
(65, 'entrada', 'Venda PDV - Comanda #67', 50.00, 'Cartão de Débito', '2026-06-27 03:14:51'),
(66, 'saida', '210 sangria dinheiro especie', 200.00, 'Dinheiro', '2026-06-27 03:15:23'),
(67, 'entrada', 'Venda PDV - Comanda #66', 84.00, 'Cartão de Débito', '2026-06-28 17:22:29'),
(68, 'entrada', 'Venda PDV - Comanda #65', 245.00, 'Pix', '2026-06-28 17:22:36'),
(69, 'entrada', 'Venda PDV - Comanda #64', 6.00, 'Dinheiro', '2026-06-28 17:22:42'),
(70, 'entrada', 'Venda PDV - Comanda #62', 60.00, 'Cartão de Crédito', '2026-06-28 17:22:52'),
(71, 'entrada', 'Venda PDV - Comanda #49', 70.00, 'Cartão de Crédito', '2026-06-28 17:22:58'),
(72, 'entrada', 'Venda PDV - Comanda #40', 84.00, 'Pix', '2026-06-28 17:23:05'),
(73, 'entrada', 'Venda PDV - Comanda #46', 90.00, 'Dinheiro', '2026-06-28 17:23:15'),
(74, 'entrada', 'Venda PDV - Comanda #52', 5.00, 'Pix', '2026-07-01 22:05:28'),
(75, 'entrada', 'Venda PDV - Comanda #69', 5.00, 'Dinheiro', '2026-07-01 22:52:54'),
(76, 'entrada', 'Venda PDV - Comanda #69', 5.00, 'Pix', '2026-07-01 22:52:54'),
(77, 'entrada', 'Venda PDV - Comanda #69', 10.00, 'Cartão de Crédito', '2026-07-01 22:52:54'),
(78, 'entrada', 'Venda PDV - Comanda #69', 5.00, 'Cartão de Débito', '2026-07-01 22:52:54'),
(79, 'entrada', 'Pix troco 5 reais', 5.00, 'Pix', '2026-07-01 23:37:04'),
(80, 'saida', 'Pix troco 5 reais', 5.00, 'Pix', '2026-07-01 23:37:21'),
(81, 'entrada', 'Venda PDV - Comanda #70', 45.00, 'Dinheiro', '2026-07-04 00:30:05'),
(82, 'entrada', 'Venda PDV - Comanda #71', 50.00, 'Dinheiro', '2026-07-04 02:31:08'),
(83, 'entrada', 'Venda PDV - Comanda #71', 50.00, 'Pix', '2026-07-04 02:31:08'),
(84, 'entrada', 'Venda PDV - Comanda #71', 50.00, 'Cartão de Crédito', '2026-07-04 02:31:08'),
(85, 'entrada', 'Venda PDV - Comanda #71', 50.00, 'Cartão de Débito', '2026-07-04 02:31:08'),
(86, 'entrada', 'Venda PDV - Comanda #76', 200.00, 'Dinheiro', '2026-07-04 02:32:12'),
(87, 'entrada', 'Venda PDV - Comanda #76', 500.00, 'Pix', '2026-07-04 02:32:13'),
(88, 'entrada', 'Venda PDV - Comanda #76', 100.00, 'Cartão de Crédito', '2026-07-04 02:32:13'),
(89, 'entrada', 'Venda PDV - Comanda #76', 40.00, 'Cartão de Débito', '2026-07-04 02:32:13'),
(90, 'entrada', 'Venda PDV - Comanda #77', 50.00, 'Dinheiro', '2026-07-04 03:43:55'),
(91, 'saida', 'troco retirada 10 reais', 10.00, 'Dinheiro', '2026-07-04 03:49:43');

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `clientes` (`id`, `nome`, `email`, `telefone`, `cpf`, `data_cadastro`) VALUES
(1, 'teste1', 'testemail@mail.com', '1299999999', '123456789', '2026-05-18 23:26:24'),
(2, 'elias', 'mail@Mail.com', '12123456789', '12346800001', '2026-06-11 01:53:22');

CREATE TABLE `comandas` (
  `id` int(11) NOT NULL,
  `identificacao` varchar(100) DEFAULT 'Balcão',
  `nome_cliente` varchar(100) DEFAULT NULL,
  `status` enum('aberta','paga','cancelada') DEFAULT 'aberta',
  `total` decimal(10,2) DEFAULT 0.00,
  `data_abertura` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_fechamento` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `comandas` (`id`, `identificacao`, `nome_cliente`, `status`, `total`, `data_abertura`, `data_fechamento`) VALUES
(1, '001', NULL, 'paga', 8.00, '2026-05-21 01:01:23', '2026-05-21 01:24:37'),
(2, '10', NULL, 'paga', 24.00, '2026-05-21 01:08:58', '2026-05-21 01:12:45'),
(3, '1', NULL, 'paga', 46.00, '2026-05-23 01:44:09', '2026-05-23 01:45:42'),
(4, '10', 'nikito', 'paga', 15.00, '2026-05-23 01:57:12', '2026-05-23 02:04:17'),
(5, '1', NULL, 'paga', 23.00, '2026-05-23 02:02:49', '2026-05-24 23:34:17'),
(6, '2', NULL, 'paga', 16.00, '2026-05-23 02:02:51', '2026-05-23 02:03:38'),
(7, '3', NULL, 'paga', 16.00, '2026-05-23 02:02:52', '2026-05-23 02:04:04'),
(8, '4', NULL, 'paga', 45.00, '2026-05-23 02:02:52', '2026-05-23 02:03:54'),
(9, '10', 'teste', 'paga', 15.00, '2026-05-26 23:29:02', '2026-05-26 23:29:10'),
(11, '11', 'teste', 'paga', 13.00, '2026-05-27 01:41:50', '2026-06-10 01:30:50'),
(12, '02', 'teste', 'paga', 20.00, '2026-05-30 01:31:05', '2026-05-30 01:32:32'),
(13, '001', 'ifood', 'paga', 9.00, '2026-06-10 01:48:00', '2026-06-10 01:49:44'),
(15, 'mesa 2 ', 'joao', 'paga', 10.00, '2026-06-10 02:01:41', '2026-06-10 02:04:16'),
(16, '002', NULL, 'paga', 10.00, '2026-06-10 02:04:51', '2026-06-10 02:11:32'),
(17, '1', NULL, 'paga', 2.00, '2026-06-11 01:01:26', '2026-06-11 01:01:34'),
(18, '2', NULL, 'paga', 15.00, '2026-06-11 01:04:28', '2026-06-11 01:04:39'),
(19, '001', NULL, 'paga', 15.00, '2026-06-11 01:06:28', '2026-06-11 01:06:35'),
(20, '001', NULL, 'paga', 22.00, '2026-06-11 01:11:28', '2026-06-11 01:16:43'),
(21, '002', 'ifood', 'paga', 59.00, '2026-06-11 01:11:33', '2026-06-11 01:16:38'),
(22, '003', NULL, 'paga', 30.00, '2026-06-11 01:11:43', '2026-06-11 01:16:33'),
(23, '004', NULL, 'paga', 20.00, '2026-06-11 01:11:46', '2026-06-11 01:16:27'),
(24, '005', NULL, 'paga', 50.00, '2026-06-11 01:11:49', '2026-06-11 01:16:21'),
(25, '006', NULL, 'paga', 50.00, '2026-06-11 01:11:52', '2026-06-11 01:16:14'),
(26, '100', NULL, 'paga', 15.00, '2026-06-11 01:11:56', '2026-06-11 01:16:07'),
(27, '001', 'elias', 'paga', 90.00, '2026-06-11 01:55:04', '2026-06-11 01:55:22'),
(28, 'bbili', NULL, 'paga', 39.00, '2026-06-11 02:03:52', '2026-06-11 02:05:33'),
(29, '1', NULL, 'paga', 10.00, '2026-06-15 23:54:37', '2026-06-16 00:14:38'),
(30, '01', 'davi', 'paga', 55.00, '2026-06-27 00:12:43', '2026-06-27 00:15:31'),
(31, '02', 'vany', 'paga', 44.00, '2026-06-27 00:14:19', '2026-06-27 01:14:42'),
(32, '03', 'Ifood encomenda', 'paga', 390.00, '2026-06-27 01:12:23', '2026-06-27 01:12:44'),
(33, '03', NULL, 'paga', 119.00, '2026-06-27 01:19:41', '2026-06-27 01:23:41'),
(34, '04', 'ifood', 'paga', 90.00, '2026-06-27 01:23:47', '2026-06-27 01:26:02'),
(35, '5', '99food', 'paga', 80.00, '2026-06-27 01:23:53', '2026-06-27 01:26:09'),
(36, '6', 'joao', 'paga', 390.00, '2026-06-27 01:24:02', '2026-06-27 01:26:15'),
(37, '7', 'maria', 'paga', 108.00, '2026-06-27 01:24:07', '2026-06-27 01:26:25'),
(38, '8', 'ifood pedido', 'paga', 160.00, '2026-06-27 01:24:19', '2026-06-27 01:26:29'),
(39, '1', NULL, 'aberta', 84.00, '2026-06-27 03:09:02', NULL),
(40, '2', NULL, 'paga', 84.00, '2026-06-27 03:09:03', '2026-06-28 17:23:05'),
(41, '3', NULL, 'aberta', 245.00, '2026-06-27 03:09:05', NULL),
(42, '4', NULL, 'aberta', 42.00, '2026-06-27 03:09:06', NULL),
(43, '5', NULL, 'aberta', 82.00, '2026-06-27 03:09:07', NULL),
(44, '6', NULL, 'aberta', 140.00, '2026-06-27 03:09:09', NULL),
(45, '7', NULL, 'aberta', 56.00, '2026-06-27 03:09:11', NULL),
(46, '8', NULL, 'paga', 90.00, '2026-06-27 03:09:13', '2026-06-28 17:23:15'),
(47, '9', NULL, 'aberta', 70.00, '2026-06-27 03:09:14', NULL),
(48, '10', NULL, 'aberta', 42.00, '2026-06-27 03:09:15', NULL),
(49, '11', NULL, 'paga', 70.00, '2026-06-27 03:09:16', '2026-06-28 17:22:58'),
(50, '12', NULL, 'aberta', 72.00, '2026-06-27 03:09:17', NULL),
(51, '13', NULL, 'aberta', 56.00, '2026-06-27 03:09:18', NULL),
(52, '14', NULL, 'paga', 5.00, '2026-06-27 03:09:19', '2026-07-01 22:05:26'),
(53, '15', NULL, 'aberta', 84.00, '2026-06-27 03:09:21', NULL),
(54, '16', NULL, 'aberta', 100.00, '2026-06-27 03:09:21', NULL),
(55, '17', NULL, 'aberta', 48.00, '2026-06-27 03:09:25', NULL),
(56, '18', NULL, 'aberta', 48.00, '2026-06-27 03:09:26', NULL),
(57, '19', NULL, 'aberta', 60.00, '2026-06-27 03:09:27', NULL),
(58, '20', NULL, 'aberta', 72.00, '2026-06-27 03:09:28', NULL),
(59, '21', NULL, 'aberta', 72.00, '2026-06-27 03:09:29', NULL),
(60, '22', NULL, 'aberta', 250.00, '2026-06-27 03:09:31', NULL),
(61, '23', NULL, 'aberta', 780.00, '2026-06-27 03:09:33', NULL),
(62, '24', NULL, 'paga', 60.00, '2026-06-27 03:09:35', '2026-06-28 17:22:52'),
(63, '25', NULL, 'aberta', 96.00, '2026-06-27 03:09:36', NULL),
(64, '26', NULL, 'paga', 6.00, '2026-06-27 03:09:37', '2026-06-28 17:22:42'),
(65, '27', NULL, 'paga', 245.00, '2026-06-27 03:13:19', '2026-06-28 17:22:36'),
(66, '28', NULL, 'paga', 84.00, '2026-06-27 03:13:20', '2026-06-28 17:22:29'),
(67, '29', NULL, 'paga', 160.00, '2026-06-27 03:14:13', '2026-06-27 03:14:51'),
(68, '30', NULL, 'paga', 200.00, '2026-06-27 03:14:17', '2026-06-27 03:14:34'),
(69, '26', 'Ifood', 'paga', 25.00, '2026-07-01 22:52:28', '2026-07-01 22:52:54'),
(70, '26', 'Pedido', 'paga', 45.00, '2026-07-04 00:29:19', '2026-07-04 00:30:05'),
(71, '27', NULL, 'paga', 200.00, '2026-07-04 02:30:34', '2026-07-04 02:31:08'),
(72, '26', NULL, 'aberta', 40.00, '2026-07-04 02:31:26', NULL),
(73, '27', NULL, 'aberta', 18.00, '2026-07-04 02:31:29', NULL),
(74, '28', NULL, 'aberta', 200.00, '2026-07-04 02:31:31', NULL),
(75, '29', NULL, 'aberta', 36.00, '2026-07-04 02:31:34', NULL),
(76, '30', NULL, 'paga', 840.00, '2026-07-04 02:31:38', '2026-07-04 02:32:12'),
(77, '30', NULL, 'paga', 50.00, '2026-07-04 03:38:47', '2026-07-04 03:43:55');

CREATE TABLE `estoque` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `quantidade` int(11) DEFAULT 0,
  `custo` decimal(10,2) DEFAULT 0.00,
  `valor` decimal(10,2) NOT NULL,
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `estoque` (`id`, `nome`, `tipo`, `quantidade`, `custo`, `valor`, `data_atualizacao`) VALUES
(7, 'Pão de sal', 'Produto Final', 0, 0.30, 2.00, '2026-06-11 01:15:13'),
(8, 'café expresso', 'Produto Final', 3, 3.00, 9.00, '2026-07-04 02:32:43'),
(9, 'pudim', 'Produto Final', 0, 5.00, 30.00, '2026-06-10 01:59:44'),
(10, 'sacolinhas', 'Embalagem', 50, 1.00, 1.00, '2026-07-01 22:53:50'),
(11, 'Bolo de cenoura fatia', 'Produto Final', 3, 3.00, 15.00, '2026-06-11 02:04:21'),
(13, 'torta limao', 'Produto Final', 89, 7.50, 15.00, '2026-06-27 03:10:35'),
(14, 'cafe com leite', 'Produto Final', 87, 2.50, 10.00, '2026-07-04 02:32:51'),
(15, 'brigadeiro', 'Produto Final', 3, 2.00, 5.00, '2026-07-04 02:30:51'),
(16, 'Farinha trigo 5kg', 'Insumo', 50, 10.00, 0.00, '2026-06-11 01:54:10'),
(17, 'Bolo Chocolate', 'Produto Final', 3, 20.00, 45.00, '2026-07-04 00:29:28'),
(18, 'Cookie', 'Produto Final', 85, 3.00, 12.00, '2026-07-04 02:32:23'),
(19, 'Brownie com Nozes', 'Produto Final', 18, 3.00, 12.00, '2026-07-04 02:32:01'),
(20, 'Pão de Mel', 'Produto Final', 82, 3.00, 12.00, '2026-06-27 03:13:27'),
(21, 'Croissant Tradicional', 'Produto Final', 74, 3.00, 16.00, '2026-06-27 03:14:40'),
(22, 'Mil-folhas Tradicional', 'Produto Final', 83, 5.00, 25.00, '2026-07-04 03:40:31'),
(23, 'Cheesecake de Frutas Vermelhas', 'Produto Final', 100, 5.00, 28.00, '2026-06-27 00:50:53'),
(24, 'Éclair de Baunilha', 'Produto Final', 73, 5.00, 20.00, '2026-07-04 02:32:28'),
(25, 'Macaron', 'Produto Final', 100, 2.00, 12.00, '2026-06-27 00:51:31'),
(26, 'Cupcake recheado', 'Produto Final', 100, 2.00, 16.00, '2026-07-04 02:31:54'),
(27, 'Sonho de Creme', 'Produto Final', 86, 1.00, 8.00, '2026-06-27 03:12:27'),
(28, 'Éclair de Chocolate', 'Produto Final', 100, 2.00, 20.00, '2026-06-27 00:54:38'),
(29, 'pavlova', 'Produto Final', 96, 90.00, 390.00, '2026-06-27 03:11:10'),
(30, 'torta frutas vermelhas', 'Produto Final', 100, 50.00, 350.00, '2026-06-27 01:11:23'),
(31, 'Torta de maçã unidade', 'Produto Final', 86, 5.00, 35.00, '2026-06-27 03:13:31'),
(32, 'Agua mineral', 'Produto Final', 76, 1.00, 6.00, '2026-06-27 03:11:34'),
(33, 'Refrigerante lata', 'Produto Final', 84, 3.00, 10.00, '2026-06-27 03:11:13'),
(34, 'Chá Mate', 'Produto Final', 87, 1.00, 10.00, '2026-06-27 03:12:21'),
(35, 'Suco de Laranja', 'Produto Final', 93, 3.00, 12.00, '2026-06-27 03:12:37'),
(36, 'Soda Italiana', 'Produto Final', 94, 3.00, 10.00, '2026-06-27 03:10:44'),
(37, 'Café Coado (V60)', 'Produto Final', 91, 2.00, 12.00, '2026-06-27 03:10:31'),
(38, 'Cappuccino Italiano', 'Produto Final', 89, 3.00, 12.00, '2026-06-27 03:11:50'),
(39, 'Açucar cristal 50 kg', 'Insumo', 6, 140.00, 0.00, '2026-07-01 23:30:36'),
(40, 'Café em grão 20 kg', 'Insumo', 6, 1200.00, 0.00, '2026-07-01 23:32:57'),
(41, 'Barra de chocolate 5 kg', 'Insumo', 5, 140.00, 0.00, '2026-07-01 23:36:03');

CREATE TABLE `fechamentos_caixa` (
  `id` int(11) NOT NULL,
  `valor_esperado` decimal(10,2) DEFAULT NULL,
  `valor_informado` decimal(10,2) DEFAULT NULL,
  `diferenca` decimal(10,2) DEFAULT NULL,
  `data_fechamento` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `ficha_tecnica` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `ingrediente_id` int(11) DEFAULT NULL,
  `quantidade_necessaria` decimal(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cnpj` varchar(18) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `fornecedores` (`id`, `nome`, `email`, `telefone`, `cnpj`, `data_cadastro`) VALUES
(1, 'Distribuidor', 'email@mail.com', '129999999', '1111111111', '2026-05-19 01:29:02'),
(2, 'Distribuidora de Trigo S.A', 'vendas@trigo.com.br', '1199999999', '01010011000100', '2026-06-11 01:52:22'),
(3, 'cafe da fazenda minas gerais ltda', 'contato@cafe.com.br', '35 990001011', '401980000200', '2026-07-01 23:50:44'),
(4, 'Coopertativa Laticinios', 'vendas@fornecedor.com.br', '12 11228834', '12324111000100', '2026-07-04 03:23:08'),
(5, 'Cooperativa Laticínios', 'vendas@fornecedor.com.br', '11 11330011', '12323111-0001/00', '2026-07-04 03:28:57');

CREATE TABLE `historico_estoque` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `tipo_movimentacao` enum('entrada','saida') NOT NULL,
  `origem` varchar(100) NOT NULL,
  `data_movimentacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `historico_estoque` (`id`, `produto_id`, `nome_produto`, `quantidade`, `tipo_movimentacao`, `origem`, `data_movimentacao`) VALUES
(1, 4, 'cafe expresso', 2, 'saida', 'Venda Balcão - Comanda 3', '2026-05-23 01:44:17'),
(2, 5, 'Bolo artesanal', 2, 'saida', 'Venda Balcão - Comanda 3', '2026-05-23 01:45:12'),
(3, 5, 'Bolo artesanal', 1, 'saida', 'Venda Balcão - Comanda 4', '2026-05-23 01:57:20'),
(4, 4, 'cafe expresso', 2, 'saida', 'Venda Balcão - Comanda 7', '2026-05-23 02:03:06'),
(5, 5, 'Bolo artesanal', 3, 'saida', 'Venda Balcão - Comanda 8', '2026-05-23 02:03:16'),
(6, 4, 'cafe expresso', 2, 'saida', 'Venda Balcão - Comanda 6', '2026-05-23 02:03:22'),
(7, 4, 'cafe expresso', 20, 'entrada', 'Ajuste Manual - Gerente', '2026-05-23 02:05:18'),
(8, 5, 'Bolo artesanal', 20, 'entrada', 'Ajuste Manual - Gerente', '2026-05-23 02:05:25'),
(9, 5, 'Bolo artesanal', 1, 'saida', 'Venda Balcão - Comanda 5', '2026-05-24 23:33:46'),
(10, 4, 'cafe expresso', 1, 'saida', 'Venda Balcão - Comanda 5', '2026-05-24 23:33:48'),
(11, 5, 'Bolo artesanal', 1, 'saida', 'Venda Balcão - Comanda 9', '2026-05-26 23:29:06'),
(12, 5, 'Bolo artesanal', 1, 'saida', 'Venda Balcão - Comanda 11', '2026-05-27 01:41:57'),
(13, 3, 'ovos', 2, 'entrada', 'Ajuste Manual - Gerente', '2026-05-27 01:42:19'),
(14, 2, 'Pudim', 1, 'entrada', 'Ajuste Manual - Gerente', '2026-05-27 01:42:25'),
(15, 2, 'Pudim', 1, 'entrada', 'Ajuste Manual - Gerente', '2026-05-27 01:42:46'),
(16, 5, 'Bolo artesanal', 1, 'entrada', 'Estorno - Comanda 11', '2026-05-27 02:00:33'),
(17, 7, 'Pão de sal', 10, 'saida', 'Venda Balcão - Comanda 12', '2026-05-30 01:31:14'),
(18, 8, 'café expresso', 1, 'saida', 'Venda Balcão - Comanda 11', '2026-06-10 01:28:57'),
(19, 7, 'Pão de sal', 2, 'saida', 'Venda Balcão - Comanda 11', '2026-06-10 01:30:12'),
(20, 8, 'café expresso', 1, 'saida', 'Venda Balcão - Comanda 13', '2026-06-10 01:49:01'),
(21, 8, 'café expresso', 1, 'saida', 'Venda Balcão - Comanda 13', '2026-06-10 01:49:35'),
(22, 8, 'café expresso', 1, 'entrada', 'Estorno - Comanda 13', '2026-06-10 01:49:37'),
(23, 8, 'café expresso', 7, 'entrada', 'Ajuste Manual - Gerente', '2026-06-10 01:59:13'),
(24, 9, 'pudim', 3, 'saida', 'Ajuste Manual - Gerente', '2026-06-10 01:59:35'),
(25, 9, 'pudim', 5, 'entrada', 'Ajuste Manual - Gerente', '2026-06-10 01:59:41'),
(26, 9, 'pudim', 10, 'saida', 'Ajuste Manual - Gerente', '2026-06-10 01:59:44'),
(27, 11, 'Bolo de cenoura fatia', 1, 'saida', 'Venda Balcão - Comanda 14', '2026-06-10 02:02:10'),
(28, 11, 'Bolo de cenoura fatia', 1, 'saida', 'Venda Balcão - Comanda 14', '2026-06-10 02:02:56'),
(29, 11, 'Bolo de cenoura fatia', 1, 'entrada', 'Estorno - Comanda 14', '2026-06-10 02:03:24'),
(30, 7, 'Pão de sal', 5, 'saida', 'Venda Balcão - Comanda 15', '2026-06-10 02:04:03'),
(31, 7, 'Pão de sal', 5, 'saida', 'Venda Balcão - Comanda 16', '2026-06-10 02:04:55'),
(32, 7, 'Pão de sal', 1, 'saida', 'Venda Balcão - Comanda 17', '2026-06-11 01:01:30'),
(33, 11, 'Bolo de cenoura fatia', 1, 'saida', 'Venda Balcão - Comanda 18', '2026-06-11 01:04:33'),
(34, 11, 'Bolo de cenoura fatia', 1, 'saida', 'Venda Balcão - Comanda 19', '2026-06-11 01:06:32'),
(35, 11, 'Bolo de cenoura fatia', 1, 'entrada', 'Ajuste Manual - Gerente', '2026-06-11 01:11:02'),
(36, 8, 'café expresso', 2, 'saida', 'Venda Balcão - Comanda 20', '2026-06-11 01:12:05'),
(37, 7, 'Pão de sal', 2, 'saida', 'Venda Balcão - Comanda 20', '2026-06-11 01:12:10'),
(38, 7, 'Pão de sal', 10, 'saida', 'Venda Balcão - Comanda 23', '2026-06-11 01:12:30'),
(39, 15, 'brigadeiro', 3, 'saida', 'Venda Balcão - Comanda 26', '2026-06-11 01:14:43'),
(40, 14, 'cafe com leite', 2, 'saida', 'Venda Balcão - Comanda 25', '2026-06-11 01:14:49'),
(41, 13, 'torta limao', 2, 'saida', 'Venda Balcão - Comanda 25', '2026-06-11 01:14:54'),
(42, 11, 'Bolo de cenoura fatia', 2, 'saida', 'Venda Balcão - Comanda 24', '2026-06-11 01:15:00'),
(43, 14, 'cafe com leite', 2, 'saida', 'Venda Balcão - Comanda 24', '2026-06-11 01:15:02'),
(44, 7, 'Pão de sal', 15, 'saida', 'Venda Balcão - Comanda 22', '2026-06-11 01:15:13'),
(45, 8, 'café expresso', 1, 'saida', 'Venda Balcão - Comanda 21', '2026-06-11 01:15:18'),
(46, 15, 'brigadeiro', 1, 'saida', 'Venda Balcão - Comanda 21', '2026-06-11 01:15:21'),
(47, 13, 'torta limao', 1, 'saida', 'Venda Balcão - Comanda 21', '2026-06-11 01:15:23'),
(48, 11, 'Bolo de cenoura fatia', 2, 'saida', 'Venda Balcão - Comanda 21', '2026-06-11 01:15:28'),
(49, 17, 'Bolo Chocolate', 2, 'saida', 'Venda Balcão - Comanda 27', '2026-06-11 01:55:11'),
(50, 8, 'café expresso', 1, 'saida', 'Venda Balcão - Comanda 28', '2026-06-11 02:04:15'),
(51, 11, 'Bolo de cenoura fatia', 1, 'saida', 'Venda Balcão - Comanda 28', '2026-06-11 02:04:21'),
(52, 13, 'torta limao', 1, 'saida', 'Venda Balcão - Comanda 28', '2026-06-11 02:04:30'),
(53, 15, 'brigadeiro', 2, 'saida', 'Venda PDV - Comanda 29', '2026-06-16 00:14:33'),
(54, 17, 'Bolo Chocolate', 3, 'saida', 'Venda PDV - Comanda 30', '2026-06-27 00:13:13'),
(55, 14, 'cafe com leite', 1, 'saida', 'Venda PDV - Comanda 30', '2026-06-27 00:13:29'),
(56, 17, 'Bolo Chocolate', 3, 'entrada', 'Estorno - Comanda 30', '2026-06-27 00:13:44'),
(57, 17, 'Bolo Chocolate', 1, 'saida', 'Venda PDV - Comanda 30', '2026-06-27 00:14:02'),
(58, 8, 'café expresso', 1, 'saida', 'Venda PDV - Comanda 31', '2026-06-27 00:14:23'),
(59, 13, 'torta limao', 1, 'saida', 'Venda PDV - Comanda 31', '2026-06-27 00:19:39'),
(60, 29, 'pavlova', 1, 'saida', 'Venda PDV - Comanda 32', '2026-06-27 01:12:39'),
(61, 33, 'Refrigerante lata', 2, 'saida', 'Venda PDV - Comanda 31', '2026-06-27 01:14:36'),
(62, 33, 'Refrigerante lata', 5, 'saida', 'Venda PDV - Comanda 33', '2026-06-27 01:23:10'),
(63, 32, 'Agua mineral', 2, 'saida', 'Venda PDV - Comanda 33', '2026-06-27 01:23:22'),
(64, 19, 'Brownie com Nozes', 1, 'saida', 'Venda PDV - Comanda 33', '2026-06-27 01:23:28'),
(65, 17, 'Bolo Chocolate', 1, 'saida', 'Venda PDV - Comanda 33', '2026-06-27 01:23:33'),
(66, 21, 'Croissant Tradicional', 10, 'saida', 'Venda PDV - Comanda 38', '2026-06-27 01:24:32'),
(67, 37, 'Café Coado (V60)', 3, 'saida', 'Venda PDV - Comanda 37', '2026-06-27 01:24:47'),
(68, 18, 'Cookie', 6, 'saida', 'Venda PDV - Comanda 37', '2026-06-27 01:24:59'),
(69, 29, 'pavlova', 6, 'saida', 'Venda PDV - Comanda 36', '2026-06-27 01:25:09'),
(70, 29, 'pavlova', 6, 'entrada', 'Estorno - Comanda 36', '2026-06-27 01:25:13'),
(71, 32, 'Agua mineral', 1, 'saida', 'Venda PDV - Comanda 36', '2026-06-27 01:25:14'),
(72, 32, 'Agua mineral', 1, 'entrada', 'Estorno - Comanda 36', '2026-06-27 01:25:19'),
(73, 29, 'pavlova', 1, 'saida', 'Venda PDV - Comanda 36', '2026-06-27 01:25:23'),
(74, 33, 'Refrigerante lata', 2, 'saida', 'Venda PDV - Comanda 35', '2026-06-27 01:25:33'),
(75, 20, 'Pão de Mel', 5, 'saida', 'Venda PDV - Comanda 35', '2026-06-27 01:25:45'),
(76, 17, 'Bolo Chocolate', 2, 'saida', 'Venda PDV - Comanda 34', '2026-06-27 01:25:54'),
(77, 32, 'Agua mineral', 1, 'saida', 'Venda PDV - Comanda 64', '2026-06-27 03:09:44'),
(78, 15, 'brigadeiro', 1, 'saida', 'Venda PDV - Comanda 52', '2026-06-27 03:09:47'),
(79, 38, 'Cappuccino Italiano', 4, 'saida', 'Venda PDV - Comanda 56', '2026-06-27 03:09:52'),
(80, 19, 'Brownie com Nozes', 4, 'saida', 'Venda PDV - Comanda 55', '2026-06-27 03:09:57'),
(81, 14, 'cafe com leite', 4, 'saida', 'Venda PDV - Comanda 43', '2026-06-27 03:10:02'),
(82, 22, 'Mil-folhas Tradicional', 4, 'saida', 'Venda PDV - Comanda 54', '2026-06-27 03:10:06'),
(83, 18, 'Cookie', 6, 'saida', 'Venda PDV - Comanda 50', '2026-06-27 03:10:16'),
(84, 34, 'Chá Mate', 6, 'saida', 'Venda PDV - Comanda 57', '2026-06-27 03:10:24'),
(85, 20, 'Pão de Mel', 6, 'saida', 'Venda PDV - Comanda 58', '2026-06-27 03:10:27'),
(86, 37, 'Café Coado (V60)', 6, 'saida', 'Venda PDV - Comanda 59', '2026-06-27 03:10:31'),
(87, 13, 'torta limao', 6, 'saida', 'Venda PDV - Comanda 46', '2026-06-27 03:10:35'),
(88, 21, 'Croissant Tradicional', 6, 'saida', 'Venda PDV - Comanda 63', '2026-06-27 03:10:40'),
(89, 36, 'Soda Italiana', 6, 'saida', 'Venda PDV - Comanda 62', '2026-06-27 03:10:44'),
(90, 29, 'pavlova', 2, 'saida', 'Venda PDV - Comanda 61', '2026-06-27 03:10:49'),
(91, 22, 'Mil-folhas Tradicional', 10, 'saida', 'Venda PDV - Comanda 60', '2026-06-27 03:10:58'),
(92, 32, 'Agua mineral', 7, 'saida', 'Venda PDV - Comanda 48', '2026-06-27 03:11:03'),
(93, 29, 'pavlova', 7, 'saida', 'Venda PDV - Comanda 47', '2026-06-27 03:11:07'),
(94, 29, 'pavlova', 7, 'entrada', 'Estorno - Comanda 47', '2026-06-27 03:11:10'),
(95, 33, 'Refrigerante lata', 7, 'saida', 'Venda PDV - Comanda 47', '2026-06-27 03:11:13'),
(96, 27, 'Sonho de Creme', 7, 'saida', 'Venda PDV - Comanda 45', '2026-06-27 03:11:18'),
(97, 24, 'Éclair de Baunilha', 7, 'saida', 'Venda PDV - Comanda 44', '2026-06-27 03:11:26'),
(98, 32, 'Agua mineral', 7, 'saida', 'Venda PDV - Comanda 43', '2026-06-27 03:11:30'),
(99, 32, 'Agua mineral', 7, 'saida', 'Venda PDV - Comanda 42', '2026-06-27 03:11:34'),
(100, 31, 'Torta de maçã unidade', 7, 'saida', 'Venda PDV - Comanda 41', '2026-06-27 03:11:41'),
(101, 19, 'Brownie com Nozes', 7, 'saida', 'Venda PDV - Comanda 40', '2026-06-27 03:11:44'),
(102, 38, 'Cappuccino Italiano', 7, 'saida', 'Venda PDV - Comanda 39', '2026-06-27 03:11:50'),
(103, 34, 'Chá Mate', 7, 'saida', 'Venda PDV - Comanda 49', '2026-06-27 03:12:21'),
(104, 27, 'Sonho de Creme', 7, 'saida', 'Venda PDV - Comanda 51', '2026-06-27 03:12:27'),
(105, 35, 'Suco de Laranja', 7, 'saida', 'Venda PDV - Comanda 53', '2026-06-27 03:12:37'),
(106, 20, 'Pão de Mel', 7, 'saida', 'Venda PDV - Comanda 66', '2026-06-27 03:13:27'),
(107, 31, 'Torta de maçã unidade', 7, 'saida', 'Venda PDV - Comanda 65', '2026-06-27 03:13:31'),
(108, 24, 'Éclair de Baunilha', 10, 'saida', 'Venda PDV - Comanda 68', '2026-06-27 03:14:30'),
(109, 21, 'Croissant Tradicional', 10, 'saida', 'Venda PDV - Comanda 67', '2026-06-27 03:14:40'),
(110, 22, 'Mil-folhas Tradicional', 1, 'saida', 'Venda PDV - Comanda 69', '2026-07-01 22:52:32'),
(111, 10, 'sacolinhas', 50, 'saida', 'Ajuste Manual - Gerente', '2026-07-01 22:53:50'),
(112, 39, 'Açucar cristal 50 kg', 5, 'saida', 'Ajuste Manual - Gerente', '2026-07-01 23:30:21'),
(113, 39, 'Açucar cristal 50 kg', 1, 'entrada', 'Ajuste Manual - Gerente', '2026-07-01 23:30:36'),
(114, 40, 'Café em grão 20 kg', 1, 'entrada', 'Ajuste Manual - Gerente', '2026-07-01 23:32:48'),
(115, 40, 'Café em grão 20 kg', 1, 'entrada', 'Ajuste Manual - Gerente', '2026-07-01 23:32:54'),
(116, 40, 'Café em grão 20 kg', 1, 'entrada', 'Ajuste Manual - Gerente', '2026-07-01 23:32:57'),
(117, 17, 'Bolo Chocolate', 1, 'saida', 'Venda PDV - Comanda 70', '2026-07-04 00:29:28'),
(118, 15, 'brigadeiro', 40, 'saida', 'Venda PDV - Comanda 71', '2026-07-04 02:30:51'),
(119, 26, 'Cupcake recheado', 70, 'saida', 'Venda PDV - Comanda 76', '2026-07-04 02:31:46'),
(120, 26, 'Cupcake recheado', 70, 'entrada', 'Estorno - Comanda 76', '2026-07-04 02:31:54'),
(121, 19, 'Brownie com Nozes', 70, 'saida', 'Venda PDV - Comanda 76', '2026-07-04 02:32:01'),
(122, 18, 'Cookie', 3, 'saida', 'Venda PDV - Comanda 75', '2026-07-04 02:32:23'),
(123, 24, 'Éclair de Baunilha', 10, 'saida', 'Venda PDV - Comanda 74', '2026-07-04 02:32:28'),
(124, 8, 'café expresso', 2, 'saida', 'Venda PDV - Comanda 73', '2026-07-04 02:32:43'),
(125, 14, 'cafe com leite', 4, 'saida', 'Venda PDV - Comanda 72', '2026-07-04 02:32:51'),
(126, 22, 'Mil-folhas Tradicional', 2, 'saida', 'Venda PDV - Comanda 77', '2026-07-04 03:40:31');

CREATE TABLE `itens_comanda` (
  `id` int(11) NOT NULL,
  `comanda_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `nome_produto` varchar(100) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `itens_comanda` (`id`, `comanda_id`, `produto_id`, `nome_produto`, `quantidade`, `preco_unitario`, `subtotal`) VALUES
(1, 1, 4, 'cafe expresso', 1, 8.00, 8.00),
(2, 2, 4, 'cafe expresso', 3, 8.00, 24.00),
(3, 3, 4, 'cafe expresso', 2, 8.00, 16.00),
(4, 3, 5, 'Bolo artesanal', 2, 15.00, 30.00),
(5, 4, 5, 'Bolo artesanal', 1, 15.00, 15.00),
(6, 7, 4, 'cafe expresso', 2, 8.00, 16.00),
(7, 8, 5, 'Bolo artesanal', 3, 15.00, 45.00),
(8, 6, 4, 'cafe expresso', 2, 8.00, 16.00),
(9, 5, 5, 'Bolo artesanal', 1, 15.00, 15.00),
(10, 5, 4, 'cafe expresso', 1, 8.00, 8.00),
(11, 9, 5, 'Bolo artesanal', 1, 15.00, 15.00),
(13, 12, 7, 'Pão de sal', 10, 2.00, 20.00),
(14, 11, 8, 'café expresso', 1, 9.00, 9.00),
(15, 11, 7, 'Pão de sal', 2, 2.00, 4.00),
(16, 13, 8, 'café expresso', 1, 9.00, 9.00),
(20, 15, 7, 'Pão de sal', 5, 2.00, 10.00),
(21, 16, 7, 'Pão de sal', 5, 2.00, 10.00),
(22, 17, 7, 'Pão de sal', 1, 2.00, 2.00),
(23, 18, 11, 'Bolo de cenoura fatia', 1, 15.00, 15.00),
(24, 19, 11, 'Bolo de cenoura fatia', 1, 15.00, 15.00),
(25, 20, 8, 'café expresso', 2, 9.00, 18.00),
(26, 20, 7, 'Pão de sal', 2, 2.00, 4.00),
(27, 23, 7, 'Pão de sal', 10, 2.00, 20.00),
(28, 26, 15, 'brigadeiro', 3, 5.00, 15.00),
(29, 25, 14, 'cafe com leite', 2, 10.00, 20.00),
(30, 25, 13, 'torta limao', 2, 15.00, 30.00),
(31, 24, 11, 'Bolo de cenoura fatia', 2, 15.00, 30.00),
(32, 24, 14, 'cafe com leite', 2, 10.00, 20.00),
(33, 22, 7, 'Pão de sal', 15, 2.00, 30.00),
(34, 21, 8, 'café expresso', 1, 9.00, 9.00),
(35, 21, 15, 'brigadeiro', 1, 5.00, 5.00),
(36, 21, 13, 'torta limao', 1, 15.00, 15.00),
(37, 21, 11, 'Bolo de cenoura fatia', 2, 15.00, 30.00),
(38, 27, 17, 'Bolo Chocolate', 2, 45.00, 90.00),
(39, 28, 8, 'café expresso', 1, 9.00, 9.00),
(40, 28, 11, 'Bolo de cenoura fatia', 1, 15.00, 15.00),
(41, 28, 13, 'torta limao', 1, 15.00, 15.00),
(42, 29, 15, 'brigadeiro', 2, 5.00, 10.00),
(44, 30, 14, 'cafe com leite', 1, 10.00, 10.00),
(45, 30, 17, 'Bolo Chocolate', 1, 45.00, 45.00),
(46, 31, 8, 'café expresso', 1, 9.00, 9.00),
(47, 31, 13, 'torta limao', 1, 15.00, 15.00),
(48, 32, 29, 'pavlova', 1, 390.00, 390.00),
(49, 31, 33, 'Refrigerante lata', 2, 10.00, 20.00),
(50, 33, 33, 'Refrigerante lata', 5, 10.00, 50.00),
(51, 33, 32, 'Agua mineral', 2, 6.00, 12.00),
(52, 33, 19, 'Brownie com Nozes', 1, 12.00, 12.00),
(53, 33, 17, 'Bolo Chocolate', 1, 45.00, 45.00),
(54, 38, 21, 'Croissant Tradicional', 10, 16.00, 160.00),
(55, 37, 37, 'Café Coado (V60)', 3, 12.00, 36.00),
(56, 37, 18, 'Cookie', 6, 12.00, 72.00),
(59, 36, 29, 'pavlova', 1, 390.00, 390.00),
(60, 35, 33, 'Refrigerante lata', 2, 10.00, 20.00),
(61, 35, 20, 'Pão de Mel', 5, 12.00, 60.00),
(62, 34, 17, 'Bolo Chocolate', 2, 45.00, 90.00),
(63, 64, 32, 'Agua mineral', 1, 6.00, 6.00),
(64, 52, 15, 'brigadeiro', 1, 5.00, 5.00),
(65, 56, 38, 'Cappuccino Italiano', 4, 12.00, 48.00),
(66, 55, 19, 'Brownie com Nozes', 4, 12.00, 48.00),
(67, 43, 14, 'cafe com leite', 4, 10.00, 40.00),
(68, 54, 22, 'Mil-folhas Tradicional', 4, 25.00, 100.00),
(69, 50, 18, 'Cookie', 6, 12.00, 72.00),
(70, 57, 34, 'Chá Mate', 6, 10.00, 60.00),
(71, 58, 20, 'Pão de Mel', 6, 12.00, 72.00),
(72, 59, 37, 'Café Coado (V60)', 6, 12.00, 72.00),
(73, 46, 13, 'torta limao', 6, 15.00, 90.00),
(74, 63, 21, 'Croissant Tradicional', 6, 16.00, 96.00),
(75, 62, 36, 'Soda Italiana', 6, 10.00, 60.00),
(76, 61, 29, 'pavlova', 2, 390.00, 780.00),
(77, 60, 22, 'Mil-folhas Tradicional', 10, 25.00, 250.00),
(78, 48, 32, 'Agua mineral', 7, 6.00, 42.00),
(80, 47, 33, 'Refrigerante lata', 7, 10.00, 70.00),
(81, 45, 27, 'Sonho de Creme', 7, 8.00, 56.00),
(82, 44, 24, 'Éclair de Baunilha', 7, 20.00, 140.00),
(83, 43, 32, 'Agua mineral', 7, 6.00, 42.00),
(84, 42, 32, 'Agua mineral', 7, 6.00, 42.00),
(85, 41, 31, 'Torta de maçã unidade', 7, 35.00, 245.00),
(86, 40, 19, 'Brownie com Nozes', 7, 12.00, 84.00),
(87, 39, 38, 'Cappuccino Italiano', 7, 12.00, 84.00),
(88, 49, 34, 'Chá Mate', 7, 10.00, 70.00),
(89, 51, 27, 'Sonho de Creme', 7, 8.00, 56.00),
(90, 53, 35, 'Suco de Laranja', 7, 12.00, 84.00),
(91, 66, 20, 'Pão de Mel', 7, 12.00, 84.00),
(92, 65, 31, 'Torta de maçã unidade', 7, 35.00, 245.00),
(93, 68, 24, 'Éclair de Baunilha', 10, 20.00, 200.00),
(94, 67, 21, 'Croissant Tradicional', 10, 16.00, 160.00),
(95, 69, 22, 'Mil-folhas Tradicional', 1, 25.00, 25.00),
(96, 70, 17, 'Bolo Chocolate', 1, 45.00, 45.00),
(97, 71, 15, 'brigadeiro', 40, 5.00, 200.00),
(99, 76, 19, 'Brownie com Nozes', 70, 12.00, 840.00),
(100, 75, 18, 'Cookie', 3, 12.00, 36.00),
(101, 74, 24, 'Éclair de Baunilha', 10, 20.00, 200.00),
(102, 73, 8, 'café expresso', 2, 9.00, 18.00),
(103, 72, 14, 'cafe com leite', 4, 10.00, 40.00),
(104, 77, 22, 'Mil-folhas Tradicional', 2, 25.00, 50.00);

CREATE TABLE `pagamentos_comanda` (
  `id` int(11) NOT NULL,
  `comanda_id` int(11) DEFAULT NULL,
  `forma_pagamento` varchar(50) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `pagamentos_comanda` (`id`, `comanda_id`, `forma_pagamento`, `valor`) VALUES
(1, 2, 'Dinheiro', 14.00),
(2, 2, 'Pix', 10.00),
(3, 1, 'Dinheiro', 3.00),
(6, 6, 'Cartão de Débito', 156.00),
(7, 8, 'Pix', 45.00),
(9, 4, 'Dinheiro', 15.00),
(12, 12, 'Dinheiro', 15.00),
(13, 12, 'Cartão de Débito', 5.00),
(14, 11, 'Dinheiro', 13.00),
(15, 13, 'Pix', 9.00),
(16, 15, 'Dinheiro', 10.00),
(17, 16, 'Dinheiro', 10.00),
(18, 17, 'Dinheiro', 2.00),
(19, 18, 'Dinheiro', 15.00),
(20, 19, 'Dinheiro', 15.00),
(21, 26, 'Pix', 15.00),
(22, 25, 'Cartão de Crédito', 50.00),
(23, 24, 'Cartão de Débito', 50.00),
(24, 23, 'Dinheiro', 10.00),
(25, 23, 'Pix', 10.00),
(26, 22, 'Cartão de Crédito', 30.00),
(27, 21, 'Cartão de Crédito', 59.00),
(28, 20, 'Dinheiro', 22.00),
(29, 27, 'Pix', 40.00),
(30, 27, 'Cartão de Débito', 50.00),
(31, 28, 'Dinheiro', 9.00),
(32, 28, 'Pix', 8.00),
(33, 28, 'Cartão de Crédito', 21.50),
(34, 28, 'Cartão de Débito', 0.50),
(35, 29, 'Dinheiro', 10.00),
(36, 30, 'Dinheiro', 10.00),
(37, 30, 'Pix', 40.00),
(38, 30, 'Cartão de Crédito', 5.00),
(39, 32, 'Cartão de Crédito', 390.00),
(40, 31, 'Pix', 4.00),
(41, 31, 'Cartão de Débito', 40.00),
(42, 33, 'Dinheiro', 119.00),
(43, 34, 'Pix', 90.00),
(44, 35, 'Cartão de Crédito', 80.00),
(45, 36, 'Cartão de Débito', 390.00),
(46, 37, 'Dinheiro', 8.00),
(47, 37, 'Cartão de Débito', 100.00),
(48, 38, 'Pix', 160.00),
(49, 68, 'Dinheiro', 200.00),
(50, 67, 'Dinheiro', 10.00),
(51, 67, 'Pix', 50.00),
(52, 67, 'Cartão de Crédito', 50.00),
(53, 67, 'Cartão de Débito', 50.00),
(54, 66, 'Cartão de Débito', 84.00),
(55, 65, 'Pix', 245.00),
(56, 64, 'Dinheiro', 6.00),
(57, 62, 'Cartão de Crédito', 60.00),
(58, 49, 'Cartão de Crédito', 70.00),
(59, 40, 'Pix', 84.00),
(60, 46, 'Dinheiro', 90.00),
(61, 52, 'Pix', 5.00),
(62, 69, 'Dinheiro', 5.00),
(63, 69, 'Pix', 5.00),
(64, 69, 'Cartão de Crédito', 10.00),
(65, 69, 'Cartão de Débito', 5.00),
(66, 70, 'Dinheiro', 45.00),
(67, 71, 'Dinheiro', 50.00),
(68, 71, 'Pix', 50.00),
(69, 71, 'Cartão de Crédito', 50.00),
(70, 71, 'Cartão de Débito', 50.00),
(71, 76, 'Dinheiro', 200.00),
(72, 76, 'Pix', 500.00),
(73, 76, 'Cartão de Crédito', 100.00),
(74, 76, 'Cartão de Débito', 40.00),
(75, 77, 'Dinheiro', 50.00);

CREATE TABLE `perdas` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `data_perda` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `produto_nome` varchar(100) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `data_venda` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `vendas` (`id`, `produto_nome`, `quantidade`, `valor_total`, `data_venda`) VALUES
(1, 'Farinha', 1, 2.00, '2026-05-19 00:41:32'),
(2, 'Pudim', 1, 20.00, '2026-05-19 00:56:34'),
(3, 'Farinha', 5, 10.00, '2026-05-19 01:30:56'),
(4, 'Pudim', 1, 20.00, '2026-05-19 01:33:38');

ALTER TABLE `caixa`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

ALTER TABLE `comandas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `fechamentos_caixa`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `ficha_tecnica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `ingrediente_id` (`ingrediente_id`);

ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

ALTER TABLE `historico_estoque`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `itens_comanda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comanda_id` (`comanda_id`);

ALTER TABLE `pagamentos_comanda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comanda_id` (`comanda_id`);

ALTER TABLE `perdas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`);

ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `comandas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

ALTER TABLE `estoque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

ALTER TABLE `fechamentos_caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `ficha_tecnica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `historico_estoque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

ALTER TABLE `itens_comanda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

ALTER TABLE `pagamentos_comanda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

ALTER TABLE `perdas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `ficha_tecnica`
  ADD CONSTRAINT `ficha_tecnica_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `estoque` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ficha_tecnica_ibfk_2` FOREIGN KEY (`ingrediente_id`) REFERENCES `estoque` (`id`) ON DELETE CASCADE;

ALTER TABLE `itens_comanda`
  ADD CONSTRAINT `itens_comanda_ibfk_1` FOREIGN KEY (`comanda_id`) REFERENCES `comandas` (`id`) ON DELETE CASCADE;

ALTER TABLE `pagamentos_comanda`
  ADD CONSTRAINT `pagamentos_comanda_ibfk_1` FOREIGN KEY (`comanda_id`) REFERENCES `comandas` (`id`) ON DELETE CASCADE;

ALTER TABLE `perdas`
  ADD CONSTRAINT `perdas_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `estoque` (`id`);
COMMIT;
