{{ config(materialized='table') }}

SELECT {{ dbt_utils.surrogate_key(['passenger_id', 'passenger_name', 'contact_data']) }} AS dim_customer_key,
		 passenger_id AS customer_id,
		 passenger_name AS customer_name,
		 contact_data AS customer_contact
from {{ source('bookings', 'tickets') }}
