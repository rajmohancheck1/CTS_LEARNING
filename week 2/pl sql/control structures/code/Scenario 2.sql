SET SERVEROUTPUT ON;

BEGIN
  FOR cust IN (SELECT CustomerID, Balance FROM Customers) LOOP
    IF cust.Balance > 10000 THEN
      UPDATE Customers
      SET IsVIP = 'Y'
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE(' Customer ' || cust.CustomerID || ' is now VIP');
    END IF;
  END LOOP;
END;
/