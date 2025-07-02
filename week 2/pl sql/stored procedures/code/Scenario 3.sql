
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
CREATE OR REPLACE PROCEDURE TransferFunds (
  from_account IN NUMBER,
  to_account IN NUMBER,
  amount IN NUMBER
) IS
  insufficient_balance EXCEPTION;
  from_balance NUMBER;
BEGIN
  SELECT Balance INTO from_balance
  FROM Accounts WHERE AccountID = from_account FOR UPDATE;

  IF from_balance < amount THEN
    RAISE insufficient_balance;
  END IF;

  UPDATE Accounts
  SET Balance = Balance - amount
  WHERE AccountID = from_account;

  UPDATE Accounts
  SET Balance = Balance + amount
  WHERE AccountID = to_account;
/

  COMMIT;



SET SERVEROUTPUT ON;
SELECT AccountID, CustomerName, Balance
FROM Accounts
WHERE AccountID IN (1001, 1002);

  