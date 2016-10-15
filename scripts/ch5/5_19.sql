select wait_class, event, time_waited / 100 time_secs
from v$system_event e
where e.wait_class <> 'Idle' AND time_waited > 0
union
select 'Time Model', stat_name NAME,
round ((value / 1000000), 2) time_secs
from v$sys_time_model
where stat_name NOT IN ('background elapsed time', 'background cpu time')
order by 3 desc;


select sid, username, event, blocking_session,
    seconds_in_wait, wait_time
    from v$session where state in ('WAITING');         


select wait_class_id, wait_class,
     total_waits, time_waited
     from v$session_wait_class
     where sid = <SID>;

select event, total_waits, time_waited
     from v$system_event e, v$event_name n
     where n.event_id = e.event_id
     and e.wait_class_id = 4217450380;


