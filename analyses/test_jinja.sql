SELECT *
FROM {{ref('stg_sales_data_2020')}}
{%if target.name != 'production_autos'%}
LIMIT 10
{% endif %}