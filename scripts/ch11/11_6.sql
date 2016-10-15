BEGIN
  dbms_scheduler.set_attribute(
  name => 'SUNDAY_WINDOW',
  attribute => 'DURATION',
  value => numtodsinterval(2, 'hour'));
END;
/

SELECT window_name, to_char(start_time,'dd-mon-yy hh24:mi'), duration
FROM dba_autotask_schedule
ORDER BY start_time;







