DECLARE
 pf PLS_INTEGER;
BEGIN
  pf := dbms_spm.alter_sql_plan_baseline(
    plan_name => 'SQL_PLAN_4ayzkz0kr3g9s6afbe2b3'
   ,attribute_name => 'ENABLED'
   ,attribute_value => 'NO');
END;
/
