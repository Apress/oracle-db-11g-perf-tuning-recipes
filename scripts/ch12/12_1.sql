DECLARE
  tune_sql  CLOB;
  tune_task VARCHAR2(30);
BEGIN
  tune_sql := 'select count(*) from mgmt_db_feature_usage_ecm2';
  tune_task := DBMS_SQLTUNE.CREATE_TUNING_TASK(
    sql_text   => tune_sql
   ,user_name  => 'STAGING'
   ,scope      => 'COMPREHENSIVE'
   ,time_limit => 60
   ,task_name  => 'TUNE1'
   ,description => 'Calling SQL Tuning Advisor for one statement'
);
END;
/

set long 10000
set longchunksize 10000
set lines 132
set pages 200
select dbms_sqltune.report_tuning_task('TUNE1') from dual;

begin
-- This is the code from the SQL Tuning Advisor
dbms_sqltune.accept_sql_profile(
    task_name => 'TUNE1',
    task_owner => 'SYS',
    replace => TRUE,
    profile_type => DBMS_SQLTUNE.PX_PROFILE);
--
end;
/



