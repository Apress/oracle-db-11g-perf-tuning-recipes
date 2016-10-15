select sum(d.bytes) "undo"
from v$datafile d,
v$tablespace t,
dba_tablespaces s
where s.contents = 'UNDO'
and s.status = 'ONLINE'
and t.name = s.tablespace_name
and d.ts# = t.ts#;

select max(undoblks/((end_time-begin_time)*3600*24))
"UNDO_BLOCK_PER_SEC"
FROM v$undostat;

select to_char(begin_time,'hh24:mi:ss') BEGIN_TIME,
to_char(end_time,'hh24:mi:ss') END_TIME,
maxquerylen,nospaceerrcnt,tuned_undoretention
from v$undostat;


