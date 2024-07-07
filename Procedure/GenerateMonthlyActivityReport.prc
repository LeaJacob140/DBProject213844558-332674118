CREATE OR REPLACE PROCEDURE GenerateMonthlyActivityReport(report_month IN NUMBER, report_year IN NUMBER, report_ref_cursor OUT SYS_REFCURSOR) IS
    CURSOR employee_cursor IS
        SELECT DISTINCT TeId, TeName 
        FROM TeamP 
        WHERE TeId IN (
            SELECT TeId 
            FROM ActIn A
            JOIN Event E ON A.EvId = E.EvId
            WHERE EXTRACT(MONTH FROM E.EveDate) = report_month
              AND EXTRACT(YEAR FROM E.EveDate) = report_year
            UNION
            SELECT TeId 
            FROM Practicing P
            JOIN EmergencyDrill E ON P.EmdrId = E.EmdrId
            WHERE EXTRACT(MONTH FROM E.EmdrDate) = report_month
              AND EXTRACT(YEAR FROM E.EmdrDate) = report_year
        );

    emp_record employee_cursor%ROWTYPE;
    total_salary INT;
    event_count INT;
    exercise_count INT;
    total_duration INT;
    teid_list VARCHAR2(4000) := '';

BEGIN
    -- Open the cursor for all employees who participated in events or exercises in the given month and year
    OPEN employee_cursor;

    -- Loop through all employees and calculate monthly salary
    LOOP
        FETCH employee_cursor INTO emp_record;
        EXIT WHEN employee_cursor%NOTFOUND;

        -- Add TeId to the concatenated string
        teid_list := teid_list || emp_record.TeId || ',';

        -- Calculate salary for each employee
        total_salary := CalculateSalary(emp_record.TeId, report_month, report_year);

        -- Calculate number of events and exercises in the given month
        SELECT COUNT(*), NVL(SUM(EmdrDurationMinutes), 0)
        INTO exercise_count, total_duration
        FROM EmergencyDrill
        WHERE EmdrId IN (SELECT EmdrId FROM Practicing WHERE TeId = emp_record.TeId)
          AND EXTRACT(MONTH FROM EmdrDate) = report_month
          AND EXTRACT(YEAR FROM EmdrDate) = report_year;

        SELECT COUNT(*)
        INTO event_count
        FROM ActIn
        WHERE TeId = emp_record.TeId
          AND EXTRACT(MONTH FROM (SELECT EveDate FROM Event WHERE Event.EvId = ActIn.EvId)) = report_month
          AND EXTRACT(YEAR FROM (SELECT EveDate FROM Event WHERE Event.EvId = ActIn.EvId)) = report_year;

        -- Print the report
        DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_record.TeName ||
                             ', Events: ' || event_count ||
                             ', Exercises: ' || exercise_count ||
                             ', Total Duration: ' || total_duration ||
                             ', Salary: ' || total_salary);
    END LOOP;

    CLOSE employee_cursor;

    -- Remove the last comma from the concatenated string
    IF LENGTH(teid_list) > 0 THEN
        teid_list := SUBSTR(teid_list, 1, LENGTH(teid_list) - 1);
    END IF;

    -- Open ref cursor for the report
    OPEN report_ref_cursor FOR
        'SELECT TeId, TeName
         FROM TeamP
         WHERE TeId IN (' || teid_list || ')';

EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Error generating report');
END GenerateMonthlyActivityReport;
/
