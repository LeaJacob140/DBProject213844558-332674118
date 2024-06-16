-- ����� ������ ����� ReoprtEv
DELETE FROM ReoprtEv
WHERE TeId IN (
    SELECT TeId
    FROM TeamP
    WHERE TeId NOT IN (SELECT TeId FROM ActIn)
    AND TeId NOT IN (SELECT TeId FROM Practicing)
);

-- ����� ������ ����� ActIn
DELETE FROM ActIn
WHERE TeId IN (
    SELECT TeId
    FROM TeamP
    WHERE TeId NOT IN (SELECT TeId FROM Practicing)
);

-- ����� ������ ����� Practicing
DELETE FROM Practicing
WHERE TeId IN (
    SELECT TeId
    FROM TeamP
    WHERE TeId NOT IN (SELECT TeId FROM ActIn)
);

-- ����� ������ ����� Worker
DELETE FROM Worker
WHERE TeId IN (
    SELECT TeId
    FROM TeamP
    WHERE TeId NOT IN (SELECT TeId FROM ActIn)
    AND TeId NOT IN (SELECT TeId FROM Practicing)
);

-- ����� ������ ����� TeamP
DELETE FROM TeamP
WHERE TeId NOT IN (SELECT TeId FROM ActIn)
AND TeId NOT IN (SELECT TeId FROM Practicing);
