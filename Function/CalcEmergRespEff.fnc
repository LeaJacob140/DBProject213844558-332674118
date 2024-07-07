CREATE OR REPLACE FUNCTION CalcEmergRespEff(bo_id INT, year INT) RETURN NUMBER IS
    total_drills INT := 0;
    total_events INT := 0;
    total_participants INT := 0;
    total_duration NUMBER := 0;
    efficiency NUMBER := 0;
    CURSOR drill_cur IS
        SELECT EmdrDurationMinutes, EmdrParticipantsCount
        FROM EmergencyDrill D
        JOIN TakingPart T ON D.EmdrId = T.EmdrId
        WHERE T.BoId = bo_id
          AND EXTRACT(YEAR FROM D.EmdrDate) = year;
    CURSOR event_cur IS
        SELECT 120 AS event_duration, 1 AS event_participants -- Assuming each event is 120 minutes
        FROM Event E
        JOIN EmergenBodies EB ON E.EvId = EB.EvId
        WHERE EB.BoId = bo_id
          AND EXTRACT(YEAR FROM E.EveDate) = year;
    drill_rec drill_cur%ROWTYPE;
    event_rec event_cur%ROWTYPE;
BEGIN
    OPEN drill_cur;
    LOOP
        FETCH drill_cur INTO drill_rec;
        EXIT WHEN drill_cur%NOTFOUND;
        total_drills := total_drills + 1;
        total_participants := total_participants + drill_rec.EmdrParticipantsCount;
        total_duration := total_duration + drill_rec.EmdrDurationMinutes;
    END LOOP;
    CLOSE drill_cur;

    OPEN event_cur;
    LOOP
        FETCH event_cur INTO event_rec;
        EXIT WHEN event_cur%NOTFOUND;
        total_events := total_events + 1;
        total_participants := total_participants + event_rec.event_participants;
        total_duration := total_duration + event_rec.event_duration;
    END LOOP;
    CLOSE event_cur;

    IF total_drills + total_events > 0 THEN
        efficiency := (total_participants / (total_drills + total_events)) / total_duration * 100;
    ELSE
        efficiency := 0;
    END IF;

    RETURN efficiency;
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0; -- במקרה של שגיאה, החזרת 0
END CalcEmergRespEff;
/
