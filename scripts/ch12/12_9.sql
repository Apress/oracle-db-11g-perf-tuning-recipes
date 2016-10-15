BEGIN
  DBMS_WORKLOAD_REPOSITORY.create_baseline (
    start_snap_id => 26632,
    end_snap_id   => 26635,
    baseline_name => 'peak_baseline_apr15_11');
END;
/

select snap_id, begin_interval_time
from dba_hist_snapshot order by 1;

BEGIN
  dbms_sqltune.create_sqlset(
    sqlset_name => 'test1'
   ,description => 'STS from AWR');
END;
/

DECLARE
  base_cur dbms_sqltune.sqlset_cursor;
BEGIN
  OPEN base_cur FOR
    SELECT value(x)
    FROM table(dbms_sqltune.select_workload_repository(
      'peak_baseline_apr15_11', null, null,'elapsed_time',
      null, null, null, 15)) x;
  --
  dbms_sqltune.load_sqlset(
    sqlset_name => 'test1',
    populate_cursor => base_cur);
END;
/

DECLARE
  test_plan1 PLS_INTEGER;
BEGIN
  test_plan1 := dbms_spm.load_plans_from_sqlset(
                  sqlset_name=>'test1');
END;
/

