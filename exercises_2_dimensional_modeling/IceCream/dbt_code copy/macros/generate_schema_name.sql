{%macro generate_scheam_name(custom_schema name, node)%}
    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema}}

    {%- else -%}

        {{ custom_schema_name }}

    {%- endif -%}

{%- endmacro %}