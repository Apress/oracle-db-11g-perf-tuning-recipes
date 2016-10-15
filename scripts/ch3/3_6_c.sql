select name profile, cnt, decode(total, 0, 0, round(cnt*100/total)) percentage
    from (SELECT name, value cnt, (sum(value) over ()) total
    from V$SYSSTAT 
    where name like 'workarea exec%');

