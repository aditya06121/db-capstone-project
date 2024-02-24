-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDM` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema littlelemondm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondm` DEFAULT CHARACTER SET utf8mb3 ;
USE `LittleLemonDM` ;

-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL(20) NOT NULL,
  `HireDate` DATETIME NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Customers` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `PhoneNumber` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `staff_id_fk_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDM`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `TableNumber` INT NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Orders` (
  `OrderID` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `OrderType` VARCHAR(45) NOT NULL,
  `TotalCost` DECIMAL(20) NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `booking_id_fk_idx` (`BookingID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDM`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_id_fokey`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDM`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`OrderDeliveryStatus` (
  `DeliveryOrderID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `DeliveryDate` DATETIME NOT NULL,
  `DeliveryStatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DeliveryOrderID`, `OrderID`),
  INDEX `order_id_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDM`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`Menu` (
  `ItemID` INT NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `ItemName` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(20) NOT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDM`.`OrderItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDM`.`OrderItems` (
  `OrderItemsID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Price` DECIMAL(20) NOT NULL,
  PRIMARY KEY (`OrderItemsID`),
  INDEX `menu_item_fk_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderItemsID`)
    REFERENCES `LittleLemonDM`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_item_fk`
    FOREIGN KEY (`ItemID`)
    REFERENCES `LittleLemonDM`.`Menu` (`ItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `littlelemondm` ;

-- -----------------------------------------------------
-- Table `littlelemondm`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL(20,0) NOT NULL,
  `HireDate` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondm`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`customers` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `PhoneNumber` INT NOT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`),
  INDEX `staff_id_fk_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`StaffID`)
    REFERENCES `littlelemondm`.`staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondm`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`bookings` (
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `TableNumber` INT NULL DEFAULT NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondm`.`customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondm`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`menu` (
  `ItemID` INT NOT NULL,
  `Category` VARCHAR(45) NOT NULL,
  `ItemName` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(20,0) NOT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondm`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`orders` (
  `OrderID` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `OrderType` VARCHAR(45) NOT NULL,
  `TotalCost` DECIMAL(20,0) NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `booking_id_fk_idx` (`BookingID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `booking_id_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `littlelemondm`.`bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_id_fokey`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondm`.`customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondm`.`orderdeliverystatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`orderdeliverystatus` (
  `DeliveryOrderID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `DeliveryDate` DATETIME NOT NULL,
  `DeliveryStatus` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DeliveryOrderID`, `OrderID`),
  INDEX `order_id_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`OrderID`)
    REFERENCES `littlelemondm`.`orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondm`.`orderitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`orderitems` (
  `OrderItemsID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Price` DECIMAL(20,0) NOT NULL,
  PRIMARY KEY (`OrderItemsID`),
  INDEX `menu_item_fk_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `menu_item_fk`
    FOREIGN KEY (`ItemID`)
    REFERENCES `littlelemondm`.`menu` (`ItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `order_id_fk`
    FOREIGN KEY (`OrderItemsID`)
    REFERENCES `littlelemondm`.`orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
