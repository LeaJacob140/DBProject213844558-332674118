UPDATE Worker
SET WoSalary = WoSalary + 2000
WHERE TeId IN (
    SELECT TeId
    FROM (
        SELECT TeId
        FROM ActIn
        GROUP BY TeId
        HAVING COUNT(EvId) > 3
        INTERSECT
        SELECT TeId
        FROM Practicing
        GROUP BY TeId
        HAVING COUNT(EmdrId) > 3
    ) CombinedData
);
