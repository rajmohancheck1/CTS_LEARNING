-- STEP 1: Drop existing tables (ignore error if not exists)
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Loans';
  EXECUTE IMMEDIATE 'DROP TABLE Customers';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/

-- STEP 2: Create Customers table
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    DOB DATE,
    Balance NUMBER(10,2),
    IsVIP CHAR(1) DEFAULT 'N'
);

-- STEP 3: Create Loans table
CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER REFERENCES Customers(CustomerID),
    InterestRate NUMBER(5,2),
    DueDate DATE
);

-- STEP 4: Insert sample data
INSERT INTO Customers VALUES (1, 'Sakthi', TO_DATE('1960-07-01','YYYY-MM-DD'), 15000.00, 'N');
INSERT INTO Customers VALUES (2, 'Kavin', TO_DATE('1985-06-20','YYYY-MM-DD'), 9000.00, 'N');
INSERT INTO Customers VALUES (3, 'Divya', TO_DATE('1955-01-10','YYYY-MM-DD'), 8000.00, 'N');

INSERT INTO Loans VALUES (101, 1, 9.0, SYSDATE + 5);
INSERT INTO Loans VALUES (102, 2, 8.5, SYSDATE + 40);
INSERT INTO Loans VALUES (103, 3, 10.0, SYSDATE + 10);

COMMIT;
SET SERVEROUTPUT ON;

BEGIN
  FOR loan IN (
    SELECT LoanID, CustomerID, DueDate
    FROM Loans
    WHERE DueDate <= SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE(
      'Reminder: Loan ID ' || loan.LoanID ||
      ' is due on ' || TO_CHAR(loan.DueDate, 'YYYY-MM-DD') ||
      ' for Customer ID ' || loan.CustomerID
    );
  END LOOP;
END;
/