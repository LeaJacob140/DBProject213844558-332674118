CREATE OR REPLACE FUNCTION CalculateSalary(te_id INT, report_month INT, report_year INT) RETURN INT IS
    base_salary INT;
    total_salary INT;
    num_exercises INT;
    total_duration INT;
    num_events INT;
    CURSOR exercise_cursor IS
        SELECT EmdrDurationMinutes, COUNT(*) AS exercise_count
        FROM Practicing P
        JOIN EmergencyDrill E ON P.EmdrId = E.EmdrId
        WHERE P.TeId = te_id 
          AND EXTRACT(MONTH FROM E.EmdrDate) = report_month 
          AND EXTRACT(YEAR FROM E.EmdrDate) = report_year
        GROUP BY EmdrDurationMinutes;
    exercise_record exercise_cursor%ROWTYPE;
    CURSOR event_cursor IS
        SELECT COUNT(*) AS event_count
        FROM ActIn A
        JOIN Event E ON A.EvId = E.EvId
        WHERE A.TeId = te_id 
          AND EXTRACT(MONTH FROM E.EveDate) = report_month 
          AND EXTRACT(YEAR FROM E.EveDate) = report_year;
    event_record event_cursor%ROWTYPE;
BEGIN
    -- Get the base salary from the Worker table
    BEGIN
        SELECT WoSalary INTO base_salary FROM Worker WHERE TeId = te_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            base_salary := 1000; -- ערך ברירת מחדל במקרה ואין נתונים בטבלת Worker
    END;

    -- Initialize total salary with the base salary
    total_salary := base_salary;

    -- Open the exercise cursor
    OPEN exercise_cursor;
    LOOP
        FETCH exercise_cursor INTO exercise_record;
        EXIT WHEN exercise_cursor%NOTFOUND;

        -- Calculate total duration and count of exercises
        total_duration := total_duration + exercise_record.EmdrDurationMinutes;
        num_exercises := exercise_record.exercise_count;
    END LOOP;
    CLOSE exercise_cursor;

    -- Add exercise bonus if applicable
    IF num_exercises > 2 THEN
        total_salary := total_salary + total_duration;
    END IF;

    -- Open the event cursor
    OPEN event_cursor;
    LOOP
        FETCH event_cursor INTO event_record;
        EXIT WHEN event_cursor%NOTFOUND;

        -- Calculate number of events
        num_events := event_record.event_count;
    END LOOP;
    CLOSE event_cursor;

    -- Add event bonus if applicable
    IF num_events > 3 THEN
        total_salary := total_salary + 500;
    END IF;

    -- Update the Worker table with the new total salary
    UPDATE Worker
    SET WoSalary = total_salary
    WHERE TeId = te_id;

    RETURN total_salary;
EXCEPTION
    WHEN OTHERS THEN
        RETURN base_salary; -- במקרה של שגיאה, החזרת משכורת בסיסית
END CalculateSalary;
/
