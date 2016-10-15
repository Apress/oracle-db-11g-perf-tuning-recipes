select  wait_class, name
from v$event_name
where name LIKE 'enq%'
and wait_class <> 'Other'
order by wait_class;


select a.event, a.total_waits, a.time_waited, a.average_wait
     from v$system_event a, v$event_name b, v$system_wait_class c
     where a.event_id=b.event_id
     and b.wait_class#=c.wait_class#
     and c.wait_class in ('Application','Concurrency')
     order by average_wait desc;

select a.sid, a.event, a.total_waits, a.time_waited, a.average_wait
     from v$session_event a, v$session b
     where time_waited > 0
     and a.sid=b.sid
     and b.username is not NULL
     and a.event='enq: TX - row lock contention';
 

