USE mydb;
DESCRIBE food_delivery_master;

SELECT
    CASE
        WHEN restaurant_preparation_time_min < 15 THEN 'Under 15 min'
        WHEN restaurant_preparation_time_min < 30 THEN '15-30 min'
        WHEN restaurant_preparation_time_min < 45 THEN '30-45 min'
        ELSE '45+ min'
    END AS preparation_group,

    COUNT(*) AS orders,

    ROUND(AVG(delivery_delay_min), 2) AS avg_delay,

    ROUND(
        SUM(late_delivery = 1) * 100.0 / COUNT(*),
        2
    ) AS late_rate

FROM food_delivery_master

GROUP BY preparation_group

ORDER BY avg_delay DESC;

SELECT
    restaurant_id,
    COUNT(*) AS total_orders,
    SUM(late_delivery = 1) AS late_orders,

    ROUND(
        SUM(late_delivery = 1) * 100.0 / COUNT(*),
        2
    ) AS late_delivery_rate

FROM food_delivery_master

GROUP BY restaurant_id

HAVING COUNT(*) >= 20

ORDER BY late_delivery_rate DESC;

SELECT
    driver_id,
    COUNT(*) AS total_deliveries,
    ROUND(AVG(delivery_delay_min), 2) AS avg_delay,
    ROUND(AVG(driver_rating), 2) AS avg_driver_rating
FROM food_delivery_master
GROUP BY driver_id
HAVING COUNT(*) >= 20
ORDER BY avg_delay DESC;

SELECT
    CASE
        WHEN customer_rating < 3 THEN 'Low Rating'
        WHEN customer_rating < 4 THEN 'Medium Rating'
        ELSE 'High Rating'
    END AS rating_group,

    COUNT(*) AS orders,

    ROUND(AVG(delivery_delay_min), 2) AS avg_delay

FROM food_delivery_master

GROUP BY rating_group

ORDER BY avg_delay DESC;

SELECT
    COUNT(*) AS total_orders,
    SUM(is_cancelled = 1) AS cancelled_orders,

    ROUND(
        SUM(is_cancelled = 1) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate

FROM food_delivery_master;

SELECT
    cancellation_reason,
    COUNT(*) AS cancellations
FROM food_delivery_master
WHERE is_cancelled = 1
GROUP BY cancellation_reason
ORDER BY cancellations DESC;

SELECT
    order_id,
    delivery_delay_min,

    CASE
        WHEN delivery_delay_min <= 0 THEN 'On Time'
        WHEN delivery_delay_min <= 10 THEN 'Slight Delay'
        WHEN delivery_delay_min <= 30 THEN 'Moderate Delay'
        ELSE 'Severe Delay'
    END AS calculated_delay_category

FROM food_delivery_master;

SELECT
    restaurant_id,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_delay_min), 2) AS avg_delay,

    RANK() OVER (
        ORDER BY AVG(delivery_delay_min) DESC
    ) AS delay_rank

FROM food_delivery_master

GROUP BY restaurant_id;

SELECT
    restaurant_id,
    AVG(delivery_delay_min) AS avg_delay,

    DENSE_RANK() OVER (
        ORDER BY AVG(delivery_delay_min) DESC
    ) AS delay_rank

FROM food_delivery_master

GROUP BY restaurant_id;

WITH daily_delay AS (

    SELECT
        order_date,
        AVG(delivery_delay_min) AS avg_delay

    FROM food_delivery_master

    GROUP BY order_date

)


SELECT
    order_date,
    ROUND(avg_delay, 2) AS avg_delay,
    ROUND(
        LAG(avg_delay) OVER (
            ORDER BY order_date
        ),
        2
    ) AS previous_day_delay
FROM daily_delay
ORDER BY order_date;

SELECT
    restaurant_name,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_delay_min), 2) AS avg_delay,
    ROUND(
        SUM(late_delivery = 1) * 100.0 / COUNT(*),
        2
    ) AS late_delivery_rate
