-- MySQL Script generated by MySQL Workbench
-- Thu Feb  4 14:44:12 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema msc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema msc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `msc` DEFAULT CHARACTER SET latin1 ;
USE `msc` ;

-- -----------------------------------------------------
-- Table `msc`.`ab_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`ab_data` (
  `ab_id` INT(11) NOT NULL AUTO_INCREMENT,
  `group` VARCHAR(1) NULL DEFAULT NULL,
  `unique_id` VARCHAR(128) NULL DEFAULT NULL,
  `ip` VARCHAR(15) NULL DEFAULT NULL,
  `datetime` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ab_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3407
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `msc`.`activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`activity` (
  `activity_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NULL DEFAULT NULL,
  `activity` VARCHAR(64) NULL DEFAULT NULL,
  `location` VARCHAR(3) NULL DEFAULT NULL,
  `time` VARCHAR(64) NULL DEFAULT NULL,
  PRIMARY KEY (`activity_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1350
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `msc`.`badges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`badges` (
  `user_id` INT(11) NOT NULL,
  `signup` INT(1) NULL DEFAULT '0',
  `image1` INT(1) NULL DEFAULT '0',
  `review1` INT(1) NULL DEFAULT '0',
  `image10` INT(1) NULL DEFAULT '0',
  `review10` INT(1) NULL DEFAULT '0',
  `image25` INT(1) NULL DEFAULT '0',
  `review25` INT(1) NULL DEFAULT '0',
  `image50` INT(1) NULL DEFAULT '0',
  `review50` INT(1) NULL DEFAULT '0',
  `share1` INT(1) NULL DEFAULT '0',
  `share10` INT(1) NULL DEFAULT '0',
  `share25` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `msc`.`groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`groups` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msc`.`logger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`logger` (
  `log_id` INT(11) NOT NULL AUTO_INCREMENT,
  `unique_id` VARCHAR(128) NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `ip` VARCHAR(15) NULL DEFAULT NULL,
  `user_agent` VARCHAR(256) NULL DEFAULT NULL,
  `datetime` VARCHAR(45) NULL DEFAULT NULL,
  `location` VARCHAR(256) NULL DEFAULT NULL,
  `entry_url` VARCHAR(256) NULL DEFAULT NULL,
  `ab_group` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5849
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `msc`.`logger_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`logger_images` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `unique_id` VARCHAR(128) NULL DEFAULT NULL,
  `user_id` INT(11) NULL DEFAULT NULL,
  `ip` VARCHAR(15) NULL DEFAULT NULL,
  `interface` VARCHAR(45) NULL DEFAULT NULL,
  `project_id` INT(11) NULL DEFAULT NULL,
  `image_id` INT(11) NULL DEFAULT NULL,
  `request_time` DATETIME NULL DEFAULT NULL,
  `submit_time` DATETIME NULL DEFAULT NULL,
  `queue` INT(1) NULL DEFAULT NULL,
  `review` INT(1) NULL DEFAULT NULL,
  `ab_group` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1350
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `msc`.`login_attempts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`login_attempts` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(15) NOT NULL,
  `login` VARCHAR(100) NOT NULL,
  `time` INT(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msc`.`points`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`points` (
  `user_id` INT(11) NOT NULL,
  `points` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `msc`.`project_1_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`project_1_data` (
  `data_id` INT(11) NOT NULL AUTO_INCREMENT,
  `image_id` INT(11) NOT NULL,
  `genus` VARCHAR(256) NULL DEFAULT '0',
  `genuscustom` VARCHAR(256) NULL DEFAULT '0',
  `species` VARCHAR(256) NULL DEFAULT '0',
  `age` VARCHAR(256) NULL DEFAULT '0',
  `country` VARCHAR(256) NULL DEFAULT '0',
  `place` VARCHAR(256) NULL DEFAULT '0',
  `collector` VARCHAR(256) NULL DEFAULT '0',
  PRIMARY KEY (`data_id`, `image_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1191
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `msc`.`project_1_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`project_1_images` (
  `image_id` INT(11) NOT NULL AUTO_INCREMENT,
  `image_url` VARCHAR(512) NULL DEFAULT NULL,
  `filename` VARCHAR(45) NULL DEFAULT NULL,
  `hash` VARCHAR(32) NULL DEFAULT NULL,
  `queue_count` INT(11) NULL DEFAULT '0',
  `review_count` INT(11) NULL DEFAULT '0',
  `complete` INT(11) NULL DEFAULT '0',
  PRIMARY KEY (`image_id`),
  UNIQUE INDEX `hash_UNIQUE` (`hash` ASC),
  INDEX `fk_Project_Images_Projects_Master1_idx` (`image_url` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1280
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `msc`.`projects_master`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`projects_master` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `group_id` INT(11) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `image` VARCHAR(45) NULL DEFAULT NULL,
  `blurb` VARCHAR(512) NULL DEFAULT NULL,
  `admins` VARCHAR(45) NULL DEFAULT NULL,
  `data_table` VARCHAR(45) NULL DEFAULT NULL,
  `image_table` VARCHAR(45) NULL DEFAULT NULL,
  `display` INT(11) NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `msc`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`users` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(15) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `salt` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(100) NOT NULL,
  `activation_code` VARCHAR(40) NULL DEFAULT NULL,
  `forgotten_password_code` VARCHAR(40) NULL DEFAULT NULL,
  `forgotten_password_time` INT(11) UNSIGNED NULL DEFAULT NULL,
  `remember_code` VARCHAR(40) NULL DEFAULT NULL,
  `created_on` INT(11) UNSIGNED NOT NULL,
  `last_login` INT(11) UNSIGNED NULL DEFAULT NULL,
  `active` TINYINT(1) UNSIGNED NULL DEFAULT NULL,
  `first_name` VARCHAR(50) NULL DEFAULT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `location` VARCHAR(4) NULL DEFAULT 'anon',
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `queue_total` INT(11) NULL DEFAULT '0',
  `review_total` INT(11) NULL DEFAULT '0',
  `share_total` INT(11) NULL DEFAULT '0',
  `is_admin` INT(1) NULL DEFAULT '0',
  `unique_id` VARCHAR(128) NULL DEFAULT '0',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 143
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `msc`.`users_groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msc`.`users_groups` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) UNSIGNED NOT NULL,
  `group_id` MEDIUMINT(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uc_users_groups` (`user_id` ASC, `group_id` ASC),
  INDEX `fk_users_groups_users1_idx` (`user_id` ASC),
  INDEX `fk_users_groups_groups1_idx` (`group_id` ASC),
  CONSTRAINT `fk_users_groups_groups1`
    FOREIGN KEY (`group_id`)
    REFERENCES `msc`.`groups` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `msc`.`users` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 144
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
