SELECT name , value
FROM v$sysstat
WHERE name LIKE '%Parallel%';

SELECT * FROM v$pq_sysstat
WHERE statistic LIKE 'Server%';

