WITH stg_job_ads AS (SELECT * FROM {{ source('job_ads', 'stg_data_ads') }})

SELECT
    id,
    experience_required AS experience_required,
    driving_license_required AS driving_license_required,
    access_to_own_car AS access_to_own_car
FROM stg_job_ads