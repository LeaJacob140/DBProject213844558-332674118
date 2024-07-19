-- מחיקת רשומות בטבלת ReoprtEv
DELETE FROM ReoprtEv
WHERE TeId IN (
    SELECT TeId
    FROM TeamP
    WHERE TeId NOT IN (SELECT TeId FROM ActIn)
    AND TeId NOT IN (SELECT TeId FROM Practicing)
);

-- מחיקת רשומות בטבלת ActIn
DELETE FROM ActIn
WHERE TeId IN (
    SELECT TeId
    FROM TeamP
    WHERE TeId NOT IN (SELECT TeId FROM Practicing)
);

-- מחיקת רשומות בטבלת Practicing
DELETE FROM Practicing
WHERE TeId IN (
    SELECT TeId
    FROM TeamP
    WHERE TeId NOT IN (SELECT TeId FROM ActIn)
);

-- מחיקת רשומות בטבלת Worker
DELETE FROM Worker
WHERE TeId IN (
    SELECT TeId
    FROM TeamP
    WHERE TeId NOT IN (SELECT TeId FROM ActIn)
    AND TeId NOT IN (SELECT TeId FROM Practicing)
);

-- מחיקת רשומות בטבלת TeamP
DELETE FROM TeamP
WHERE TeId NOT IN (SELECT TeId FROM ActIn)
AND TeId NOT IN (SELECT TeId FROM Practicing);
