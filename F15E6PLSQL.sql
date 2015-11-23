#file with all PL/SQL code used in APEX



#from create new rfe section
DECLARE
 active VARCHAR2(1);
BEGIN
  select emp_status into active from F15E6_EMP where emp_id = :P2_EMP;
  IF active = 'I' THEN
    return false;
  ELSE
    return true;
  END IF;
END;



#from admin approver report
DECLARE
 counter NUMBER;
 counter2 NUMBER;
 admin VARCHAR2(1);
 req NUMBER;
 lab NUMBER;
BEGIN
  select count(*) into counter from F15E6_Approver where F15E6_EMP_EMP_id = :P2_EMP;
  select admin_flag into admin from F15E6_EMP where EMP_id = :P2_EMP;
  select count(*) into counter2 from F15E6_RFE where F15E6_STATUS_STATUS_ID = 102;

  IF counter > 0 and admin = 'Y' and counter2 > 0  THEN
    return true;
  ELSE
    return false;
  END IF;
END;



#from lab director report
DECLARE
 counter NUMBER;
 labdir VARCHAR2(1);
 counter2 NUMBER;
BEGIN
  select count(*) into counter2 from F15E6_RFE where F15E6_STATUS_STATUS_ID = 106;
  select count(*) into counter from F15E6_Approver where F15E6_EMP_EMP_id = :P2_EMP;
  select labdir_flag into labdir from F15E6_EMP where EMP_id = :P2_EMP;
  IF counter > 0 and labdir = 'Y' and counter2 > 0 THEN
    return true;
  ELSE
    return false;
  END IF;
END;



#from chair approval report 
DECLARE
 counter NUMBER;
 chair VARCHAR2(1);
 counter2 NUMBER;
BEGIN
  select count(*) into counter2 from F15E6_RFE where F15E6_STATUS_STATUS_ID = 107;
  select count(*) into counter from F15E6_Approver where F15E6_EMP_EMP_id = :P2_EMP;
select chair_flag into chair from F15E6_EMP where EMP_id = :P2_EMP;
  IF counter > 0 and chair = 'Y' and counter2 > 0THEN
    return true;
  ELSE
    return false;
  END IF;
END;



#from execdir approval report 
DECLARE
 counter NUMBER;
 execdir VARCHAR2(1);
 counter2 NUMBER;
BEGIN
  select count(*) into counter2 from F15E6_RFE where F15E6_STATUS_STATUS_ID = 108;
  select count(*) into counter from F15E6_Approver where F15E6_EMP_EMP_id = :P2_EMP;
select execdir_flag into execdir from F15E6_EMP where EMP_id = :P2_EMP;
  IF counter > 0 and execdir = 'Y' and counter2 > 0 THEN
    return true;
  ELSE
    return false;
  END IF;
END;



#from requestor report (next few blocks of code)
DECLARE
 counter NUMBER;
BEGIN
  select count(*) into counter from F15E6_RFE where F15E6_EMP_EMP_id = :P2_EMP;
  IF counter > 0 THEN
    return true;
  ELSE
    return false;
  END IF;
END;

DECLARE
 auth NUMBER;
 counter NUMBER;
BEGIN
  select count(*) into counter from F15E6_RFE where F15E6_EMP_EMP_id = :P2_EMP;
  select F15E6_AUTH_AUTH_ID into auth from F15E6_EMP where emp_id = :P2_EMP;
  IF auth = 102 AND counter = 0 THEN
    return false;
  ELSE
    return true;
  END IF;
END;

DECLARE
 auth NUMBER;
 counter NUMBER;
BEGIN
  select count(*) into counter from F15E6_RFE where F15E6_EMP_EMP_id = :P2_EMP;
  select F15E6_AUTH_AUTH_ID into auth from F15E6_EMP where emp_id = :P2_EMP;
  IF auth = 102 AND counter = 0 THEN
    return false;
  ELSE
    return true;
  END IF;
END;

DECLARE
 auth NUMBER;
 counter NUMBER;
BEGIN
  select count(*) into counter from F15E6_RFE where F15E6_EMP_EMP_id = :P2_EMP;
  select F15E6_AUTH_AUTH_ID into auth from F15E6_EMP where emp_id = :P2_EMP;
  IF auth = 102 AND counter = 0 THEN
    return false;
  ELSE
    return true;
  END IF;
END;



#from all contact report
DECLARE
 counter NUMBER;
BEGIN
  select count(*) into counter from F15E6_Contact where F15E6_EMP_EMP_id = :P2_EMP;
  IF counter > 0 THEN
    return true;
  ELSE
    return false;
  END IF;
END;



#from all rfe report
DECLARE
 auth NUMBER;
BEGIN
  select F15E6_AUTH_AUTH_ID into auth from F15E6_EMP where emp_id = :P2_EMP;
  IF auth = 102 THEN
    return false;
  ELSE
    return true;
  END IF;
END;



#from all comment report
DECLARE
 auth NUMBER;
BEGIN
  select F15E6_AUTH_AUTH_ID into auth from F15E6_EMP where emp_id = :P2_EMP;
  IF auth = 102 THEN
    return false;
  ELSE
    return true;
  END IF;
END;



#from all doc report
DECLARE
 auth NUMBER;
BEGIN
  select F15E6_AUTH_AUTH_ID into auth from F15E6_EMP where emp_id = :P2_EMP;
  IF auth = 102 THEN
    return false;
  ELSE
    return true;
  END IF;
END;



#from stat history report
DECLARE
 auth NUMBER;
BEGIN
  select F15E6_AUTH_AUTH_ID into auth from F15E6_EMP where emp_id = :P2_EMP;
  IF auth = 102 THEN
    return false;
  ELSE
    return true;
  END IF;
END;



#from requestor edit link
DECLARE
 counter NUMBER;
BEGIN
  select count(*) into counter from F15E6_RFE where F15E6_EMP_EMP_id = :P2_EMP;
  IF counter > 0 THEN
    return true;
  ELSE
    return false;
  END IF;
END;



#from all edit links
DECLARE
 auth NUMBER;
 status NUMBER;
BEGIN
  select F15E6_AUTH_AUTH_ID into auth from F15E6_EMP where emp_id = :P2_EMP;

  IF auth = 101 OR auth = 102 THEN
    return false;
  ELSE
    return true;
  END IF;
END;