FROM food_delivery_master
GROUP BY restaurant_name
ORDER BY late_delivery_rate DESC;

SELECT
    restaurant_name,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_delay_min), 2) AS avg_delay,
    ROUND(
        SUM(late_delivery = 1) * 100.0 / COUNT(*),
        2
    ) AS late_delivery_rate
FROM food_delivery_master
GROUP BY restaurant_name
HAVING COUNT(*) >= 20
ORDER BY late_delivery_rate DESC;

SELECT
    driver_id,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_delay_min), 2) AS avg_delay,
    ROUND(
        SUM(late_delivery = 1) * 100.0 / COUNT(*),
        2
    ) AS late_delivery_rate
FROM food_delivery_master
GROUP BY driver_id
HAVING COUNT(*) >= 20
ORDER BY late_delivery_rate DESC;

SELECT
    customer_rating,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_delay_min), 2) AS avg_delay,
    ROUND(
        SUM(late_delivery = 1) * 100.0 / COUNT(*),
        2
    ) AS late_delivery_rate
FROM food_delivery_master
GROUP BY customer_rating
ORDER BY customer_rating;

SELECT
    cancellation_reason,
    COUNT(*) AS cancellations
FROM food_delivery_master
WHERE cancellation_reason IS NOT NULL
GROUP BY cancellation_reason
ORDER BY cancellations DESC;

SELECT
    COUNT(*) AS total_orders,
    SUM(cancellation_reason IS NOT NULL) AS cancelled_orders,
    ROUND(
        SUM(cancellation_reason IS NOT NULL) * 100.0 / COUNT(*),
        2
    ) AS cancellation_rate
FROM food_delivery_master;

SELECT
    restaurant_id,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_delay_min), 2) AS avg_delay,
    RANK() OVER (
        ORDER BY AVG(delivery_delay_min) DESC
    ) AS delay_rank
FROM food_delivery_master
GROUP BY restaurant_id;

SELECT
    restaurant_id,
    ROUND(
        SUM(late_delivery = 1) * 100.0 / COUNT(*),
        2
    ) AS late_rate,
    DENSE_RANK() OVER (
        ORDER BY
        SUM(late_delivery = 1) * 100.0 / COUNT(*) DESC
    ) AS late_rate_rank
FROM food_delivery_master
GROUP BY restaurant_id;

SELECT
    restaurant_id,
    COUNT(*) AS total_orders,
    ROUND(AVG(delivery_delay_min), 2) AS avg_delay,
    ROUND(
        SUM(CASE WHEN delivery_delay_min > 0 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS late_rate
FROM food_delivery_master
GROUP BY restaurant_id
HAVING COUNT(*) > 50
ORDER BY late_rate DESC;

WITH r AS (
    SELECT restaurant_id, COUNT(*) total_orders,
           AVG(delivery_delay_min) avg_delay,
           SUM(late_delivery=1)*100.0/COUNT(*) late_rate
    FROM food_delivery_master
    GROUP BY restaurant_id
)
SELECT restaurant_id, total_orders,
       ROUND(avg_delay,2) avg_delay,
       ROUND(late_rate,2) late_rate
FROM r
WHERE total_orders >= 20
ORDER BY late_rate DESC;

WITH d AS (
    SELECT order_date, AVG(delivery_delay_min) avg_delay
    FROM food_delivery_master
    GROUP BY order_date
)
SELECT order_date,
       ROUND(avg_delay,2) avg_delay,
       ROUND(AVG(avg_delay) OVER(
           ORDER BY order_date
           ROWS 6 PRECEDING
       ),2) seven_day_avg
FROM d
ORDER BY order_date;

WITH r AS (
    SELECT restaurant_id,
           COUNT(*) orders,
           SUM(late_delivery=1)*100.0/COUNT(*) late_rate
    FROM food_delivery_master
    GROUP BY restaurant_id
)
SELECT restaurant_id, orders,
       ROUND(late_rate,2) late_rate
FROM r
WHERE orders >= 20
ORDER BY late_rate DESC;