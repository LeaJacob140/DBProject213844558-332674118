SELECT 
    LocationAddress, 
    MaintenanceDate, 
    MaintenanceDescription, 
    CategoryName, 
    EmergencyLevel
FROM 
    ReceivedDeptView
WHERE 
    EmergencyLevel >= 5
ORDER BY 
    MaintenanceDate DESC, EmergencyLevel DESC;
