DROP DATABASE IF EXISTS `bbk`;
CREATE DATABASE `bbk` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

USE `bbk`;
-- -----------------------------------------------------
-- Table `Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
`version` bigint NULL COMMENT 'Roo identifier.',
`identifier` bigint NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for this record.',
`screen_name` varchar(255) NOT NULL COMMENT 'The screen name.',
`email_address` varchar(255) NOT NULL COMMENT 'The email address.',
`password` varchar(255) NOT NULL COMMENT 'The password.',
PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
`version` bigint NULL COMMENT 'Roo identifier.',
`identifier` bigint NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for this record.',
`person` bigint NOT NULL COMMENT 'A unique reference to the person entity.',
PRIMARY KEY (`identifier`),
INDEX `user_identifier` (`identifier`),
INDEX `user_person` (`person`),
CONSTRAINT `person`
FOREIGN KEY (`person`)
REFERENCES `person` (`identifier` )
ON DELETE CASCADE
ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
`version` bigint NULL COMMENT 'Roo identifier.',
`identifier` bigint NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for this record.',
`name` varchar(255) NOT NULL COMMENT 'The name of the author.',
PRIMARY KEY (`identifier`),
INDEX `author_identifier` (`identifier`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
`version` bigint NULL COMMENT 'Roo identifier.',
`identifier` bigint NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for this record.',
`title` varchar(255) NOT NULL COMMENT 'The title of the book.',
`author` bigint NOT NULL COMMENT 'A unique reference to the author.',
PRIMARY KEY (`identifier`),
INDEX `book_identifier` (`identifier`),
INDEX `book_author` (`author`),
CONSTRAINT `author`
FOREIGN KEY (`author` )
REFERENCES `author` (`identifier` ))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
`version` bigint NULL COMMENT 'Roo identifier.',
`identifier` bigint NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for this record.',
`description` text NOT NULL COMMENT 'The comment on the book.',
`user` bigint NOT NULL COMMENT 'A unique reference to the User entity.',
`book` bigint NOT NULL COMMENT 'A unique reference to the Book entity.',
PRIMARY KEY (`identifier`),
INDEX `comment_user` (`user`),
INDEX `comment_book` (`book`),
CONSTRAINT `user`
FOREIGN KEY (`user`)
REFERENCES `user` (`identifier` ) ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT `book`
FOREIGN KEY (`book`)
REFERENCES `book` (`identifier` ) ON UPDATE NO ACTION ON DELETE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `Favourites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favourites`;
CREATE TABLE IF NOT EXISTS `favourites` (
`version` bigint NULL COMMENT 'Roo identifier.',
`identifier` bigint NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for this record.',
`favourite_user` bigint NOT NULL COMMENT 'A unique reference to the User entity.',
`favourite_book` bigint NOT NULL COMMENT 'A unique reference to the Book entity.',
PRIMARY KEY (`identifier`),
INDEX `favourites_user` (`favourite_user`),
INDEX `favourites_book` (`favourite_book`),
CONSTRAINT `favourite_user`
FOREIGN KEY (`favourite_user`)
REFERENCES `user` (`identifier`),
CONSTRAINT `favourite_book`
FOREIGN KEY (`favourite_book`)
REFERENCES `book` (`identifier`))
ENGINE = InnoDB;

ALTER TABLE `person` AUTO_INCREMENT = 0;
ALTER TABLE `user` AUTO_INCREMENT = 0;
ALTER TABLE `book` AUTO_INCREMENT = 0;
ALTER TABLE `comments` AUTO_INCREMENT = 0;
ALTER TABLE `favourites` AUTO_INCREMENT = 0;