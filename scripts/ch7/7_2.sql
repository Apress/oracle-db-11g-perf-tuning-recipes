select s.sql_text from v$sql s, v$undostat u
     where u.maxqueryid=s.sql_id;

select s.sid, s.username, t.used_urec, t.used_ublk
     from v$session s, v$transaction t
     where s.saddr = t.ses_addr
     order by t.used_ublk desc;

select s.sid, t.name, s.value
    from v$sesstat s, v$statname t
    where s.statistic# = t.statistic#
    and t.name = 'undo change vector size'
    order by s.value desc;

select sql.sql_text sql_text, t.USED_UREC Records, t.USED_UBLK Blocks,
(t.USED_UBLK*8192/1024) KBytes from v$transaction t,
  2  v$session s,
  3  v$sql sql
  4  where t.addr = s.taddr
  5  and s.sql_id = sql.sql_id
  6* and s.username ='&USERNAME'

