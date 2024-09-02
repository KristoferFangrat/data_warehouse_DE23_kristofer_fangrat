WITH src_employer AS (SELECT * FROM {{ ref('src_employer') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['id', 'employer_name']) }} AS employer_id, -- noqa
    {{ capitalize_first_letter("coalesce(workplace_city, 'stad ej specificerat')") }} AS workplace_city, -- noqa: TMP
    {{ capitalize_first_letter("coalesce(employer_name, 'arbetsgivare ej specificerad')")}} AS employer_name
        {# TODO: finish this dimensional model #} -- noqa
    {{capitalize_first_letter("coalesce(employer_workplace, 'arbetsplats ej specificerad')") }} AS workplace_name,
    {{capitalize_first_letter("coalesce(street_address, 'arbetsplats ej specificerad')") }} AS street_address,
    {{capitalize_first_letter("coalesce(workplace_country, 'Land ej specificerat')") }} AS workplace_country,
    {{capitalize_first_letter("coalesce(workplace_country_code, 'Landkod ej specificerad')")}} AS workplace_country_code
FROM src_employer