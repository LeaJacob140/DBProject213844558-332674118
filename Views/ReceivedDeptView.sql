CREATE VIEW ReceivedDeptView AS
SELECT 
    c.Name AS CategoryName,
    c.EmergencyLevel,
    i.ItemID,
    i.Name AS ItemName,
    i.Description AS ItemDescription,
    i.Quantity,
    i.Status AS ItemStatus,
    o.TeName AS OperatorName, -- Changed to 'TeName'
    o.IdPromission AS OperatorPromission, -- Using 'IdPromission'
    d.Name AS DonorName,
    d.isActive AS DonorActive,
    d.Designation AS DonorDesignation,
    l.Address AS LocationAddress,
    l.Instructions AS LocationInstructions,
    m.MaintenanceID,
    m.MaintenanceDate,
    m.Description AS MaintenanceDescription
FROM 
    Category c
    JOIN Item i ON c.CategoryID = i.CategoryID
    JOIN Location l ON i.PhoneNumber = l.PhoneNumber
    JOIN Operation op ON i.ItemID = op.ItemID
    JOIN Operator o ON op.OperatorID = o.TeId
    JOIN Donation dn ON i.ItemID = dn.ItemID
    JOIN Donor d ON dn.DonorID = d.DonorID
    JOIN Maintenance m ON i.ItemID = m.ItemID;
