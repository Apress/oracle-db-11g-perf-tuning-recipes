select p.PID,p.SPID,s.SID
from v$process p,v$session s
where s.paddr = p.addr
and s.sid = &SESSION_ID;
