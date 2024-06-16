UPDATE EvDebriefing
SET DeStatus = 0
WHERE DebId IN (
    SELECT De.DebId
    FROM EvDebriefing De
    INNER JOIN ReoprtEv R ON De.DebId = R.DebId
    INNER JOIN Worker W ON R.TeId = W.TeId
    INNER JOIN TeamP T ON W.TeId = T.TeId
    INNER JOIN ActIn A ON T.TeId = A.TeId
    INNER JOIN Event E ON A.EvId = E.EvId
    WHERE E.EveDate < TO_DATE('01/01/2005', 'DD/MM/YYYY')
);
