select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select time_of_transaction
from "dbt"."main"."fato_transactions"
where time_of_transaction is null



      
    ) dbt_internal_test