select event, average_wait from v$system_event 
       where event like 'db file s%read';

