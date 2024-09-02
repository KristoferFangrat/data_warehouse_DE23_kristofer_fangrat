WITH src_employer AS (SELECT * FROM {{ ref('src_employer') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id', 'employer_name']) }} AS employer_id, -- noqa
    {{ capitalize_first_letter("coalesce(workplace_city, 'stad ej specificerat')") }} AS workplace_city,
    {{ capitalize_first_letter("coalesce(street_address, 'arbetsplats address ej specificerad')") }} AS street_address,
    {{capitalize_first_letter("coalesce(workplace_postcode, 'postnummer ej specificerat')")}} AS workplace_postcode,-- noqa: TMP
    {{ capitalize_first_letter("coalesce(employer_name, 'arbetsgivare ej specificerad')") }} AS employer_name, -- noqa
    {# TODO: finish this dimensional model #}
    {{ capitalize_first_letter("coalesce(employer_workplace, 'arbetsplats ej specificerad')") }} AS workplace_name,
    {{ dbt_utils.generate_surrogate_key(['workplace_country', 'workplace_country_code'])}} AS country_id,
    {{capitalize_first_letter("coalesce(workplace_country, 'land ej specificerat')")}} AS country_name,
    {{capitalize_first_letter("coalesce(workplace_country_code, 'landskod ej specificerad')")}} AS country_code,
    coalesce(organization_number, 'organisationsnummer ej specificerat') AS organization_number
FROM src_employer
WHERE workplace_city = 'Stockholm'
ORDER BY employer_name ASC
