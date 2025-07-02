SET SERVEROUTPUT ON;

BEGIN
  FOR cust IN (
    SELECT c.CustomerID, l.LoanID, l.InterestRate, c.DOB
    FROM Customers c
    JOIN Loans l ON c.CustomerID = l.CustomerID
  ) LOOP
    IF MONTHS_BETWEEN(SYSDATE, cust.DOB) / 12 > 60 THEN
      UPDATE Loans
      SET InterestRate = InterestRate - 1
      WHERE LoanID = cust.LoanID;

      DBMS_OUTPUT.PUT_LINE(' Discount applied to Loan ID ' || cust.LoanID);
    END IF;
  END LOOP;
END;
/