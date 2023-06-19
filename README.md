Welcome!

# About project

This dbt project contains transformed data models for following datasets:
 - Employees: An Indian MNC has taken over a small software company with around 15 employees.
    The software company has provided the csv files of Employees details and their organisation structure.
 - Target: Target is a globally renowned brand and a prominent retailer in the United States.
    The dataset offers a comprehensive view of various dimensions including the order status, price, payment and freight performance, customer location, product attributes, and customer reviews.

2 type of models have been created:
 - Staging models: to stage only required data/data columns from source tables.
 - Final models: models that represent data models to be used by end users.

Singular, generic and schema tests have been used to validate the data.
Apart from that, macros and jinja has been used as well to enhance functionality of models.

# About dbt
dbt is a development framework that combines modular SQL with software engineering best practices to make data transformation reliable, fast, and fun.

 - dbt Cloud
    dbt Cloud is the fastest and most reliable way to deploy dbt. Develop, test, schedule, and investigate data models all in one web-based UI.

 - dbt Core
    dbt core is an open-source command line tool that helps analysts and engineers transform data in their warehouse more effectively.

# Installation steps for dbt core
You can install and use dbt Core from the command line.
pip install dbt-core
Note: dbt-core is compatible with python versions > 3.6

Depending on the type of dataware house we can use the following:
pip install dbt-bigquery
pip install dbt-snowflake
Note: if you install the above the dbt core installs automatically

# Given folder structure is as per dbt's best practices for creating projects

analyses
macros
models:
    staging models
    final models
    schema.yml
    source.yml
seeds
tests:
    generic tests
    singular tests
dbt_project.yml
packages.yml
profiles.yml
README.md

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