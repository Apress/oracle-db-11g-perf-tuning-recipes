select sid, serial#, username from v$session;

execute dbms_monitor.session_trace_enable(session_id=>138,serial_num=>242,waits=>true,binds=>false);
