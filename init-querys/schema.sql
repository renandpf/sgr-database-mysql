-- MySQL Workbench Synchronization
-- Generated: 2023-09-02 21:35
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Renan

CREATE SCHEMA `sgr_database`;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `sgr_database`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `sgr_database`.`Cliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `sgr_database`.`Item` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `quantidade` INT(11) NOT NULL,
  `valorUnitario` FLOAT(11) NOT NULL,
  `pedidoId` INT(11) NOT NULL,
  `produtoId` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_f631527a9cac8e674e374760f3f` (`produtoId` ASC) VISIBLE,
  INDEX `FK_caf0721618f8177f10ca43a79f4` (`pedidoId` ASC) VISIBLE,
  CONSTRAINT `FK_caf0721618f8177f10ca43a79f4`
    FOREIGN KEY (`pedidoId`)
    REFERENCES `sgr_database`.`Pedido` (`id`),
  CONSTRAINT `FK_f631527a9cac8e674e374760f3f`
    FOREIGN KEY (`produtoId`)
    REFERENCES `sgr_database`.`Produto` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `sgr_database`.`Pagamento` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `identificadorPagamentoExterno` VARCHAR(255) NOT NULL,
  `pedidoId` INT(11) NULL DEFAULT NULL,
  `valor` DECIMAL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_22a72be556925c7b126c365b677` (`pedidoId` ASC) VISIBLE)
ENGINE = MEMORY
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `sgr_database`.`Pedido` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `statusId` INT(11) NOT NULL,
  `dataCadastro` DATETIME NOT NULL,
  `dataConclusao` DATETIME NULL DEFAULT NULL,
  `observacao` VARCHAR(255) NULL DEFAULT NULL,
  `clienteId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_4d6a129f22574b9b9cbcba26af4` (`clienteId` ASC) VISIBLE,
  CONSTRAINT `FK_4d6a129f22574b9b9cbcba26af4`
    FOREIGN KEY (`clienteId`)
    REFERENCES `sgr_database`.`Cliente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `sgr_database`.`Produto` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(500) NULL DEFAULT NULL,
  `imagem` TEXT NULL DEFAULT NULL,
  `valor` FLOAT(11) NOT NULL,
  `categoriaId` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `sgr_database`.`PlataformaPagamento` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(100) NOT NULL,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `status` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `sgr_database`.`PlataformaPagamento` (`code`, `nome`, `status`) VALUES ('MERCADO_PAGO', 'Mercado Pago', '0');
INSERT INTO `sgr_database`.`PlataformaPagamento` (`code`, `nome`, `status`) VALUES ('PAG_SEGURO', 'Pag Seguro', '1');

INSERT INTO `sgr_database`.`Cliente` (`nome`, `cpf`, `email`) VALUES ('Cliente Teste A', '11111111111', 'clientea@mail.com');
INSERT INTO `sgr_database`.`Cliente` (`nome`, `cpf`, `email`) VALUES ('Cliente Teste B', '22222222222', 'clienteb@mail.com');

INSERT INTO `sgr_database`.`Produto` (`nome`, `descricao`, `valor`, `categoriaId`) VALUES ('Hamburguer Test', 'Any descrição A', '10', '0');
INSERT INTO `sgr_database`.`Produto` (`nome`, `descricao`, `valor`, `categoriaId`) VALUES ('Maionese Teste', 'Any descrição B', '1', '1');
INSERT INTO `sgr_database`.`Produto` (`nome`, `descricao`, `valor`, `categoriaId`) VALUES ('Refri Teste', 'Any descrição C', '5', '2');
INSERT INTO `sgr_database`.`Produto` (`nome`, `descricao`, `valor`, `categoriaId`) VALUES ('Goiabada Teste', 'Any descrição D', '8', '3');
