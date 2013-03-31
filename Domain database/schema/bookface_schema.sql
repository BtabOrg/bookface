SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `bookface` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bookface` ;

-- -----------------------------------------------------
-- Table `bookface`.`person`
-- -----------------------------------------------------
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
CREATE  TABLE IF NOT EXISTS `bookface`.`author` (
  `version` BIGINT NULL ,
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookface`.`book`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bookface`.`book` (
  `version` BIGINT NULL ,
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NOT NULL ,
  `author` BIGINT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `book_author_idx` (`author` ASC) ,
  CONSTRAINT `book_author`
    FOREIGN KEY (`author` )
    REFERENCES `bookface`.`author` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `bookface`.`comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bookface`.`comments` (
  `version` BIGINT NULL ,
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `description` TEXT NOT NULL ,
  `person` BIGINT NOT NULL ,
  `book` BIGINT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `comments_book_idx` (`book` ASC) ,
  INDEX `comments_person_idx` (`person` ASC) ,
  CONSTRAINT `comments_book`
    FOREIGN KEY (`book` )
    REFERENCES `bookface`.`book` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comments_person`
    FOREIGN KEY (`person` )
    REFERENCES `bookface`.`person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bookface`.`favourites`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `bookface`.`favourites` (
  `version` BIGINT NULL ,
  `id` BIGINT NOT NULL AUTO_INCREMENT ,
  `person` BIGINT NOT NULL ,
  `book` BIGINT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `favourites_book_idx` (`book` ASC) ,
  INDEX `favourites_person_idx` (`person` ASC) ,
  CONSTRAINT `favourites_book`
    FOREIGN KEY (`book` )
    REFERENCES `bookface`.`book` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `favourites_person`
    FOREIGN KEY (`person` )
    REFERENCES `bookface`.`person` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `bookface` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
