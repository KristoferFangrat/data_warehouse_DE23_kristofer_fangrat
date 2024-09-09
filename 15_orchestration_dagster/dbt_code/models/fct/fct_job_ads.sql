WITH ja AS (SELECT  * FROM {{ ref('src_job_ads') }}),
        jd AS (SELECT  * FROM {{ ref('src_job_details') }}),
        e AS (SELECT  * FROM {{ ref('src_employer') }}),
        aa AS (SELECT * FROM {{ ref('src_auxillary_attributes')}})

SELECT 
    {{ dbt_utils.generate_surrogate_key(['ja.id', 'jd.headline'])}} AS job_details_key,
    {{ dbt_utils.generate_surrogate_key(['e.id', 'e.employer_name'])}} AS employer_key,
    {{ dbt_utils.generate_surrogate_key(['aa.id', 'aa.experience_required'])}} AS auxillary_attributes_key,
    relevance,
    vacancies,
    application_deadline,
    e.employer_name,
    jd."description",
    aa.experience_required,
    aa.driving_license_required

FROM ja
LEFT JOIN
    jd ON ja.id = jd.id
LEFT JOIN
    e ON ja.id = e.id
LEFT JOIN
    aa ON ja.id = aa.id