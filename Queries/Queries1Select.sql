SELECT 
    'Event' AS Type, 
    e.EveName AS Name, 
    e.EveDate AS EventDate, 
    COALESCE(COUNT(ai.TeId), 0) AS ParticipantsCount, 
    NULL AS DurationMinutes
FROM 
    Event e
LEFT JOIN 
    ActIn ai ON e.EvId = ai.EvId
WHERE 
    EXTRACT(YEAR FROM e.EveDate) = 2023
GROUP BY 
    e.EveName, e.EveDate

UNION ALL

SELECT 
    'Emergency Drill' AS Type, 
    ed.EmdrEmergencyType AS Name, 
    ed.EmdrDate AS EventDate, 
    ed.EmdrParticipantsCount AS ParticipantsCount, 
    ed.EmdrDurationMinutes AS DurationMinutes
FROM 
    EmergencyDrill ed
WHERE 
    EXTRACT(YEAR FROM ed.EmdrDate) = 2023

ORDER BY 
    EventDate;
