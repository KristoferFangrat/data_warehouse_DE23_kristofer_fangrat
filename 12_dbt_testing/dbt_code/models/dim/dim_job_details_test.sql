WITH src_job_details AS (
    SELECT * FROM {{ ref(src_job_details)}}
)

SELECT
    CASE
        WHEN typeof(scope_of_work_min) = 'integer' THEN 'pass'
        ELSE 'fail'
    END AS scope_of_work_min_type_check,
    CASE
        WHEN typeof(scope_of_work_max) = 'integer' THEN 'pass'
        ELSE 'fail'
    END AS scope_of_work_max_type_check
FROM src_job_details