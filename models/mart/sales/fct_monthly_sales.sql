{{config(
    materialized = 'table',
    tags=['dash_sales_bi','processing','sales','carmake']
    )}}

SELECT
    DDATE,
    ID_SALESPERSON,
    ID_CARMAKE,
    TOTAL_SALES,
    TOTAL_COMMISSIONS
FROM {{ ref('psg_monthly_sales_make')}} AS psgm
LEFT JOIN {{ ref('dim_carmake')}} AS dimsc ON psgm.CARMAKE = dimsc.CARMAKE
LEFT JOIN {{ ref('dim_salesperson')}} AS dimsp ON psgm.SALESPERSON = dimsp.SALESPERSON
