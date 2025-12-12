{{ 
  config(
    materialized='incremental',
    incremental_strategy='merge',
    tags=['dim']
  ) 
}}

with src as (
  select
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE_NUMBER,
    HIRE_DATE,
    JOB_ID,
    SALARY,
    COMMISSION_PCT,
    MANAGER_ID,
    DEPARTMENT_ID,
    LOAD_TIME
  from {{ ref('stg_employees') }}
--   {% if is_incremental() %}
--   where LOAD_TIME > (select max(LOAD_TIME) from {{ this }})
--   {% endif %}
)

select * from src