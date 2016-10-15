select decode(request,0,'Holder: ','Waiter: ')||sid sess, 
     id1, id2, lmode, request, type
     from v$lock
     where (id1, id2, type) in
     (select id1, id2, type from v$lock where request>0)
     order by id1, request;  

