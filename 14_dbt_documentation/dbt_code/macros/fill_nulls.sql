{%{% fill_nulls(column) %}
case
    when {{column}} is 0 then 'N/A'
    else {{column}}
end
  
{% endmacro %}%}