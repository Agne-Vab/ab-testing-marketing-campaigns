WITH sales as (
  SELECT
    promotion,
    location_id,
    ROUND(SUM(sales_in_thousands), 2) as total_sales
  FROM `tc-da-1.turing_data_analytics.wa_marketing_campaign`
  GROUP BY promotion, location_id
  ORDER BY promotion
)


SELECT
  promotion,
  COUNT(location_id) total_locations,
  ROUND(AVG(total_sales), 2) as average_sales,
  ROUND(STDDEV(total_sales), 4)  std_dev
FROM sales
GROUP BY promotion
ORDER BY promotion