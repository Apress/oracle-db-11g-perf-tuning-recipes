select a.value, s.username,s.sid,s.serial#,s.program,s.inst_id
     from gv$sesstat a,gv$statname b,gv$session s
     where a.statistic# = b.statistic# and s.sid=a.sid
     and b.name='opened cursors current'

select saddr, sid, user_name, address,hash_value,sql_id, sql_text
     from gv$open_cursor
     where sid in 
     (select sid from v$open_cursor
     group by sid having count(*)  > &threshold);


select sql_id,substr(sql_text,1,50) sql_text, count(*) 
     from gv$open_cursor where sid=81
     group by sql_id,substr(sql_text,1,50)
     order by sql_id;

select max(value) from v$sesstat
where statistic# in (select statistic# from v$statname
where name = 'session cursor cache count');

select a.value,s.username,s.sid,s.serial#
from v$sesstat a, v$statname b,v$session s
where a.statistic#=b.statistic# and s.sid=a.sid
and b.name='session cursor cache count';

