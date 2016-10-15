SELECT
 'Task Name        : ' || f.task_name  || chr(10) ||
 'Segment Name     : ' || o.attr2      || chr(10) ||
 'Segment Type     : ' || o.type       || chr(10) ||
 'Partition Name   : ' || o.attr3      || chr(10) ||
 'Message          : ' || f.message    || chr(10) ||
 'More Info        : ' || f.more_info TASK_ADVICE
FROM dba_advisor_findings f
    ,dba_advisor_objects  o
WHERE o.task_id   = f.task_id
AND   o.object_id = f.object_id
ORDER BY f.task_name;
