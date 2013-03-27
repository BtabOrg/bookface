SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `bookface` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bookface` ;

-- -----------------------------------------------------
-- Table `bookface`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`Person` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`Person` (
  `Version` BIGINT NOT NULL ,
  `Identifier` BIGINT NOT NULL AUTO_INCREMENT ,
  `Screen_name` VARCHAR(255) NOT NULL ,
  `Email_address` VARCHAR(255) NOT NULL ,
  `Password` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`Identifier`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookface`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`User` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`User` (
  `Version` BIGINT NOT NULL ,
  `Identifier` BIGINT NOT NULL AUTO_INCREMENT ,
  `Person.Identifier` BIGINT NOT NULL ,
  PRIMARY KEY (`Identifier`) ,
  INDEX `user_person` (`Person.Identifier` ASC) ,
  CONSTRAINT `Person.Identifier`
    FOREIGN KEY (`Person.Identifier` )
    REFERENCES `bookface`.`Person` (`Identifier` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookface`.`Author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`Author` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`Author` (
  `Version` BIGINT NOT NULL ,
  `Identifier` BIGINT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`Identifier`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookface`.`Book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`Book` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`Book` (
  `Version` BIGINT NOT NULL ,
  `Identifier` BIGINT NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(255) NOT NULL ,
  `Author.Identifier` BIGINT NOT NULL ,
  PRIMARY KEY (`Identifier`) ,
  INDEX `book_author` (`Author.Identifier` ASC) ,
  CONSTRAINT `Author.Identifier`
    FOREIGN KEY (`Author.Identifier` )
    REFERENCES `bookface`.`Author` (`Identifier` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `bookface`.`Comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`Comments` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`Comments` (
  `Version` BIGINT NOT NULL ,
  `Identifier` BIGINT NOT NULL AUTO_INCREMENT ,
  `Description` TINYTEXT NOT NULL ,
  `User.Identifier` BIGINT NOT NULL ,
  `Book.Identifier` BIGINT NOT NULL ,
  PRIMARY KEY (`Identifier`) ,
  INDEX `comment_user` (`User.Identifier` ASC) ,
  INDEX `comment_book` (`Book.Identifier` ASC) ,
  CONSTRAINT `User.Identifier`
    FOREIGN KEY (`User.Identifier` )
    REFERENCES `bookface`.`User` (`Identifier` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Book.Identifier`
    FOREIGN KEY (`Book.Identifier` )
    REFERENCES `bookface`.`Book` (`Identifier` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookface`.`Favourites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bookface`.`Favourites` ;

CREATE  TABLE IF NOT EXISTS `bookface`.`Favourites` (
  `Version` BIGINT NOT NULL ,
  `Identifier` BIGINT NOT NULL AUTO_INCREMENT ,
  `User.Identifier` BIGINT NOT NULL ,
  `Book.Identifier` BIGINT NOT NULL ,
  PRIMARY KEY (`Identifier`) ,
  INDEX `favourites_user` (`User.Identifier` ASC) ,
  INDEX `favourites_book` (`Book.Identifier` ASC) ,
  CONSTRAINT `User`
    FOREIGN KEY (`User.Identifier` )
    REFERENCES `bookface`.`User` (`Identifier` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Book`
    FOREIGN KEY (`Book.Identifier` )
    REFERENCES `bookface`.`Book` (`Identifier` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `bookface` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
