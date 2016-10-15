select optimal_count, round(optimal_count*100/total, 2) optimal_perc,
 onepass_count, round(onepass_count*100/total, 2) onepass_perc,
 multipass_count, round(multipass_count*100/total, 2) multipass_perc
 from
 (select decode(sum(total_executions), 0, 1, sum(total_executions)) total,
 sum(OPTIMAL_EXECUTIONS) optimal_count,
 sum(ONEPASS_EXECUTIONS) onepass_count,
 sum(MULTIPASSES_EXECUTIONS) multipass_count
from  v$sql_workarea_histogram
where low_optimal_size > (64*1024));

