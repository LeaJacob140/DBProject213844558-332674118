CREATE TABLE Event
(
  EveName VARCHAR(255) NOT NULL,
  EveDate DATE NOT NULL,
  EveLocation VARCHAR(255) NOT NULL,
  EvResponsibillity VARCHAR(255) NOT NULL,
  EveDescribe VARCHAR(255) NOT NULL,
  PRIMARY KEY (EveDate)
);

CREATE TABLE RolesP
(
  RoName VARCHAR(255) NOT NULL,
  RoId INT NOT NULL,
  RoDescribe VARCHAR(255) NOT NULL,
  PRIMARY KEY (RoId)
);

CREATE TABLE EmergencyDrill
(
  EmName VARCHAR(255) NOT NULL,
  EmId INT NOT NULL,
  EmDate DATE NOT NULL,
  EmLocation VARCHAR(255) NOT NULL,
  EmGuide VARCHAR(255) NOT NULL,
  PRIMARY KEY (EmId)
);

CREATE TABLE EmergenBodies
(
  BoName VARCHAR(255) NOT NULL,
  BoId INT NOT NULL,
  BoPhone INT NOT NULL,
  EveDate DATE NOT NULL,
  PRIMARY KEY (BoId),
  FOREIGN KEY (EveDate) REFERENCES Event(EveDate)
);

CREATE TABLE EvDebriefing
(
  DebId INT NOT NULL,
  DeResponsibility VARCHAR(255) NOT NULL,
  DeStatus INT NOT NULL,
  DeConclusion VARCHAR(255) NOT NULL,
  PRIMARY KEY (DebId)
);

CREATE TABLE TakingPart
(
  BoId INT NOT NULL,
  EmId INT NOT NULL,
  PRIMARY KEY (BoId, EmId),
  FOREIGN KEY (BoId) REFERENCES EmergenBodies(BoId),
  FOREIGN KEY (EmId) REFERENCES EmergencyDrill(EmId)
);

CREATE TABLE TeamP
(
  TeId INT NOT NULL,
  TeAddress VARCHAR(255) NOT NULL,
  TePhone INT NOT NULL,
  TeName VARCHAR(255) NOT NULL,
  TeEmail VARCHAR(255) NOT NULL,
  RoId INT NOT NULL,
  PRIMARY KEY (TeId),
  FOREIGN KEY (RoId) REFERENCES RolesP(RoId)
);

CREATE TABLE Worker
(
  WoSalary INT NOT NULL,
  TeId INT NOT NULL,
  PRIMARY KEY (TeId),
  FOREIGN KEY (TeId) REFERENCES TeamP(TeId)
);

CREATE TABLE ActIn
(
  TeId INT NOT NULL,
  EveDate DATE NOT NULL,
  PRIMARY KEY (TeId, EveDate),
  FOREIGN KEY (TeId) REFERENCES TeamP(TeId),
  FOREIGN KEY (EveDate) REFERENCES Event(EveDate)
);

CREATE TABLE Reoprt
(
  TeId INT NOT NULL,
  DebId INT NOT NULL,
  PRIMARY KEY (TeId, DebId),
  FOREIGN KEY (TeId) REFERENCES Worker(TeId),
  FOREIGN KEY (DebId) REFERENCES EvDebriefing(DebId)
);

CREATE TABLE Practicing
(
  EmId INT NOT NULL,
  TeId INT NOT NULL,
  PRIMARY KEY (EmId, TeId),
  FOREIGN KEY (EmId) REFERENCES EmergencyDrill(EmId),
  FOREIGN KEY (TeId) REFERENCES TeamP(TeId)
);
