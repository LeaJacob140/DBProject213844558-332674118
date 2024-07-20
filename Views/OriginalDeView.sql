CREATE VIEW OriginalDeptView AS
SELECT 
    e.EveName,
    e.EveDate,
    e.EveLocation,
    e.EvResponsibillity,
    e.EveDescribe,
    ed.EmdrDate,
    ed.EmdrDurationMinutes,
    ed.EmdrEmergencyType,
    ed.EmdrLocation,
    ed.EmdrParticipantsCount,
    ed.EmdrAddress,
    eb.BoName,
    eb.BoPhone,
    t.TeName,
    t.TeEmail,
    t.TePhone,
    r.RoName,
    r.RoDescribe,
    w.WoSalary,
    edb.DeResponsibility,
    edb.DeStatus,
    edb.DeConclusion
FROM 
    Event e
    JOIN EmergenBodies eb ON e.EvId = eb.EvId
    JOIN TakingPart tp ON eb.BoId = tp.BoId
    JOIN EmergencyDrill ed ON tp.EmdrId = ed.EmdrId
    JOIN Practicing pr ON ed.EmdrId = pr.EmdrId
    JOIN TeamP t ON pr.TeId = t.TeId
    JOIN Worker w ON t.TeId = w.TeId
    JOIN RolesP r ON t.RoId = r.RoId
    JOIN EvDebriefing edb ON edb.DebId = e.EvId;
