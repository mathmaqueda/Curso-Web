CREATE DATABASE IF NOT EXISTS `bd_loja_virtual`;
USE `bd_loja_virtual`;

-- Copiando estrutura para tabela bd_loja_virtual.tb_clientes
CREATE TABLE IF NOT EXISTS `tb_clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `idade` int(3) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_loja_virtual.tb_clientes: ~2 rows (aproximadamente)
INSERT INTO `tb_clientes` (`id_cliente`, `nome`, `idade`) VALUES
	(1, 'Matheus', 19),
	(2, 'Vitor', 17);

-- Copiando estrutura para tabela bd_loja_virtual.tb_descricoes_tecnicas
CREATE TABLE IF NOT EXISTS `tb_descricoes_tecnicas` (
  `id_descricao_tecnica` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_produto` int(11) NOT NULL,
  `descricao_tecnica` text NOT NULL,
  PRIMARY KEY (`id_descricao_tecnica`),
  KEY `fk_id_produto` (`fk_id_produto`),
  CONSTRAINT `tb_descricoes_tecnicas_ibfk_1` FOREIGN KEY (`fk_id_produto`) REFERENCES `tb_produtos` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_loja_virtual.tb_descricoes_tecnicas: ~3 rows (aproximadamente)
INSERT INTO `tb_descricoes_tecnicas` (`id_descricao_tecnica`, `fk_id_produto`, `descricao_tecnica`) VALUES
	(1, 1, 'O novo Inspiron Dell oferece um design elegante e tela infinita que amplia seus sentidos, mantendo a sofisticação e medidas compactas...'),
	(2, 2, 'A smart TV da Samsung possui tela de 40" e oferece resolução Full HD, imagens duas vezes melhores que TVs HDs padrão...'),
	(3, 3, 'Saia da mesmice. O smartphone LG está mais divertido, rápido, fácil, cheio de selfies e com tela HD de incríveis 5,3"...');

-- Copiando estrutura para tabela bd_loja_virtual.tb_imagens
CREATE TABLE IF NOT EXISTS `tb_imagens` (
  `id_imagem` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_produto` int(11) NOT NULL,
  `url_imagem` varchar(200) NOT NULL,
  PRIMARY KEY (`id_imagem`),
  KEY `fk_id_produto` (`fk_id_produto`),
  CONSTRAINT `tb_imagens_ibfk_1` FOREIGN KEY (`fk_id_produto`) REFERENCES `tb_produtos` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_loja_virtual.tb_imagens: ~9 rows (aproximadamente)
INSERT INTO `tb_imagens` (`id_imagem`, `fk_id_produto`, `url_imagem`) VALUES
	(1, 1, 'notebook_1.jpg'),
	(2, 1, 'notebook_2.jpg'),
	(3, 1, 'notebook_3.jpg'),
	(4, 2, 'smarttv_1.jpg'),
	(5, 2, 'smarttv_2.jpg'),
	(6, 2, 'smarttv_3.jpg'),
	(7, 3, 'smartphone_1.jpg'),
	(8, 3, 'smartphone_2.jpg'),
	(9, 3, 'smartphone_3.jpg');

-- Copiando estrutura para tabela bd_loja_virtual.tb_pedidos
CREATE TABLE IF NOT EXISTS `tb_pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_cliente` int(11) NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_pedido`),
  KEY `fk_id_cliente` (`fk_id_cliente`),
  CONSTRAINT `tb_pedidos_ibfk_1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `tb_clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_loja_virtual.tb_pedidos: ~4 rows (aproximadamente)
INSERT INTO `tb_pedidos` (`id_pedido`, `fk_id_cliente`, `data_hora`) VALUES
	(1, 1, '2024-02-13 12:10:39'),
	(2, 1, '2024-02-13 12:10:46'),
	(3, 1, '2024-02-13 12:10:46'),
	(4, 2, '2024-02-13 12:10:46');

-- Copiando estrutura para tabela bd_loja_virtual.tb_pedidos_produtos
CREATE TABLE IF NOT EXISTS `tb_pedidos_produtos` (
  `fk_id_pedido` int(11) NOT NULL,
  `fk_id_produto` int(11) NOT NULL,
  KEY `fk_id_pedido` (`fk_id_pedido`),
  KEY `fk_id_produto` (`fk_id_produto`),
  CONSTRAINT `tb_pedidos_produtos_ibfk_1` FOREIGN KEY (`fk_id_pedido`) REFERENCES `tb_pedidos` (`id_pedido`),
  CONSTRAINT `tb_pedidos_produtos_ibfk_2` FOREIGN KEY (`fk_id_produto`) REFERENCES `tb_produtos` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_loja_virtual.tb_pedidos_produtos: ~8 rows (aproximadamente)
INSERT INTO `tb_pedidos_produtos` (`fk_id_pedido`, `fk_id_produto`) VALUES
	(1, 2),
	(1, 3),
	(1, 1),
	(2, 2),
	(3, 1),
	(3, 2),
	(4, 3),
	(4, 1);

-- Copiando estrutura para tabela bd_loja_virtual.tb_produtos
CREATE TABLE IF NOT EXISTS `tb_produtos` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `produto` varchar(200) NOT NULL,
  `valor` float(8,2) NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela bd_loja_virtual.tb_produtos: ~3 rows (aproximadamente)
INSERT INTO `tb_produtos` (`id_produto`, `produto`, `valor`) VALUES
	(1, 'Notebook Dell Inspiron Ultrafino Intel Core i7, 16GB RAM e 240GB SSD', 3500.00),
	(2, 'Smart TV LED 40" Samsung Full HD 2 HDMI 1 USB Wi-Fi Integrado', 1475.54),
	(3, 'Smartphone LG K10 Dual Chip Android 7.0 4G Wi-Fi Câmera de 13MP', 629.99);
