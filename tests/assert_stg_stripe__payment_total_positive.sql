-- Singular (Custom test) for payment module
-- this query will only return values if the total_amount < 0 => test fail
select
    order_id,
    sum(amount) as total_amount
from {{ ref('stg_stripe__payments') }}
group by 1
having total_amount < 0