select
  username
 ,obj_name
 ,to_char(timestamp,'dd-mon-yy hh24:mi') event_time
 ,substr(ses_actions,4,1)  del
 ,substr(ses_actions,7,1)  ins
 ,substr(ses_actions,10,1) sel
 ,substr(ses_actions,11,1) upd
from dba_audit_object;

