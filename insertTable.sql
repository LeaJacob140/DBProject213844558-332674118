-- insertTables.sql
-- הכנסת נתונים לטבלאות שנוצרו

-- הכנסת נתונים לטבלת Event
INSERT INTO Event (EvId, EveName, EveDate, EveLocation, EvResponsibillity, EveDescribe) VALUES
(1, 'Emergency Drill', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'Location A', 'John Doe', 'Monthly drill');
INSERT INTO Event (EvId, EveName, EveDate, EveLocation, EvResponsibillity, EveDescribe) VALUES
(2, 'Safety Meeting', TO_DATE('2023-06-15', 'YYYY-MM-DD'), 'Location B', 'Jane Smith', 'Quarterly safety meeting');

-- הכנסת נתונים לטבלת RolesP
INSERT INTO RolesP (RoId, RoName, RoDescribe) VALUES
(1, 'Manager', 'Manages team and operations');
INSERT INTO RolesP (RoId, RoName, RoDescribe) VALUES
(2, 'Safety Officer', 'Responsible for safety protocols');

-- הכנסת נתונים לטבלת EmergencyDrill
INSERT INTO EmergencyDrill (EmdrId, EmdrDate, EmdrDurationMinutes, EmdrEmergencyType, EmdrLocation, EmdrParticipantsCount, EmdrAddress) VALUES
(1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 60, 'Fire Drill', 'Building 1', 30, '123 Main St');
INSERT INTO EmergencyDrill (EmdrId, EmdrDate, EmdrDurationMinutes, EmdrEmergencyType, EmdrLocation, EmdrParticipantsCount, EmdrAddress) VALUES
(2, TO_DATE('2023-06-01', 'YYYY-MM-DD'), 90, 'Earthquake Drill', 'Building 2', 45, '456 Elm St');

-- הכנסת נתונים לטבלת EmergenBodies
INSERT INTO EmergenBodies (BoId, BoName, BoPhone, EvId) VALUES
(1, 'Fire Department', 1234567890, 1);
INSERT INTO EmergenBodies (BoId, BoName, BoPhone, EvId) VALUES
(2, 'Police Department', 0987654321, 2);

-- הכנסת נתונים לטבלת EvDebriefing
INSERT INTO EvDebriefing (DebId, DeResponsibility, DeStatus, DeConclusion) VALUES
(1, 'John Doe', 1, 'Successful');
INSERT INTO EvDebriefing (DebId, DeResponsibility, DeStatus, DeConclusion) VALUES
(2, 'Jane Smith', 0, 'Needs Improvement');

-- הכנסת נתונים לטבלת TakingPart
INSERT INTO TakingPart (BoId, EmdrId) VALUES
(1, 1);
INSERT INTO TakingPart (BoId, EmdrId) VALUES
(2, 2);

-- הכנסת נתונים לטבלת TeamP
INSERT INTO TeamP (TeId, TeAddress, TePhone, TeName, TeEmail, RoId) VALUES
(1, '123 Main St', 5551234, 'Alice Johnson', 'alice@example.com', 1);
INSERT INTO TeamP (TeId, TeAddress, TePhone, TeName, TeEmail, RoId) VALUES
(2, '456 Elm St', 5555678, 'Bob Brown', 'bob@example.com', 2);

-- הכנסת נתונים לטבלת Worker
INSERT INTO Worker (TeId, WoSalary) VALUES
(1, 50000);
INSERT INTO Worker (TeId, WoSalary) VALUES
(2, 60000);

-- הכנסת נתונים לטבלת ActIn
INSERT INTO ActIn (TeId, EvId) VALUES
(1, 1);
INSERT INTO ActIn (TeId, EvId) VALUES
(2, 2);

-- הכנסת נתונים לטבלת Reoprt
INSERT INTO Reoprt (TeId, DebId) VALUES
(1, 1);
INSERT INTO Reoprt (TeId, DebId) VALUES
(2, 2);

-- הכנסת נתונים לטבלת Practicing
INSERT INTO Practicing (EmdrId, TeId) VALUES
(1, 1);
INSERT INTO Practicing (EmdrId, TeId) VALUES
(2, 2);

-- סיום הכנסת הנתונים
