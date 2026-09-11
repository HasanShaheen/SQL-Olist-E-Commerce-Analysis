# to find out sum to total revenue and avg reveiew score for each tier of sellers
WITH sellersbuckets AS (
    -- Step 1: Your exact first query (The raw data)
    SELECT 
        o.seller_id,
        SUM(o.price) AS total_revenue,
        AVG(orv.review_score) AS avg_review_score
    FROM order_items o
    JOIN order_reviews orv ON o.order_id = orv.order_id
    GROUP BY o.seller_id
),
seller_tiers AS (
    -- Step 2: Your exact second query (Adding the tiers)
    -- Notice how we just string them together!
    SELECT
        seller_id,
        total_revenue,
        avg_review_score,
        NTILE(4) OVER (ORDER BY total_revenue DESC) AS seller_tier
    FROM sellersbuckets
)
select 
	seller_tier,
    sum(total_revenue),
    avg(avg_review_score)
from seller_tiers
group by seller_tier
order by seller_tier;
  
  
  
# to find out sellers in tier group 1  
WITH sellersbuckets AS (
    -- Step 1: Your exact first query (The raw data)
    SELECT 
        o.seller_id,
        SUM(o.price) AS total_revenue,
        AVG(orv.review_score) AS avg_review_score
    FROM order_items o
    JOIN order_reviews orv ON o.order_id = orv.order_id
    GROUP BY o.seller_id
),
seller_tiers AS (
    -- Step 2: Your exact second query (Adding the tiers)
    -- Notice how we just string them together!
    SELECT
        seller_id,
        total_revenue,
        avg_review_score,
        NTILE(4) OVER (ORDER BY total_revenue DESC) AS seller_tier
    FROM sellersbuckets
)
SELECT 
    seller_id,
    total_revenue,
    avg_review_score
FROM seller_tiers
WHERE seller_tier = 1;
