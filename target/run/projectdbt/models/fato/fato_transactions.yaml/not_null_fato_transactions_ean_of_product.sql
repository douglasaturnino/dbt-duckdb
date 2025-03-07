select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ean_of_product
from "dbt"."main"."fato_transactions"
where ean_of_product is null



      
    ) dbt_internal_test