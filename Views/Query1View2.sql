SELECT 
    rv.DonorName, 
    rv.CategoryName, 
    COUNT(rv.ItemID) AS TotalItemsDonated
FROM 
    ReceivedDeptView rv
WHERE 
    rv.DonorActive = 'y'
GROUP BY 
    rv.DonorName, rv.CategoryName
ORDER BY 
    rv.DonorName, rv.CategoryName;
