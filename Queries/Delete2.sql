--מחיקת כל התרגילים שארעו במיקם מסוים ושמשך הזמן שלהם קטן מ60 דקות
DELETE FROM TakingPart
WHERE EmdrId IN (
  SELECT EmdrId
  FROM EmergencyDrill
  WHERE EmdrLocation = '17 Service Alley' AND EmdrDurationMinutes < 60
) AND BoId IN (
  SELECT BoId
  FROM EmergenBodies
  WHERE EvId IN (
    SELECT EvId
    FROM Event
    WHERE EveLocation = '17 Service Alley'
  )
) AND NOT EXISTS (
  SELECT 1
  FROM TakingPart tp
  WHERE tp.EmdrId = TakingPart.EmdrId
  AND tp.BoId != TakingPart.BoId
);
