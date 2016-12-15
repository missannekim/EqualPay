#This is the SQL code used to create a relational database on for the AngelHack #LadyProblems 
#demo. During the hackathon we used Amazon's RDS database service 
#with mySQL as the database engine.


DROP TABLE IF EXISTS Company;

CREATE TABLE IF NOT EXISTS `Company`(
    `companyId` INT AUTO_INCREMENT,
    `companyName` VARCHAR(50) NOT NULL,
    	PRIMARY KEY(`companyId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
    )
ENGINE  = InnoDB;


DROP TABLE IF EXISTS `Employee`;

CREATE TABLE IF NOT EXISTS `Employee` (
    `employeeId` INT AUTO_INCREMENT,
    `companyId` INT NOT NULL,
    `employeeFName` VARCHAR(50) NOT NULL,
    `email` VARCHAR(75) NOT NULL,
    `position` VARCHAR(50) NOT NULL,
    `phoneNum` VARCHAR(25) NOT NULL,
    `startDate` DATE NOT NULL,
    `endDate` Date,
	PRIMARY KEY(`employeeID`),
	FOREIGN KEY(`companyId`)
	REFERENCES  `Company` (`companyId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `Experience`;

CREATE TABLE IF NOT EXISTS `Experience`(
    `employeeId` INT NOT NULL,
    `companyId` INT NOT NULL,
    `requiredExperience` VARCHAR(100) NOT NULL,
    `requiredDuration` INT NOT NULL,
    `relevantExperience` VARCHAR(100) NOT NULL,
    `relevantExperienceDuration` INT NOT NULL,
    	PRIMARY KEY(`employeeId`),
    	FOREIGN KEY(`employeeId`)
    	REFERENCES `Employee` (`employeeId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
Engine = InnoDB;

DROP TABLE IF EXISTS `CultureQuestion`;

CREATE TABLE IF NOT EXISTS `CultureQuestion`(
    `employeeId` INT NOT NULL,
    `companyId` INT NOT NULL,
    `questionId` INT AUTO_INCREMENT,
    `question` VARCHAR(500), 
    `questionEmployerVersion` VARCHAR(500),
    `companyReviews` VARCHAR(500),
    `employeeReviews` VARCHAR(500),
    `match` bool NOT NULL,
	PRIMARY KEY(`questionId`,`employeeId`,`companyId`),
	FOREIGN KEY(`employeeId`)
	REFERENCES `Employee` (`employeeId`),
	FOREIGN KEY(`companyId`)
	REFERENCES  `Company` (`companyId`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
Engine = InnoDB;
