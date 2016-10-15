select to_char(h.sample_time, 'HH24:MI:SS') TIME,h.session_id,
     decode(h.session_state, 'WAITING' ,h.event, h.session_state) STATE,     
     h.sql_id,
     h.blocking_session BLOCKER
     from v$active_session_history h, dba_users u
     where u.user_id = h.user_id
     and h.sample_time > SYSTIMESTAMP-(2/1440);


select sample_time, event, wait_time
     from v$active_session_history
     where session_id = 81
     and session_serial# = 422;


select sql_text, application_wait_time
     from v$sql
     where sql_id in ( select sql_id from v$active_session_history
     where sample_time =  '08-MAR-11 05.00.52.00 PM'
     and session_id = 68 and session_serial# = 422);

