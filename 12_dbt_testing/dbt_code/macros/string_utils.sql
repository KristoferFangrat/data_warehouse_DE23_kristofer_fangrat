{% {% macro capitalize_first_letter(column) %}
case
    when {{ column }} is null then null
    else upper(substring({{column}}, 1, 1)) || lower(substring({{column}}, 2))
end
{% endmacro %}%}