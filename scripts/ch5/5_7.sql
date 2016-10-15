select row_wait_obj# 
     from v$session 
     where event = 'buffer busy waits';

select owner, object_name, subobject_name, object_type
     from dba_objects
     where data_object_id = &row_wait_obj;

