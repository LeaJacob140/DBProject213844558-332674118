SELECT 
    EveName, 
    EveDate, 
    EveLocation, 
    EmdrEmergencyType,
    COUNT(DISTINCT EmdrDate) AS TotalDrills, 
    AVG(EmdrDurationMinutes) AS AvgDuration
FROM 
    OriginalDeView
GROUP BY 
    EveName, EveDate, EveLocation, EmdrEmergencyType
HAVING 
    COUNT(DISTINCT EmdrDate) > 0;
