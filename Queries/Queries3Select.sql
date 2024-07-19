SELECT 
    EXTRACT(YEAR FROM ed.EmdrDate) AS Year, 
    ed.EmdrEmergencyType, 
    COUNT(DISTINCT ed.EmdrId) AS DrillsCount, 
    AVG(ed.EmdrParticipantsCount) AS AvgParticipants
FROM 
    EmergencyDrill ed
JOIN 
    TakingPart tp ON ed.EmdrId = tp.EmdrId
GROUP BY 
    EXTRACT(YEAR FROM ed.EmdrDate), ed.EmdrEmergencyType
HAVING 
    COUNT(DISTINCT ed.EmdrId) > 1
ORDER BY 
    Year DESC, DrillsCount DESC;
