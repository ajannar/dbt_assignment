Welcome!

# About project

This dbt project contains transformed data models for following datasets:
 - Employees: An Indian MNC has taken over a small software company with around 15 employees.
    The software company has provided the csv files of Employees details and their organisation structure.

 - Target: Target is a globally renowned brand and a prominent retailer in the United States.
    The dataset offers a comprehensive view of various dimensions including the order status, price, payment and freight performance, customer location, product attributes, and customer reviews.

2 type of models have been created for each dataset:
 - stg_models: staging models to stage only required data/data columns from source tables.
 - final_models: final models that represent data models to be used by end users.

# List of models created in this project

   - Employees dataset:
      Staging models:
      - stg_departments: details about departments
      - stg_employees: details about employees
      - stg_job_history: details about employee's job history
      - stg_locations: details about locations

      Final models:
      - managers: details about managers dept and employees working under them
      - resigned_employees: employees who have resigned
      - second_highest_salary_dept: second highest salary of each department
      - years_worked_emp: total working years of employees


   - Target dataset:
      Staging models:
      - stg_customers: details about customers
      - stg_geolocation: details about geolocation
      - stg_order_items: details about items in order
      - stg_orders: details about orders
      - stg_payments: details about payment made for order

      Final models:
      - actual_and_esimated_minus_actual_delivery_time: actual delivery time and difference b/w esimated and actual delivery_time
      - count_of_customers_across_states: total number of customers in each state
      - count_of_diff_payments_methods_month_over_month: count of payment methods used in ordes  across months
      - month_over_month_order_count_across_states: total number of orders in each month in each state
      - order_cost_percentage_increase_year_over_year: %age increase in total cost of orders across years
      - order_count_based_on_number_of_installments: total number of orders across number of installments
      - order_count_by_time_of_day: number of orders placed during different times of day
      - 5_states_with_highest_avg_freight_value_and_their_avg_delivery_time: top 5 states with average freight value along with average delivery time
      - 5_states_with_lowest_avg_freight_value_and_their_avg_delivery_time: bottom 5 states with average freight value along with average delivery time
      - time_range_between_first_and_last_order: difference between time of first and last order
      - top_5_states_with_fastest_delivery: top 5 states with fastest delivery
      - total_and_avg_order_price_and_freight_value_across_states: total and average price, freight value of orders in each state
      - total_count_of_cities_and_states: total number of states and cities
      - year_over_year_order_count: total number of orders placed in each year

# List of macros used in the project
   - date_difference: macro to find difference in between two dates in terms of year/month/days
   - extract_from_timestamp: macro to extract part from timestamp i.e day/month/year
   - precision: macro to round float values to 2 decimal points
   - dollars_to_rupees: macro to convert dollars to rupees currency

# List of tests used in the project
   - min_value: generic test to check that any kind of minimum value is not less than 0
   - managers_without_employees: singular test to check that no such managers exists that has no employees reporting to him/her
   - min_amount_per_order: singular test to check that no such order exists for which payment value is less than 0
   - dbt_expectations.expect_column_pair_values_A_to_be_greater_than_B
   - dbt_expectations.expect_table_row_count_to_be_between

# List of packages used in the project
   - dbt-labs/dbt_utils
   - calogica/dbt_expectations
   - dbt-labs/codegen

Singular, generic and schema tests have been used to validate the data.
Apart from that, macros and jinja has been used as well to enhance functionality of models.

# About dbt
dbt is a development framework that combines modular SQL with software engineering best practices to make data transformation reliable, fast, and fun.

 - dbt Cloud
    dbt Cloud is the fastest and most reliable way to deploy dbt. Develop, test, schedule, and investigate data models all in one web-based UI.

 - dbt Core
    dbt core is an open-source command line tool that helps analysts and engineers transform data in their warehouse more effectively.

# Steps to setup project using dbt-core
   Prerequites:
   - VS Code or Pycharm
   - Python
   - BigQuery project with service account json key in local system

1) install dbt with bigquery warehouse:
    "pip install dbt-bigquery"

2) initialize dbt project and give bigquery json key:
    "dbt init"

3) initialize git repo in the directory created in previous step:
    "git init"

4) add remote origin to local repo, e.g:
    "git remote add origin https://github.com/ajannar/dbt_assignment.git"

5) pull project from remote repo branch dbtcoremaster and resolve conflicts if any:
    "git pull origin dbtcoremaster"

Dbt project is setup and ready now.

# Given folder structure is as per dbt's best practices for creating projects

- analyses
- macros
- models:
    - staging models
    - final models
    - schema.yml
    - source.yml
- seeds
- tests:
    - generic tests
    - singular tests
- dbt_project.yml
- packages.yml
- profiles.yml
- README.md

# generally used terms/functionalities of dbt
 - macros: 
    blocks of code that you can be reused multiple times.
 - analyses:
    one-off queries for testing models/tests before adding them in dbt project
 - models: 
    contains select SQL queries for transforming, analysing the data
 - seeds: 
	csv files added in seeds directory that also materializes as tables in our dataplatform, to do it use 'dbt seed'
 - tests: 
    SQL queries to test the models or business requirements
 - packages:
    codegen, dbt_utils, dbt_expectations are popular packages which can be used, they help in testing our models
 - dbt_project.yml:
    All the project configurations are set in this file.
 - profiles.yml:
    contains connection profile for the datawarehouse - bigquery, snowflake etc..

# running dbt models
    dbt run

# testing dbt models
    dbt test

# building dbt models
    dbt build (includes both test and run commands)

# References

 - Install dbt      : <https://docs.getdbt.com/docs/core/pip-install>
 - Project Structure: <https://docs.getdbt.com/docs/build/projects> 
 - Models           : <https://docs.getdbt.com/docs/build/sql-models> 
 - Tests            : <https://docs.getdbt.com/docs/build/tests> 
 - Materialization  : <https://docs.getdbt.com/docs/build/materializations> 
 - Jinja-macros     : <https://docs.getdbt.com/docs/build/jinja-macros> 
 - Best Practices   : <https://docs.getdbt.com/guides/legacy/best-practices>