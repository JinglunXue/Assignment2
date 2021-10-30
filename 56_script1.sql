
SHOW DATABASES;

CREATE DATABASE 56_assign2db;

USE 56_assign2db;

SHOW TABLES;


CREATE TABLE bus( LicensePlateNum CHAR(7) NOT NULL, capacity INT ,PRIMARY KEY
(LicensePlateNum ));


CREATE TABLE passengers(passengerID INT NOT NULL, firstname VARCHAR(20), lastname VARCHAR(20),PRIMARY KEY(passengerID));

CREATE TABLE bustrips (tripID INT NOT NULL, startdate DATE ,enddate DATE,country VARCHAR(30),tripname VARCHAR(50), LicensePlateNum CHAR(7) NOT NULL,
PRIMARY KEY (tripID), FOREIGN KEY (LicensePlateNum) REFERENCES bus(LicensePlateNum));


CREATE TABLE passport (passportNum CHAR(4) NOT NULL, expirydate DATE, citizenship VARCHAR(30),  birthdate DATE, passengerID INT NOT NULL, 
PRIMARY KEY (passportNum), FOREIGN KEY (passengerID) REFERENCES passengers(passengerID) ON DELETE CASCADE);

CREATE TABLE books ( passengerID INT NOT NULL, tripID INT NOT NULL, price FLOAT,
PRIMARY KEY (passengerID,tripID ), FOREIGN KEY (tripID) REFERENCES bustrips(tripID), FOREIGN
KEY(passengerID) REFERENCES passengers(passengerID) ON DELETE CASCADE);


CREATE TABLE assign ( LicensePlateNum CHAR(7) NOT NULL, tripID INT NOT NULL, PRIMARY KEY (LicensePlateNum ,tripID ), FOREIGN KEY (tripID) REFERENCES bustrips(tripID), FOREIGN
KEY(LicensePlateNum) REFERENCES bus(LicensePlateNum) ON DELETE CASCADE);

CREATE TABLE have( passportNum CHAR(4) NOT NULL, passengerID INT NOT NULL, PRIMARY KEY (passengerID  ,passportNum ), FOREIGN KEY (passportNum) REFERENCES passport(passportNum), FOREIGN
KEY(passengerID) REFERENCES passengers(passengerID) ON DELETE CASCADE);

SHOW TABLES;


