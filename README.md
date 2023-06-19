Welcome!

This dbt project contains models for following datasets:
 - Employees: contains detailed information about employees of an organization.
 - Target: contains details about orders placed on e-commerce website Target.

2 type of models have been created:
 - Staging models: to stage only required data/data columns from source tables.
 - Final models: models that represent data models to be used by end users.

Singular, generic and schema tests have been used to validate the data.
Apart from that, macros and jinja has been used as well to enhance functionality of models.


Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
