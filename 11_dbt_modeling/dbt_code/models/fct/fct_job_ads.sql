WITH ja AS (SELECT  * FROM {{ ref('src_job_ads') }}),
        jd AS (SELECT  * FROM {{ ref('src_job_details') }}),
        e AS (SELECT  * FROM {{ ref('src_employer') }})

SELECT 
    {{ dbt_utils.generate_surrogate_key(['ja.id', 'jd.headline'])}} AS job_details_key,
    {{ dbt_utils.generate_surrogate_key(['e.id', 'e.employer_name'])}} AS employer_key,
    relevance,
    vacancies,
    application_deadline,
    e.employer_name,
    jd."Description"
FROM ja
LEFT JOIN
    jd ON ja.id = jd.id
LEFT JOIN
    e ON ja.id = e.id