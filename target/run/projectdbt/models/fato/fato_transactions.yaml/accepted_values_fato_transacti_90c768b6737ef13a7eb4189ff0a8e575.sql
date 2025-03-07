select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        price_greater_than_20 as value_field,
        count(*) as n_records

    from "dbt"."main"."fato_transactions"
    group by price_greater_than_20

)

select *
from all_values
where value_field not in (
    'True','False'
)



      
    ) dbt_internal_test