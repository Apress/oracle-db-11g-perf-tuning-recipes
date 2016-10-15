DECLARE
  plan1 PLS_INTEGER;
BEGIN
  plan1 := DBMS_SPM.LOAD_PLANS_FROM_CURSOR_CACHE(
             attribute_name => 'sql_text'
            ,attribute_value => 'select emp_id from emp%');
END;
/

