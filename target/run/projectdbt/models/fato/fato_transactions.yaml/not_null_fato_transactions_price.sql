select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select price
from "dbt"."main"."fato_transactions"
where price is null



      
    ) dbt_internal_test