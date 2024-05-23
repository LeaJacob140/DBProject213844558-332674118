-- הכנסת נתונים לדוגמה לטבלת Event
INSERT INTO Event (EveName, EveDate, EveLocation, EvResponsibillity, EveDescribe) VALUES 
('Fire Drill', TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'Building A', 'Safety Officer', 'Annual fire drill');
INSERT INTO Event (EveName, EveDate, EveLocation, EvResponsibillity, EveDescribe) VALUES 
('Earthquake Drill', TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Building B', 'Emergency Response Team', 'Quarterly earthquake preparedness drill');

-- הכנסת נתונים לדוגמה לטבלת RolesP
INSERT INTO RolesP (RoName, RoId, RoDescribe) VALUES 
('Manager', 1, 'Manages the team');
INSERT INTO RolesP (RoName, RoId, RoDescribe) VALUES 
('Safety Officer', 2, 'Responsible for safety protocols');

-- הכנסת נתונים לדוגמה לטבלת EmergencyDrill
INSERT INTO EmergencyDrill (EmName, EmId, EmDate, EmLocation, EmGuide) VALUES 
('Fire Drill Training', 1, TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'Building A', 'John Doe');
INSERT INTO EmergencyDrill (EmName, EmId, EmDate, EmLocation, EmGuide) VALUES 
('Earthquake Drill Training', 2, TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Building B', 'Jane Smith');

-- הכנסת נתונים לדוגמה לטבלת EmergenBodies
INSERT INTO EmergenBodies (BoName, BoId, BoPhone, EveDate) VALUES 
('Fire Department', 1, 1234567890, TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO EmergenBodies (BoName, BoId, BoPhone, EveDate) VALUES 
('Medical Team', 2, 9876543210, TO_DATE('2024-07-15', 'YYYY-MM-DD'));

-- הכנסת נתונים לדוגמה לטבלת EvDebriefing
INSERT INTO EvDebriefing (DebId, DeResponsibility, DeStatus, DeConclusion) VALUES 
(1, 'Safety Officer', 1, 'Successful drill');
INSERT INTO EvDebriefing (DebId, DeResponsibility, DeStatus, DeConclusion) VALUES 
(2, 'Emergency Response Team', 0, 'Needs improvement');

-- הכנסת נתונים לדוגמה לטבלת TakingPart
INSERT INTO TakingPart (BoId, EmId) VALUES 
(1, 1);
INSERT INTO TakingPart (BoId, EmId) VALUES 
(2, 2);

-- הכנסת נתונים לדוגמה לטבלת TeamP
INSERT INTO TeamP (TeId, TeAddress, TePhone, TeName, TeEmail, RoId) VALUES 
(1, '123 Main St', 5551234, 'Alpha Team', 'alpha@example.com', 1);
INSERT INTO TeamP (TeId, TeAddress, TePhone, TeName, TeEmail, RoId) VALUES 
(2, '456 Elm St', 5555678, 'Bravo Team', 'bravo@example.com', 2);

-- הכנסת נתונים לדוגמה לטבלת Worker
INSERT INTO Worker (WoSalary, TeId) VALUES 
(50000, 1);
INSERT INTO Worker (WoSalary, TeId) VALUES 
(55000, 2);

-- הכנסת נתונים לדוגמה לטבלת ActIn
INSERT INTO ActIn (TeId, EveDate) VALUES 
(1, TO_DATE('2024-06-01', 'YYYY-MM-DD'));
INSERT INTO ActIn (TeId, EveDate) VALUES 
(2, TO_DATE('2024-07-15', 'YYYY-MM-DD'));

-- הכנסת נתונים לדוגמה לטבלת Reoprt
INSERT INTO Reoprt (TeId, DebId) VALUES 
(1, 1);
INSERT INTO Reoprt (TeId, DebId) VALUES 
(2, 2);

-- הכנסת נתונים לדוגמה לטבלת Practicing
INSERT INTO Practicing (EmId, TeId) VALUES 
(1, 1);
INSERT INTO Practicing (EmId, TeId) VALUES 
(2, 2);

