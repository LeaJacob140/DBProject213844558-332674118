CREATE TABLE Event
(
  EveName VARCHAR(255) NOT NULL,
  EveDate DATE NOT NULL,
  EveLocation VARCHAR(255) NOT NULL,
  EvResponsibillity VARCHAR(255) NOT NULL,
  EveDescribe VARCHAR(255) NOT NULL,
  EvId INT NOT NULL,
  PRIMARY KEY (EvId)
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
  EmdrDate DATE NOT NULL,
  EmdrId INT NOT NULL,
  EmdrDurationMinutes INT NOT NULL,
  EmdrEmergencyType VARCHAR(255) NOT NULL,
  EmdrLocation VARCHAR(255) NOT NULL,
  EmdrParticipantsCount INT NOT NULL,
  EmdrAddress VARCHAR(255) NOT NULL,
  PRIMARY KEY (EmdrId)
);

CREATE TABLE EmergenBodies
(
  BoName VARCHAR(255) NOT NULL,
  BoId INT NOT NULL,
  BoPhone VARCHAR(15) NOT NULL,
  EvId INT NOT NULL,
  PRIMARY KEY (BoId),
  FOREIGN KEY (EvId) REFERENCES Event(EvId)
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
  EmdrId INT NOT NULL,
  PRIMARY KEY (BoId, EmdrId),
  FOREIGN KEY (BoId) REFERENCES EmergenBodies(BoId),
  FOREIGN KEY (EmdrId) REFERENCES EmergencyDrill(EmdrId)
);

CREATE TABLE TeamP
(
  TeId INT NOT NULL,
  TeAddress VARCHAR(255) NOT NULL,
  TePhone VARCHAR(15) NOT NULL,
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
  EvId INT NOT NULL,
  PRIMARY KEY (TeId, EvId),
  FOREIGN KEY (TeId) REFERENCES TeamP(TeId),
  FOREIGN KEY (EvId) REFERENCES Event(EvId)
);

CREATE TABLE ReoprtEv
(
  TeId INT NOT NULL,
  DebId INT NOT NULL,
  PRIMARY KEY (TeId, DebId),
  FOREIGN KEY (TeId) REFERENCES Worker(TeId),
  FOREIGN KEY (DebId) REFERENCES EvDebriefing(DebId)
);

CREATE TABLE Practicing
(
  EmdrId INT NOT NULL,
  TeId INT NOT NULL,
  PRIMARY KEY (EmdrId, TeId),
  FOREIGN KEY (EmdrId) REFERENCES EmergencyDrill(EmdrId),
  FOREIGN KEY (TeId) REFERENCES TeamP(TeId)
);

