EXEC DBMS_SQLPA.EXECUTE_ANALYSIS_TASK(task_name=>:g_task,execution_type=>'COMPARE PERFORMANCE',execution_name=>'compare change',execution_params => dbms_advisor.arglist('comparison_metric','buffer_gets')); 

set long 100000 longchunksize 100000 linesize 200 head off feedback off echo off 
spool compare_report.txt 

SELECT DBMS_SQLPA.REPORT_ANALYSIS_TASK(:g_task, 'TEXT', 'CHANGED_PLANS', 'ALL')
FROM DUAL;

