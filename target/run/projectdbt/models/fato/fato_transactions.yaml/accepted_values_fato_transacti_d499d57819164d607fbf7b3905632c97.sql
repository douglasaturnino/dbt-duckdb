select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        periodo_do_dia as value_field,
        count(*) as n_records

    from "dbt"."main"."fato_transactions"
    group by periodo_do_dia

)

select *
from all_values
where value_field not in (
    'Manhã','Meio Dia','Noite'
)



      
    ) dbt_internal_test