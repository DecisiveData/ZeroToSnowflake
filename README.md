# Zero To Snowflake

Zero to Snowflake is an interactive demonstration of the Snowflake cloud data warehouse and related cloud data analytics tools. In this session we will demonstrate how quickly we can provision, configure, and deploy a world class cloud data warehouse and analytics stack.

## Infrastructure

In this Zero to Snowflake event, we will build a cloud data analytics infrastructure with best of breed tools. The basic architecture is:

    Data Source -> Data Pipeline -> Data Warehouse -> Data Visualization

The cloud analytics tools we will use for this process are:

- Data Source: [**Salesforce**](https://www.salesforce.com)
- Data Pipeline: [**Fivetran**](https://www.fivetran.com)
- Data Warehouse: [**Snowflake**](https://www.snowflake.com)
- Data Visualization: [**Tableau**](https://www.tableau.com)

In this event, data from Salesforce will be replicated with Fivetran into Snowflake, where an analytical data model will be applied. Data will the be visualized in Tableau dashboards.

    Salesforce data -> Fivetran replication -> Snowflake warehouse -> Tableau dashboards

## Provisioning

- Snowflake Trial: [https://trial.snowflake.com](https://trial.snowflake.com/?utm_source=decisive-data&utm_medium=referral&utm_campaign=self-service-partner-referral-decisive-data) $400 free credits
- Salesforce Developer Account: https://developer.salesforce.com Free account, no credit card
- Fivetran Trial: *Sign up through Snowflake Partner Connect inside Snowflake*
- Tableau Trial: https://www.tableau.com/partner-trial?id=19610 14 days, no credit card

# Data Warehouse Setup - Snowflake

1. Sign up for a Snowflake Trial with $400 credit at https://trial.snowflake.com.
2. An email will come within 15 minutes when your Snowflake account is ready.
3. Once you receive the email, login to your Snowflake account.

# Data Source Setup - Salesforce

To connect pull data from Salesforce there are two options:

1. **EXISTING ACCOUNT**: Use your active Salesforce account. The Salesforce account plan level must be Enterprise or higher OR have purchased API calls.
2. **DEVELOPER ACCOUNT**: Sign up for a new **free** Salesforce developer account. Developer accounts come with mock data but have free API calls. Sign up at https://developer.salesforce.com/.

# Data Pipeline Setup - Fivetran

1. In Snowflake, click the user menu (top right corner) → Switch Role → Select ACCOUNTADMIN.
2. Click the **Partner Connect** tab.
3. Choose the Fivetran option and click **Connect**. This will initiate an automatic process to create a partner trial account in Fivetran that will connect to Snowflake.
4. Click **Activate** in the final step.
5. Look for an email from Fivetran and complete the sign up.
6. In the Fivetran Dashboard, click **Connectors**.
7. Click **+ CONNECTOR** and search for *Salesforce*.
8. Click Salesforce and change the schema name to  `salesforce_z2s`. **It is very important** for the Tableau Dashboard section later to have it be named exactly `salesforce_z2s`.
9. Click **AUTHORIZE** and complete the login of Fivetran into Salesforce.
10. Click **SAVE & TEST**. When the tests are completed, click **< View Connector**.
11. Fivetran will download a list of objects available for sync from Salesforce.
12. Under the **Schemas** header click the `-` button just to the left of the **Sync Table** header. We only need a few tables, and this will remove every table from the sync. Then go through the list of objects and add back just the necessary tables, which are `Account`, `Lead`, `Opportunity`, `OpportunityLineItem`, `Pricebook2`, `PricebookEntry`, `Product2`, and `User`.
13. In the upper right, click the slider to **Enable** the sync of data from Salesforce into Snowflake.
14. Above the list of tables, change **Replication Frequency** slider to `5m` and then over to `24h`. This will kick off an initial sync of historical data.

# Data Visualization Setup - Tableau

1. A Tableau free trial can be created at https://www.tableau.com/partner-trial?id=19610.
2. Fill out the registration form, then download & install Tableau.

# Data Warehouse Configuration: Dimensional Model in Snowflake

There are two analytical processes that we will perform to add value to Salesforce data:

1. **Data Modeling** to reshape our normalized Salesforce data into a useful format for analytics.
2. **Dashboard Design** to effectively design appealing dashboards to see and understand data, in a way that drives action.

Tableau often requires a simplified dataset that is in a single table or star schema. In our Zero to Snowflake example, this will take the form of a dimensional model that we can install. A sample dimensional model is available in this repository at `/salesforce/fivetran/dimensional` or https://github.com/DecisiveData/ZeroToSnowflake/tree/master/salesforce/fivetran/dimensional.

1. In Snowflake, click **Worksheets** and open a blank worksheet.
2. Copy/paste the contents of `/salesforce/fivetran/dimensional/__install_dimensional.sql` into the blank worksheet in Snowflake.
3. At the top of the worksheet, check the box for **All Queries** and then click the **Run** button.

# Data Visualization Configuration: Executive Sales Summary Dashboard in Tableau

**NOTE**: Requires `Tableau 2018.3`.

1. Download the starter Tableau file in this repository at `/salesforce/tableau/Executive Sales Summary.twbx` or online here: https://github.com/DecisiveData/ZeroToSnowflake/blob/master/salesforce/tableau/Executive%20Sales%20Summary.twbx
2. Click the **Download** button in Github to move a copy of `Executive Sales Summary.twbx` to your hard drive.
3. When the file opens in Tableau, a login dialog will come up. Click the **Edit connection** button, and fill in your server, username, and password.
4. Click **Sign In** and data should populate.

# Sample Login Information

The password is the same for the below example accounts. Ask a leader for it.

## Salesforce Developer Logins

- URL: https://login.salesforce.com
- User: `snowflake@decisivedata.net`
- User: `snowflake1@decisivedata.net`

## Snowflake Login

- URL: https://ddlearn.snowflakecomputing.com
- User: `Z2S_USER`
- Warehouse: `PC_FIVETRAN2_WH`
- Database: `PC_FIVETRAN_DB`
- Schema: `SALESFORCE_Z2S`

## Fivetran Login

- URL: https://fivetran.com/dashboard
- User: `zerotosnowflake@decisivedata.net`

# Other Information

## Additional Salesforce Dummy Data

The *Populate Salesforce* application can create additional realistic data beyond what the Salesforce Developer Edition installs for you. Install it from here: https://appexchange.salesforce.com/listingDetail?listingId=a0N3A00000EO5smUAD