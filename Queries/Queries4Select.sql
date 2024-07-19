SELECT 
    t.TeName AS TeamName,
    t.TeId AS TeamID
FROM 
    TeamP t
JOIN 
    ActIn a ON t.TeId = a.TeId
JOIN 
    EvDebriefing ed ON a.EvId = ed.DebId
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM 
            Worker w
        WHERE 
            w.TeId = t.TeId
            AND w.WoSalary IS NOT NULL
    )
    AND ed.DeStatus = 0
ORDER BY 
    t.TeName ASC;
