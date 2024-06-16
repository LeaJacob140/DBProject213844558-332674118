SELECT 
    eb.BoName, 
    ed.EmdrEmergencyType, 
    ed.EmdrDate, 
    ed.EmdrLocation, 
    ed.EmdrAddress
FROM 
    EmergenBodies eb
JOIN 
    TakingPart tp ON eb.BoId = tp.BoId
JOIN 
    EmergencyDrill ed ON tp.EmdrId = ed.EmdrId
WHERE 
    ed.EmdrParticipantsCount > 100
ORDER BY 
    ed.EmdrDate DESC, eb.BoName;
