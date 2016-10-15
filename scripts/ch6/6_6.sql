SELECT *
FROM
(SELECT
  parsing_schema_name
 ,direct_writes
 ,SUBSTR(sql_text,1,75)
 ,disk_reads
FROM v$sql
ORDER BY disk_reads DESC)
WHERE rownum < 20;
--
SELECT
 username
,program
,machine
,sql_id
FROM v$session
WHERE event LIKE 'db file%read';
--
SELECT
 object_name
,object_type
,owner
FROM v$session   a
    ,dba_objects b
WHERE a.event LIKE 'db file%read'
AND   b.data_object_id = a.row_wait_obj#;

