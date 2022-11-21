-- MySQL Script generated by MySQL Workbench
-- Mon Nov 21 12:12:29 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BlogPessoal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BlogPessoal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BlogPessoal` DEFAULT CHARACTER SET utf8 ;
USE `BlogPessoal` ;

-- -----------------------------------------------------
-- Table `BlogPessoal`.`temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BlogPessoal`.`temas` (
  `id` BIGINT NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BlogPessoal`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BlogPessoal`.`usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BlogPessoal`.`postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BlogPessoal`.`postagens` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `texto` VARCHAR(1000) NOT NULL,
  `data` DATE NULL,
  `col` VARCHAR(255) NULL,
  `temas_id` BIGINT NOT NULL,
  `usuarios_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_postagens_temas_idx` (`temas_id` ASC) VISIBLE,
  INDEX `fk_postagens_usuarios1_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `fk_postagens_temas`
    FOREIGN KEY (`temas_id`)
    REFERENCES `BlogPessoal`.`temas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_postagens_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `BlogPessoal`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
