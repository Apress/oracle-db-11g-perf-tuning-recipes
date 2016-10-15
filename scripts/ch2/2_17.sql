SELECT
 'Task Name        : ' || f.task_name  || CHR(10) ||
 'Start Run Time   : ' || TO_CHAR(execution_start, 'dd-mon-yy hh24:mi') || chr (10) ||
 'Segment Name     : ' || o.attr2      || CHR(10) ||
 'Segment Type     : ' || o.type       || CHR(10) ||
 'Partition Name   : ' || o.attr3      || CHR(10) ||
 'Message          : ' || f.message    || CHR(10) ||
 'More Info        : ' || f.more_info  || CHR(10) ||
 '------------------------------------------------------' Advice
FROM dba_advisor_findings   f
    ,dba_advisor_objects    o
    ,dba_advisor_executions e
WHERE o.task_id   = f.task_id
AND   o.object_id = f.object_id
AND   f.task_id   = e.task_id
AND   e. execution_start > sysdate - 1
AND   e.advisor_name = 'Segment Advisor'
ORDER BY f.task_name;
