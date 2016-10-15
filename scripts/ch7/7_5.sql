select s.sid || ',' || s.serial# sid_serial, s.username,
     o.blocks * t.block_size / 1024 / 1024 mb_used, o.tablespace,
     o.sqladdr address, h.hash_value, h.sql_text
     from v$sort_usage o, v$session s, v$sqlarea h, dba_tablespaces t
     where o.session_addr = s.saddr
     and o.sqladdr = h.address (+)
     and o.tablespace = t.tablespace_name
     order by s.sid;


select s.sid || ',' || s.serial# sid_serial, s.username, s.osuser, p.spid,
     s.module,s.program, 
     sum (o.blocks) * t.block_size / 1024 / 1024 mb_used, o.tablespace,
     count(*) sorts
     from v$sort_usage o, v$session s, dba_tablespaces t, v$process p
     where o.session_addr = s.saddr
     and s.paddr = p.addr
     and o.tablespace = t.tablespace_name
     group by s.sid, s.serial#, s.username, s.osuser, p.spid, s.module,
     s.program, t.block_size, o.tablespace
     order by sid_serial;

