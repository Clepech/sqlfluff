SELECT
    '{{ ts }}',
    '{{ ts_nodash_with_tz }}',
    '{{ ts_nodash }}',
    '{{ data_interval_start }}',
    '{{ dag }}',
    '{{ dag.is_subdag }}',
    '{{ task_instance }}',
    '{{ ti }}',
    '{{ task_instance.dag_id }}',
    '{{ task_instance.task_id }}',
    '{{ task_instance_key_str }}',
    '{{ dag_run }}',
    '{{ dag_run.dag_id }}',
    '{{ dag_run.run_id }}',
    '{{ dag_run.logical_date }}'
