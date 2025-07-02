
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Accounts';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Employees';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/


CREATE TABLE Accounts (
  AccountID NUMBER PRIMARY KEY,
  CustomerName VARCHAR2(50),
  AccountType VARCHAR2(20),
  Balance NUMBER(10,2)
);

CREATE TABLE Employees (
  EmpID NUMBER PRIMARY KEY,
  Name VARCHAR2(50),
  DepartmentID NUMBER,
  Salary NUMBER(10,2)
);


INSERT INTO Accounts VALUES (1001, 'Sakthi', 'SAVINGS', 20000);
INSERT INTO Accounts VALUES (1002, 'Kavin',  'SAVINGS', 15000);
INSERT INTO Accounts VALUES (1003, 'Divya',  'CURRENT', 10000);

INSERT INTO Employees VALUES (1, 'Ravi', 10, 50000);
INSERT INTO Employees VALUES (2, 'Anu', 10, 55000);
INSERT INTO Employees VALUES (3, 'Vishal', 20, 60000);

COMMIT;

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  dept_id IN NUMBER,
  bonus_percent IN NUMBER
) IS
BEGIN
  UPDATE Employees
  SET Salary = Salary + (Salary * bonus_percent / 100)
  WHERE DepartmentID = dept_id;
END;
/

  COMMIT;



SET SERVEROUTPUT ON;
SELECT EmpID, Name, DepartmentID, Salary
FROM Employees
WHERE DepartmentID = 10;

  