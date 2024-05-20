WITH first_session AS (
  SELECT*
  FROM (
    SELECT
      a1.*,
      ROW_NUMBER() OVER (PARTITION BY user ORDER BY first_session_date ASC) SessionOrder
    FROM (
      SELECT
        t1.user,
        t1.session,
        MIN(event_date) first_session_date,
      FROM DATA.FUNNEL t1
      GROUP BY   
        t1.user,
        t1.session
    ) a1
  ) a2
  WHERE SessionOrder = 1
), first_session_viewed_products AS (
  SELECT
    df.user,
    MIN(event_date) first_session_date
  FROM `DATA.FUNNEL` df
  INNER JOIN first_session fs
    ON df.session = fs.session
  WHERE df.session NOT IN (
    SELECT DISTINCT
      session 
    FROM `DATA.FUNNEL` so
    WHERE event_type IN ('add_to_cart','order')
    )
  GROUP BY df.user
), one_product_basket AS (
  SELECT
    user,
    COUNT(*) total_basket_products
  FROM `DATA.FUNNEL` df
  WHERE event_type = 'add_to_cart'
  GROUP BY user
  HAVING COUNT(*) = 1
), order_date_within_2_days AS (
  SELECT
    a1.user,
    fs.first_session_date,
    a1.first_order_date,
    DATE_DIFF(a1.first_order_date, fs.first_session_date, DAY) days
  FROM (
    SELECT
      user,
      MIN(event_date) AS first_order_date
    FROM `DATA.FUNNEL` df
    WHERE event_type = 'order'
    GROUP BY   user
  ) a1
  INNER JOIN first_session_viewed_products fs
    ON fs.user = a1.user
  WHERE DATE_DIFF(a1.first_order_date, fs.first_session_date, DAY) <= 2
)
SELECT
  DATE(od.first_order_date) date,
  COUNT(DISTINCT df.user) number_of_client
FROM `DATA.FUNNEL` df
INNER JOIN first_session_viewed_products fs
  ON df.user = fs.user
INNER JOIN one_product_basket opb
  ON opb.user = fs.user
INNER JOIN order_date_within_2_days od
  ON od.user = fs.user
GROUP BY DATE(od.first_order_date)