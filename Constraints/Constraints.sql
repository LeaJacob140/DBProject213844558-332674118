--אילוץ משך התרגיל
ALTER TABLE EmergencyDrill
ADD CONSTRAINT chk_EmdrDurationMinutes CHECK (EmdrDurationMinutes > 0);

--הגדרת ערך ברירת מחדל של משכורת
ALTER TABLE Worker
MODIFY WoSalary DEFAULT 3000;

--אילוץ של מייל שלא יחזור על עצמו
ALTER TABLE TeamP
ADD CONSTRAINT unq_TeEmail UNIQUE (TeEmail);
