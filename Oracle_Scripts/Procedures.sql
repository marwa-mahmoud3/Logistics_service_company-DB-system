/** 1 **/
CREATE or Replace PROCEDURE GetStorageExamination(keyword in nvarchar2)
AS
  c1 SYS_REFCURSOR;  
BEGIN

  open c1 for
  SELECT DISTINCT STORE_NAME , Product_Classification 
  FROM STORAGE
    Where examination = keyword;

  DBMS_SQL.RETURN_RESULT(c1);
END;

EXEC GetStorageExamination ('unpass');

/** 2 **/

CREATE OR REPLACE PROCEDURE updateCustomer(
	   p_userid IN CUSTOMERS.CUSTOMER_ID%TYPE,
	   p_username IN CUSTOMERS.FIRST_NAME%TYPE)
IS
BEGIN

  UPDATE CUSTOMERS SET FIRST_NAME = p_username where CUSTOMER_ID = p_userid;
  
  COMMIT;

END;

EXEC updateCustomer (1,'Sama');