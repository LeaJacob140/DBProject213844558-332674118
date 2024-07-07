DECLARE
    report_month NUMBER;
    report_year NUMBER;
    emp_id NUMBER;
    total_salary INT;
    choice CHAR(1);
    report_ref_cursor SYS_REFCURSOR;
    te_id TeamP.TeId%TYPE;
    te_name TeamP.TeName%TYPE;
BEGIN
    -- קבלת קלט עבור החודש והשנה של הדוח
    DBMS_OUTPUT.PUT_LINE('Enter the month for the report (1-12):');
    report_month := &report_month;

    DBMS_OUTPUT.PUT_LINE('Enter the year for the report (e.g., 2023):');
    report_year := &report_year;

    -- דוח חודשי
    DBMS_OUTPUT.PUT_LINE('Generating Monthly Report...');
    GenerateMonthlyActivityReport(report_month, report_year, report_ref_cursor);

    -- עיבוד ה-ref cursor והדפסת התוצאות
    LOOP
        FETCH report_ref_cursor INTO te_id, te_name;
        EXIT WHEN report_ref_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || te_id || ', Employee Name: ' || te_name);
    END LOOP;

    -- סגירת ה-ref cursor
    CLOSE report_ref_cursor;

    -- חישוב משכורת לעובדים במספר מחזורים
    LOOP
        DBMS_OUTPUT.PUT_LINE('Enter Employee ID for salary calculation:');
        emp_id := &emp_id; -- קבלת קלט עבור מספר העובד

        total_salary := CalculateSalary(emp_id, report_month, report_year);
        DBMS_OUTPUT.PUT_LINE('Total salary for Employee ID ' || emp_id || ' for ' || report_month || '/' || report_year || ' is: ' || total_salary);

        DBMS_OUTPUT.PUT_LINE('Do you want to calculate salary for another employee? (Y/N)');
        choice := '&choice'; -- קבלת קלט עבור בחירת המשתמש

        choice := UPPER(choice);
        EXIT WHEN choice <> 'Y';
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
