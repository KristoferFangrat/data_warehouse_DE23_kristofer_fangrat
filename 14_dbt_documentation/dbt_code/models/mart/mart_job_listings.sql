WITH fct_job_ads AS (
    SELECT * FROM {{ ref('fct_job_ads') }}
),

job_details AS (SELECT * FROM {{ ref('dim_job_details') }}),

employer AS (SELECT * FROM {{ ref('dim_employer') }}),

auxillary_attributes AS (SELECT * FROM {{ ref('dim_auxillary_attributes')}})


SELECT
    jd.headline,
    f.vacancies,
    jd.salary_type,
    f.relevance,
    e.employer_name,
    e.workplace_city,
    jd."description",
    jd.description_html_formatted,
    jd.duration,
    jd.scope_of_work_min,
    jd.scope_of_work_max,
    f.application_deadline,
    aa.experience_required,
    aa.driving_license_required
FROM fct_job_ads AS f
LEFT JOIN job_details AS jd
    ON f.job_details_key = jd.job_details_id
LEFT JOIN employer AS e
    ON f.employer_key = e.employer_id
LEFT JOIN auxillary_attributes AS aa
    ON f.auxillary_attributes_key = aa.auxillary_attributes_id