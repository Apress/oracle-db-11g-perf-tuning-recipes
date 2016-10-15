SET LINESIZE 80 PAGESIZE 0 LONG 100000
SELECT DBMS_AUTO_SQLTUNE.REPORT_AUTO_TUNING_TASK FROM DUAL;

VARIABLE tune_report CLOB;
BEGIN
  :tune_report := DBMS_AUTO_SQLTUNE.report_auto_tuning_task(
    begin_exec   => NULL
   ,end_exec     => NULL
   ,type         => DBMS_AUTO_SQLTUNE.type_text
   ,level        => DBMS_AUTO_SQLTUNE.level_typical
   ,section      => DBMS_AUTO_SQLTUNE.section_all
   ,object_id    => NULL
   ,result_limit => NULL);
END;
/
--
SET LONG 1000000
PRINT :tune_report




