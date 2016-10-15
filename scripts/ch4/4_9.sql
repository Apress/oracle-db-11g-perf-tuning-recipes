exec DBMS_WORKLOAD_REPOSITORY.create_baseline_template( -
    day_of_week          => 'WEDNESDAY', -
    hour_in_day          => 0, -
    duration             => 6, -
    start_time           => '2011-06-14:00:00:00', -
    end_time             => '2011-06-14:06:00:00', -
    baseline_name_prefix => 'Batch Baseline ', -
    template_name        => 'Batch Template', -
    expiration           => 365);

