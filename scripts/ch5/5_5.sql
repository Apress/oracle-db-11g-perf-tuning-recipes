select event, count(*) from v$session_wait
      group by event;

