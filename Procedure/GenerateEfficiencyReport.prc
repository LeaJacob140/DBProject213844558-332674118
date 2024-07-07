CREATE OR REPLACE PROCEDURE GenerateEfficiencyReport(year IN NUMBER) IS
    TYPE ref_cur IS REF CURSOR;
    cur ref_cur;
    bo_id EmergenBodies.BoId%TYPE;
    bo_name EmergenBodies.BoName%TYPE;
    efficiency NUMBER := 0;

    PROCEDURE PrintHeader(header IN VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
        DBMS_OUTPUT.PUT_LINE(header);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END PrintHeader;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Generating Efficiency Report for ' || year);

    OPEN cur FOR
        SELECT BoId, BoName FROM EmergenBodies;

    -- Print Zero Efficiency Report
    PrintHeader('Zero Efficiency');
    LOOP
        FETCH cur INTO bo_id, bo_name;
        EXIT WHEN cur%NOTFOUND;

        -- Calculate efficiency using the CalcEmergRespEff function
        efficiency := CalcEmergRespEff(bo_id, year);

        -- Print if efficiency is 0
        IF efficiency = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Emergency Body: ' || bo_name || ', Efficiency: ' || efficiency);
        END IF;
    END LOOP;

    -- Print Efficiency > 10 Report
    PrintHeader('Efficiency Greater Than 10');
    OPEN cur FOR
        SELECT BoId, BoName FROM EmergenBodies;
    LOOP
        FETCH cur INTO bo_id, bo_name;
        EXIT WHEN cur%NOTFOUND;

        -- Calculate efficiency using the CalcEmergRespEff function
        efficiency := CalcEmergRespEff(bo_id, year);

        -- Print if efficiency is greater than 10
        IF efficiency > 10 THEN
            DBMS_OUTPUT.PUT_LINE('Emergency Body: ' || bo_name || ', Efficiency: ' || efficiency);
        END IF;
    END LOOP;

    -- Print Efficiency > 20 Report
    PrintHeader('Efficiency Greater Than 20');
    OPEN cur FOR
        SELECT BoId, BoName FROM EmergenBodies;
    LOOP
        FETCH cur INTO bo_id, bo_name;
        EXIT WHEN cur%NOTFOUND;

        -- Calculate efficiency using the CalcEmergRespEff function
        efficiency := CalcEmergRespEff(bo_id, year);

        -- Print if efficiency is greater than 20
        IF efficiency > 20 THEN
            DBMS_OUTPUT.PUT_LINE('Emergency Body: ' || bo_name || ', Efficiency: ' || efficiency);
        END IF;
    END LOOP;

    CLOSE cur;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error generating efficiency report: ' || SQLERRM);
        RAISE_APPLICATION_ERROR(-20005, 'Error generating efficiency report');
END GenerateEfficiencyReport;
/
