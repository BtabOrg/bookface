-- -----------------------------------------------------
-- Bookface_V1.0 SCHEMA
-- Author: Bernard Baker & Luis Da Silva
-- -----------------------------------------------------
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `bookface` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bookface` ;

-- -----------------------------------------------------
-- Table `bookface`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`person` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`person` (
  `version` BIGINT NULL ,
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `screen_name` VARCHAR(255) NOT NULL ,
  `email_address` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `bookface`.`author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`author` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`author` (
  `version` BIGINT NULL ,
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookface`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`book` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`book` (
  `version` BIGINT NULL ,
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NOT NULL ,
  `author` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `bookface`.`comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`comments` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`comments` (
  `version` BIGINT NULL ,
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `description` TEXT NOT NULL ,
  `person` VARCHAR(255) NOT NULL ,
  `book` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookface`.`favourites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`favourites` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`favourites` (
  `version` BIGINT NULL ,
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `person` VARCHAR(255) NOT NULL ,
  `book` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

USE `bookface` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Table `bookface`.`person` DEFAUL ACCOUNTS
-- -----------------------------------------------------
INSERT INTO `bookface`.`person` (`version`, `screen_name`, `email_address`) VALUES (NULL, "admin", "admin@domain.com");
INSERT INTO `bookface`.`person` (`version`, `screen_name`, `email_address`) VALUES (NULL, "test1", "test1@domain.com");
INSERT INTO `bookface`.`person` (`version`, `screen_name`, `email_address`) VALUES (NULL, "test2", "test2@domain.com");
INSERT INTO `bookface`.`person` (`version`, `screen_name`, `email_address`) VALUES (NULL, "test3", "test3@domain.com");