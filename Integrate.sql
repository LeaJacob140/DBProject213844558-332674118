-- Change the column name OPERATORID to TeId in the table OPERATOR
ALTER TABLE Operator RENAME COLUMN OPERATORID TO TeId;

-- Change the column name NAME to TeName in the table OPERATOR
ALTER TABLE Operator RENAME COLUMN NAME TO TeName;

-- Drop the column EXPIRATIONDATE from the table OPERATOR
ALTER TABLE Operator DROP COLUMN ExpirationDate;

-- Add a column named IdPromission to the table OPERATOR
ALTER TABLE Operator ADD IdPromission NUMBER(10);

-- Create table MainTo with foreign keys from TeamP and Maintenance, and add a column named MainDate
CREATE TABLE MainTo
(
  TeId INT NOT NULL,
  MaintenanceID NUMBER(10) NOT NULL,
  MainDate DATE NOT NULL,
  PRIMARY KEY (TeId, MaintenanceID),
  FOREIGN KEY (TeId) REFERENCES TeamP(TeId),
  FOREIGN KEY (MaintenanceID) REFERENCES Maintenance(MaintenanceID)
);

-- Create table DonerTo with DonationDate, DonationId, and foreign keys from Donor and EmergenBodies
CREATE TABLE DonerTo
(
  DonationDate DATE NOT NULL,
  DonationId INT NOT NULL,
  DonorID NUMBER(10) NOT NULL,
  BoId INT NOT NULL,
  PRIMARY KEY (DonationId),
  FOREIGN KEY (DonorID) REFERENCES Donor(DonorID),
  FOREIGN KEY (BoId) REFERENCES EmergenBodies(BoId)
);

-- Create table DrillCategoryOf with foreign keys from EmergencyDrill and Category
CREATE TABLE DrillCategoryOf
(
  EmdrId INT NOT NULL,
  CategoryID NUMBER(10) NOT NULL,
  PRIMARY KEY (EmdrId, CategoryID),
  FOREIGN KEY (EmdrId) REFERENCES EmergencyDrill(EmdrId),
  FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- Add the foreign key attributes from Category to the table EmergencyDrill
ALTER TABLE EmergencyDrill ADD CategoryID NUMBER(10);

ALTER TABLE EmergencyDrill ADD CONSTRAINT FK_EmergencyDrill_Category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);
