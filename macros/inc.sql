{% macro inc() %}

   where load_time > (select max(load_time) from {{this}})
    
{% endmacro %}