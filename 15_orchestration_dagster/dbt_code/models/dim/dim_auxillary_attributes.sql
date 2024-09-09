WITH src_auxillary_attributes AS (SELECT * FROM {{ ref('src_auxillary_attributes') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id']) }} AS auxillary_attributes_id,
    {{capitalize_first_letter('experience_required')}} AS experience_required,
    {{capitalize_first_letter('driving_license_required')}} AS driving_license_required,
    {{capitalize_first_letter('access_to_own_car')}} AS access_to_own_car
FROM src_auxillary_attributes