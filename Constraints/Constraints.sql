--����� ��� ������
ALTER TABLE EmergencyDrill
ADD CONSTRAINT chk_EmdrDurationMinutes CHECK (EmdrDurationMinutes > 0);

--����� ��� ����� ���� �� ������
ALTER TABLE Worker
MODIFY WoSalary DEFAULT 3000;

--����� �� ���� ��� ����� �� ����
ALTER TABLE TeamP
ADD CONSTRAINT unq_TeEmail UNIQUE (TeEmail);
