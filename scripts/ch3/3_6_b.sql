select low_optimal_size/1024 low,
     (high_optimal_size+1)/1024 high,
     optimal_executions, onepass_executions, multipasses_executions
     from v$sql_workarea_histogram
     where total_executions !=0;

