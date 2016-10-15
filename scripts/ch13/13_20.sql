alter system set parallel_adaptive_multi_user=false;

begin
  dbms_resource_manager.create_pending_area();
  dbms_resource_manager.create_plan('parallel_test', 'parallel_test');
  dbms_resource_manager.create_plan_directive(
        'parallel_test',
        'OTHER_GROUPS',
        'OTHER_GROUPS directive for parallel test',
        parallel_target_percentage => 90);
  dbms_resource_manager.submit_pending_area();
end;
/

ALTER SYSTEM SET RESOURCE_MANAGER_PLAN = 'parallel_test' SID='*';

select job_name,state,comments
      from dba_scheduler_jobs
      where job_class like 'CONC%';

select job_name,elapsed_time 
     from dba_scheduler_running_jobs
     where job_name like 'ST$%';


