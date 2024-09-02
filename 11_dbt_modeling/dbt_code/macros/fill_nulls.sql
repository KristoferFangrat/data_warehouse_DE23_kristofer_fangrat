{%{% fill_nulls(column) %}
case
    when {{column}} is null then 'N/A'
    else {{column}}
end
  
{% endmacro %}%}