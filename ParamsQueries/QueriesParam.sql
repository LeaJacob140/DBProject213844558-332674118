-- 1. שאילתה למציאת כל האירועים שחבר צוות מסוים (שמו ניתן כפרמטר) השתתף בהם, יחד עם התפקידים שהם שיחקו
-- פרמטרים: @TeName (שם חבר הצוות)
SELECT E.EveName, E.EveDate, E.EveLocation, R.RoName
FROM Event E
JOIN ActIn AI ON E.EvId = AI.EvId
JOIN TeamP T ON AI.TeId = T.TeId
JOIN RolesP R ON T.RoId = R.RoId
WHERE T.TeName = '&TeName'
ORDER BY E.EveDate;

-- 2. שאילתה לרשימת כל התרגילים החירום שהתרחשו בשנה מסוימת, יחד עם הגופים החירום המשתתפים ומספר המשתתפים
-- פרמטרים: @year (שנת תרגילי החירום)

SELECT ED.EmdrDate, ED.EmdrLocation, ED.EmdrEmergencyType, B.BoName, ED.EmdrParticipantsCount
FROM EmergencyDrill ED
JOIN TakingPart TP ON ED.EmdrId = TP.EmdrId
JOIN EmergenBodies B ON TP.BoId = B.BoId
WHERE EXTRACT(YEAR FROM ED.EmdrDate) = &year
ORDER BY ED.EmdrDate;
-- 3. שאילתה לקבלת פרטי התדריכים של אירועים על בסיס הסטטוס והמסקנה שלהם, יחד עם שמות חברי הצוות האחראיים
-- פרמטרים: @DeStatus (סטטוס התדריך), @DeConclusion (רמז למסקנת התדריך)
SELECT D.DeConclusion, D.DeResponsibility, T.TeName, D.DeStatus
FROM EvDebriefing D
JOIN ReoprtEv RE ON D.DebId = RE.DebId
JOIN Worker W ON RE.TeId = W.TeId
JOIN TeamP T ON W.TeId = T.TeId
WHERE D.DeStatus = &DeStatus AND D.DeConclusion LIKE '%' || '&DeConclusion' || '%'
ORDER BY D.DeConclusion;
-- 4. שאילתה לרשימת כל חברי הצוות שהשתתפו בתרגילי חירום בטווח תאריכים מסוים, יחד עם תפקידיהם ומשך זמן התרגילים
-- פרמטרים: @startDate (תאריך התחלה), @endDate (תאריך סיום)
SELECT T.TeName, R.RoName, ED.EmdrDate, ED.EmdrDurationMinutes
FROM TeamP T
JOIN Practicing P ON T.TeId = P.TeId
JOIN EmergencyDrill ED ON P.EmdrId = ED.EmdrId
JOIN RolesP R ON T.RoId = R.RoId
WHERE ED.EmdrDate BETWEEN TO_DATE('&startDate', 'YYYY-MM-DD') AND TO_DATE('&endDate', 'YYYY-MM-DD')
ORDER BY ED.EmdrDate, T.TeName;
