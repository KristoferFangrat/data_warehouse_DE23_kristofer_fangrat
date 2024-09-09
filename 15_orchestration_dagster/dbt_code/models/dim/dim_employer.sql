WITH src_employer AS (SELECT * FROM {{ ref('src_employer') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id', 'employer_name']) }} AS employer_id, -- noqa
    {{capitalize_first_letter ("coalesce(employer_name, 'arbetsgivare ej specificerad')")}} AS employer_name,
    {{capitalize_first_letter ("coalesce(employer_workplace, 'arbetsplats ej specificerad')")}} AS employer_workplace,
    organization_number AS organization_number,
    {{capitalize_first_letter ("coalesce(street_address, 'adress ej specificerad')")}} AS street_address,
    {{capitalize_first_letter ("coalesce(workplace_region, 'region ej specificerad')")}} AS workplace_region,
    {{capitalize_first_letter ("coalesce(workplace_postcode, 'postnummer ej specificerat')")}} AS workplace_postcode,
    {{capitalize_first_letter ("coalesce(workplace_city, 'stad ej specificerat')")}} AS workplace_city,
    {{capitalize_first_letter ("coalesce(workplace_country, 'land ej specificerat')")}} AS workplace_country
FROM src_employer
