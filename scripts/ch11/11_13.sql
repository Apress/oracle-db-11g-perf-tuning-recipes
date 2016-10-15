SELECT
 sql_id
,elapsed_time
,cpu_time
,buffer_gets
,disk_reads
,sql_text
FROM TABLE(DBMS_SQLTUNE.SELECT_SQLSET('&&sqlset_name'));





