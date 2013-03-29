USE bookface;

-- -----------------------------------------------------
-- Test data for `bookface`.`person`
-- -----------------------------------------------------

DELETE FROM bookface.person;
INSERT INTO `bookface`.`person` (`Version`, `Screen_name`, `Email_address`, `Password`) VALUES ('1', 'Test_User1', 'test1@test.com', 'test1');
INSERT INTO `bookface`.`person` (`Version`, `Screen_name`, `Email_address`, `Password`) VALUES ('1', 'Test_User2', 'test2@test.com', 'test2');

-- -----------------------------------------------------
-- Test data for `bookface`.`user`
-- -----------------------------------------------------

DELETE FROM bookface.user;
INSERT INTO `bookface`.`user` (`Version`, `Person.Identifier`) VALUES ('1', (SELECT Identifier FROM bookface.person WHERE Screen_name = 'Test_User1'));
INSERT INTO `bookface`.`user` (`Version`, `Person.Identifier`) VALUES ('1', (SELECT Identifier FROM bookface.person WHERE Screen_name = 'Test_User2'));

-- -----------------------------------------------------
-- Test data for `bookface`.`author`
-- -----------------------------------------------------

DELETE FROM bookface.author;
INSERT INTO `bookface`.`author` (`Version`, `Name`) VALUES ('1', 'Adam Smith');
INSERT INTO `bookface`.`author` (`Version`, `Name`) VALUES ('1', 'William Shakespear');

-- -----------------------------------------------------
-- Test data for `bookface`.`book`
-- -----------------------------------------------------

DELETE FROM bookface.book;
INSERT INTO `bookface`.`book` (`Version`, `Title`,`Author.Identifier`) VALUES ('1','Wealth of Nations', (SELECT Identifier FROM bookface.author WHERE Name = 'Adam Smith'));
INSERT INTO `bookface`.`book` (`Version`, `Title`,`Author.Identifier`) VALUES ('1','Hamlet', (SELECT Identifier FROM bookface.author WHERE Name = 'William Shakespear'));

-- -----------------------------------------------------
-- Test data for `bookface`.`comments`
-- -----------------------------------------------------

DELETE FROM bookface.comments;
INSERT INTO `bookface`.`comments` (`Version`,`Description`,`User.Identifier`,`Book.Identifier`) VALUES ('1','Comment for Test_User_1', (SELECT Identifier FROM bookface.author WHERE Name = 'Adam Smith'),(SELECT Identifier FROM bookface.author WHERE Name = 'Adam Smith'));