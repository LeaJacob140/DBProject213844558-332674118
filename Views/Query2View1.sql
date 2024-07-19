SELECT 
    EmdrLocation,
    EmdrEmergencyType,
    COUNT(DISTINCT EmdrDate) AS TotalDrills,
    AVG(EmdrParticipantsCount) AS AvgParticipants
FROM 
    OriginalDeptView
GROUP BY 
    EmdrLocation, EmdrEmergencyType
ORDER BY 
    EmdrLocation, EmdrEmergencyType;
