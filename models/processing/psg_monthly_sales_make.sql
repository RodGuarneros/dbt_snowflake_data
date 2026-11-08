{{
    config(
        materialized='table',
        tags=['processing', 'sales', 'carmake']
    )
}}

SELECT 
DATE_TRUNC('MONTH',DDATE) AS DDATE,
SALESPERSON,
CARMAKE,
SUM(SALEPRICE-COMEA)  AS TOTAL_SALES,
SUM(COMEA) AS TOTAL_COMMISSIONS
FROM {{ ref( 'stg_sales_data_2020') }}
GROUP BY DATE_TRUNC('MONTH', DDATE), SALESPERSON, CARMAKE
