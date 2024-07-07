DECLARE
    report_year NUMBER;
    bo_id NUMBER;
    efficiency NUMBER;
    choice CHAR(1);
BEGIN
    -- קבלת קלט עבור השנה של הדוח
    DBMS_OUTPUT.PUT_LINE('Enter the year for the report (e.g., 2023):');
    report_year := &report_year;

    -- קריאה לפרוצדורה ליצירת דוח יעילות
    DBMS_OUTPUT.PUT_LINE('Generating Efficiency Report...');
    GenerateEfficiencyReport(report_year);

    -- חישוב יעילות לגופי חירום במספר מחזורים
    LOOP
        DBMS_OUTPUT.PUT_LINE('Enter Emergency Body ID for efficiency calculation:');
        bo_id := &bo_id; -- קבלת קלט עבור מזהה גוף החירום

        efficiency := CalcEmergRespEff(bo_id, report_year);
        DBMS_OUTPUT.PUT_LINE('Efficiency for Emergency Body ID ' || bo_id || ' for year ' || report_year || ' is: ' || efficiency);

        IF efficiency = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Warning: Emergency Body ID ' || bo_id || ' has zero efficiency for the year ' || report_year);
        ELSIF efficiency > 20 THEN
            DBMS_OUTPUT.PUT_LINE('Great: Emergency Body ID ' || bo_id || ' has excellent efficiency above 20% for the year ' || report_year);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Moderate: Emergency Body ID ' || bo_id || ' has efficiency between 0% and 20% for the year ' || report_year);
        END IF;

        DBMS_OUTPUT.PUT_LINE('Do you want to calculate efficiency for another emergency body? (Y/N)');
        choice := '&choice'; -- קבלת קלט עבור בחירת המשתמש

        choice := UPPER(choice);
        EXIT WHEN choice <> 'Y';
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
