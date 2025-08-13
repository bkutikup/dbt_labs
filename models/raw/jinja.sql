{% set var_name = 'KSR'%}

select '{{var_name}}' as Name

select '{{var("var_name_global")}}' as Name