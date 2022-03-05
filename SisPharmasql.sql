-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.5-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sispharma
CREATE DATABASE IF NOT EXISTS `sispharma` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sispharma`;

-- Volcando estructura para tabla sispharma.entradas
CREATE TABLE IF NOT EXISTS `entradas` (
  `chave_entradas` int(11) NOT NULL AUTO_INCREMENT,
  `chave_produtos` int(11) NOT NULL,
  `chave_usuarios` int(11) NOT NULL,
  `data` varchar(30) DEFAULT NULL,
  `qtd_entrada` double DEFAULT NULL,
  PRIMARY KEY (`chave_entradas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sispharma.entradas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT IGNORE INTO `entradas` (`chave_entradas`, `chave_produtos`, `chave_usuarios`, `data`, `qtd_entrada`) VALUES
	(1, 101, 1, '13/12/2021', 25);
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;

-- Volcando estructura para tabla sispharma.itens_venda
CREATE TABLE IF NOT EXISTS `itens_venda` (
  `chave_itens_venda` int(11) NOT NULL AUTO_INCREMENT,
  `chave_vendas` int(11) NOT NULL,
  `chave_produtos` int(11) NOT NULL,
  `qtd_itens` double DEFAULT NULL,
  PRIMARY KEY (`chave_itens_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sispharma.itens_venda: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `itens_venda` DISABLE KEYS */;
INSERT IGNORE INTO `itens_venda` (`chave_itens_venda`, `chave_vendas`, `chave_produtos`, `qtd_itens`) VALUES
	(1, 1, 101, 1),
	(2, 2, 101, 1),
	(3, 3, 101, 1);
/*!40000 ALTER TABLE `itens_venda` ENABLE KEYS */;

-- Volcando estructura para tabla sispharma.laboratorios
CREATE TABLE IF NOT EXISTS `laboratorios` (
  `chave_lab` int(11) NOT NULL AUTO_INCREMENT,
  `nome_lab` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chave_lab`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sispharma.laboratorios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `laboratorios` DISABLE KEYS */;
INSERT IGNORE INTO `laboratorios` (`chave_lab`, `nome_lab`) VALUES
	(1, 'PRUEBA');
/*!40000 ALTER TABLE `laboratorios` ENABLE KEYS */;

-- Volcando estructura para tabla sispharma.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `chave_produtos` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) DEFAULT NULL,
  `codigo_barra` varchar(15) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `laboratorio` int(11) DEFAULT NULL,
  `unidade` varchar(10) DEFAULT NULL,
  `qtd_produtos` double DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `validade` varchar(10) DEFAULT NULL,
  `qtd_minima` double DEFAULT NULL,
  PRIMARY KEY (`chave_produtos`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sispharma.produtos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT IGNORE INTO `produtos` (`chave_produtos`, `codigo`, `codigo_barra`, `descricao`, `laboratorio`, `unidade`, `qtd_produtos`, `valor`, `validade`, `qtd_minima`) VALUES
	(1, 101, '75001', 'TEST', 0, 'UNI', 22, 100, '10/10/2010', 5);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

-- Volcando estructura para tabla sispharma.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `chave_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `login` varchar(5) DEFAULT NULL,
  `senha` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`chave_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sispharma.usuarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT IGNORE INTO `usuarios` (`chave_usuarios`, `nome`, `tipo`, `login`, `senha`) VALUES
	(1, 'ADMIN', 1, 'admin', 'admin'),
	(2, '           CAJERO                       ', 0, 'func', 'caja');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla sispharma.vendas
CREATE TABLE IF NOT EXISTS `vendas` (
  `chave_vendas` int(11) NOT NULL AUTO_INCREMENT,
  `chave_usuarios` int(11) NOT NULL,
  `data` varchar(30) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `desconto` double DEFAULT NULL,
  `valor_pago` double DEFAULT NULL,
  `tipo_venda` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`chave_vendas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla sispharma.vendas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT IGNORE INTO `vendas` (`chave_vendas`, `chave_usuarios`, `data`, `valor`, `desconto`, `valor_pago`, `tipo_venda`) VALUES
	(1, 1, '13/12/2021', 100, 0, 100, 'DINHEIRO'),
	(2, 1, '13/12/2021', 100, 0, 100, 'DINHEIRO'),
	(3, 1, '19/12/2021', 100, 0, 100, 'DINHEIRO');
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
