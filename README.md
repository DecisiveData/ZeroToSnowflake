# Zero To Snowflake

Zero to Snowflake is an interactive demonstration of the Snowflake cloud data warehouse and related cloud data analytics tools. In this session we will demonstrate how quickly we can provision, setup, configure, and deploy a world class cloud data warehouse and analytics stack.

## Analytical Infrastructure

In this Zero to Snowflake event, we will build a cloud data analytics infrastructure with best of breed tools. The basic architecture is:

    Data Source -> Data Pipeline -> Data Warehouse -> Data Visualization

The cloud analytics tools we will use for this process are:

- Data Source: [**Salesforce**](https://www.salesforce.com)
- Data Pipeline: [**Fivetran**](https://www.fivetran.com)
- Data Warehouse: [**Snowflake**](https://www.snowflake.com)
- Data Visualization: [**Tableau**](https://www.tableau.com)

In this event, data from Salesforce will be replicated with Fivetran into Snowflake, where an analytical data model will be applied. Data will the be visualized in Tableau dashboards.

    Salesforce data -> Fivetran replication -> Snowflake warehouse -> Tableau dashboards

## Analytical Configuration

There are two analytical processes that we will perform to add value to Salesforce data:

1. **Data Modeling** to reshape our normalized Salesforce data into a useful format for analytics.
2. **Dashboard Design** to effectively design appealing dashboards to see and understand data, in a way that drives action.

# PART 1: Provision Analytical Infrastructure

## Snowflake

1. Sign up for a Snowflake Trial with $400 credit at https://trial.snowflake.com.
2. An email will come within 15 minutes when your Snowflake account is ready.
3. Once you receive the email, login to your Snowflake account.

## Salesforce

To connect pull data from Salesforce there are two options:

1. **EXISTING ACCOUNT**: Use your active Salesforce account. The Salesforce account plan level must be Enterprise or higher OR have purchased API calls.
2. **DEVELOPER ACCOUNT**: Sign up for a new **free** Salesforce developer account. Developer accounts come with mock data but have free API calls. Sign up at https://developer.salesforce.com/.

## Fivetran

1. In Snowflake, click the user menu (top right corner) → Switch Role → Select ACCOUNTADMIN.
2. Click the **Partner Connect** tab.
3. Choose the Fivetran option and click **Connect**. This will initiate an automatic process to create a partner trial account in Fivetran that will connect to Snowflake.
4. Click **Activate** in the final step.
5. Look for an email from Fivetran and complete the sign up.
6. In the Fivetran Dashboard, click **Connectors**.
7. Click **+ CONNECTOR** and search for *Salesforce*.
8. Keep the default **Destination schema** of `salesforce` or enter your own value.
9. Click **AUTHORIZE** and complete the login of Fivetran into Salesforce.
10. Click **SAVE & TEST**. When the tests are completed, click **< View Connector**.
11. Fivetran will download a list of objects available for sync from Salesforce. In the upper right, click the slider to enable the sync of data from Salesforce into Snowflake.
12. Scroll down the page to **Settings** and **Replication Frequency** and move the slider to `5m`. This will kick off an initial sync of historical data.

## Tableau

1. A Tableau free trial can be created at https://www.tableau.com/partner-trial?id=19610. Fill out the registration form, then download & install Tableau.

# PART 2: Install Data Models into Snowflake

Tableau often requires a simplified dataset that is in a single table or star schema. 

# PART 3: Connect Tableau Dashboards to Snowflake

Requires `Tableau 2018.3`.

# Infrastructure Summary & Links

- Snowflake Trial: https://trial.snowflake.com $400 free credits, credit card required
- Salesforce Developer Account: https://developer.salesforce.com Free accont, no credit card
- Fivetran Trial: *Sign up through Snowflake Partner Connect inside Snowflake*
- Tableau Trial: https://www.tableau.com/partner-trial?id=19610 14 days, no credit card

## Additional Salesforce Dummy Data

The Populate Salesforce application can create additional realistic data beyond what the Salesforce Developer Edition installs for you. Install it from here: https://appexchange.salesforce.com/listingDetail?listingId=a0N3A00000EO5smUAD