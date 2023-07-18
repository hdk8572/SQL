DROP PROCEDURE TEST_EMPLOYEE;
DROP PROCEDURE TEST_EMPLOYEE_ALL;
CREATE OR REPLACE PROCEDURE TEST_EMPLOYEE
    ( A_EMP_ID IN EMPLOYEE.EMP_ID%TYPE
     ,A_EMP_NAME OUT EMPLOYEE.EMP_NAME%TYPE
     ,A_SALARY OUT EMPLOYEE.SALARY%TYPE
     ,A_EMAIL OUT EMPLOYEE.EMAIL%TYPE
     )
IS
BEGIN
    SELECT EMP_NAME, SALARY, EMAIL
    INTO A_EMP_NAME, A_SALARY, A_EMAIL
    FROM EMPLOYEE
    WHERE A_EMP_ID = EMP_ID;
    DBMS_OUTPUT.PUT_LINE('EMP_ID :'||A_EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME :'||A_EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('SALARY :'||A_SALARY);
    DBMS_OUTPUT.PUT_LINE('EMAIL :'||A_EMAIL);
END;
/
-- 바인드 변수 선언
VARIABLE OUT_ENAME VARCHAR2(30);
VARIABLE OUT_SAL VARCHAR2(30);
VARIABLE OUT_EMAIL VARCHAR2(30);
-- PROCEDURE 실행
EXEC TEST_EMPLOYEE(200, :OUT_ENAME, :OUT_SAL, :OUT_EMAIL);
-- 출력
PRINT OUT_ENAME
PRINT OUT_SAL
PRINT OUT_EMAIL
-----------------------------------------------------------
CREATE OR REPLACE PROCEDURE TEST_EMPLOYEE_ALL
IS
BEGIN
    FOR E IN (SELECT * FROM EMPLOYEE) LOOP
        TEST_EMPLOYEE(E.EMP_ID, E.EMP_NAME, E.SALARY, E.EMAIL);
    END LOOP;
END;
/

EXEC TEST_EMPLOYEE_ALL;
