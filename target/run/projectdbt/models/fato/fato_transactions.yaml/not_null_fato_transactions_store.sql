select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select store
from "dbt"."main"."fato_transactions"
where store is null



      
    ) dbt_internal_test