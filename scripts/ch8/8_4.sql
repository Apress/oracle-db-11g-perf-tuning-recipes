SELECT l.location_id, city, department_id, department_name
FROM locations l, departments d
WHERE l.location_id = d.location_id(+)
ORDER BY 1;

SELECT location_id, city, department_id, department_name
FROM locations LEFT JOIN departments d
USING (location_id)
ORDER BY 1;

SELECT last_name, first_name, department_name
FROM employees e, departments d
WHERE e.manager_id = d.manager_id(+) 
UNION
SELECT last_name, first_name, department_name
FROM employees e, departments d
WHERE e.manager_id(+) = d.manager_id 
ORDER BY department_name, last_name, first_name;

SELECT last_name, first_name, department_name
FROM employees FULL JOIN departments
USING (manager_id);

SELECT d.name, i.host_name, round(sum(f.bytes)/1048576) megabytes
FROM v$database d
CROSS JOIN v$instance i
CROSS JOIN v$datafile f
GROUP BY d.name, i.host_name;



