-- This will extract date time related data from the field containing date time values.
SELECT *,
EXTRACT(YEAR FROM payment_date) AS year_col,
EXTRACT(MONTH FROM payment_date) AS month_col,
EXTRACT(DAY FROM payment_date) AS day_col,
EXTRACT(QUARTER FROM payment_date) AS quarter_col,
EXTRACT(WEEK FROM payment_date) AS month_col,
EXTRACT(DOW FROM payment_date) AS dow_col,
EXTRACT(DOY FROM payment_date) AS doy_col
FROM payment;
