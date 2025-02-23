-- MySQL Script generated by MySQL Workbench
-- Sat Jan 28 17:14:01 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FestivalBuy
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `FestivalBuy` ;

-- -----------------------------------------------------
-- Schema FestivalBuy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FestivalBuy` DEFAULT CHARACTER SET utf8 ;
USE `FestivalBuy` ;

-- -----------------------------------------------------
-- Table `FestivalBuy`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FestivalBuy`.`category` ;

CREATE TABLE IF NOT EXISTS `FestivalBuy`.`category` (
  `category_id` INT(11) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `FestivalBuy`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FestivalBuy`.`customer` ;

CREATE TABLE IF NOT EXISTS `FestivalBuy`.`customer` (
  `customer_id` INT(11) NOT NULL,
  `email` VARCHAR(64) NULL,
  `full_name` VARCHAR(30) NOT NULL,
  `address` VARCHAR(128) NULL,
  `city` VARCHAR(32) NULL,
  `country` VARCHAR(64) NULL,
  `register_on` DATETIME NOT NULL,
  `password` VARCHAR(16) NOT NULL,
  `phone` VARCHAR(15) NULL,
  `zipcode` VARCHAR(24) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `FestivalBuy`.`product_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FestivalBuy`.`product_order` ;

CREATE TABLE IF NOT EXISTS `FestivalBuy`.`product_order` (
  `order_id` INT(11) NOT NULL,
  `customer_id` INT(11) NOT NULL,
  `order_date` DATETIME NOT NULL,
  `order_total` INT(11) NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `shipping_address` VARCHAR(256) NULL,
  `payment_method` VARCHAR(50) NULL,
  `recipient_name` VARCHAR(30) NULL,
  `recipient_phone` VARCHAR(15) NULL,
  PRIMARY KEY (`order_id`),
  INDEX `customer_id_idx` (`customer_id` ASC),
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `FestivalBuy`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `FestivalBuy`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FestivalBuy`.`product` ;

CREATE TABLE IF NOT EXISTS `FestivalBuy`.`product` (
  `product_id` INT(11) NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `price` INT(11) NULL,
  `category_id` INT(11) NOT NULL,
  `imageurl` VARCHAR(300) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `is_stock` TINYINT(4) NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `category_id_idx` (`category_id` ASC),
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `FestivalBuy`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `FestivalBuy`.`order_detail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FestivalBuy`.`order_detail` ;

CREATE TABLE IF NOT EXISTS `FestivalBuy`.`order_detail` (
  `order_id` INT(11) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  `subtotal` FLOAT(11) NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `product_id_idx` (`product_id` ASC),
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `FestivalBuy`.`product_order` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `FestivalBuy`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `FestivalBuy`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `FestivalBuy`.`user` ;

CREATE TABLE IF NOT EXISTS `FestivalBuy`.`user` (
  `user_id` INT(11) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(16) NOT NULL,
  `full_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;