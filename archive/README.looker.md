# Zero To Snowflake

Zero to Snowflake is an interactive demonstration of the Snowflake cloud data warehouse and related cloud data analytics tools. In this session we will demonstrate how quickly we can provision, configure, and deploy a world class cloud data warehouse and analytics stack.

## Infrastructure

In this Zero to Snowflake event, we will build a cloud data analytics infrastructure with best of breed tools. The basic architecture is:

    Data Source -> Data Pipeline -> Data Warehouse -> Data Visualization

The cloud analytics tools we will use for this process are:

- Data Source: [**Salesforce**](https://www.salesforce.com)
- Data Pipeline: [**Fivetran**](https://www.fivetran.com)
- Data Warehouse: [**Snowflake**](https://trial.snowflake.com/?utm_source=decisive-data&utm_medium=referral&utm_campaign=self-service-partner-referral-decisive-data)
- Data Visualization: [**Looker**](https://www.looker.com)

In this event, data from Salesforce will be replicated with Fivetran into Snowflake, where an analytical data model will be applied. Data will then be further modeled and visualized in Looker dashboards.

    Salesforce data -> Fivetran replication -> Snowflake warehouse -> Looker dashboards

## Provisioning

- Snowflake Trial: [https://trial.snowflake.com](https://trial.snowflake.com/?utm_source=decisive-data&utm_medium=referral&utm_campaign=self-service-partner-referral-decisive-data) $400 free credits
- Salesforce Developer Account: https://developer.salesforce.com Free account, no credit card
- Fivetran Trial: *Sign up through Snowflake Partner Connect inside Snowflake*
- Looker: https://decisivedata.looker.com *We will use Decisive Data's Looker, but free 21-day proof of concepts are available at looker.com*

# Data Warehouse Setup - Snowflake

1. Sign up for a Snowflake Trial with $400 credit at [https://trial.snowflake.com](https://trial.snowflake.com/?utm_source=decisive-data&utm_medium=referral&utm_campaign=self-service-partner-referral-decisive-data).
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
8. Click Salesforce and change the schema name to  `salesforce_z2s`.
9. Click **AUTHORIZE** and complete the login of Fivetran into Salesforce.
10. Click **SAVE & TEST**. When the tests are completed, click **< View Connector**.
11. Fivetran will download a list of objects available for sync from Salesforce.
12. Under the **Schemas** header click the `-` button just to the left of the **Sync Table** header. We only need a few tables, and this will remove every table from the sync. Then go through the list of objects and add back just the necessary tables, which are `Account`, `Campaign`, `Contact`, `Lead`, `Opportunity`, and `User`. There is no harm in syncing all tables, it will just take slightly longer on the initial historical sync.
13. In the upper right, click the slider to **Enable** the sync of data from Salesforce into Snowflake.
14. Above the list of tables, change **Replication Frequency** slider to `5m` and then over to `24h`. This will kick off an initial sync of historical data.

# Data Visualization Setup - Looker

1. A Looker user account invitation in the Decisive Data tenant will be emailed to you. Follow the instructions to create a password and sign up.

# Data Warehouse Configuration - Snowflake

There are some tasks that we will perform in Snowflake to enable an analytical tool to connect to our cloud data warehouse.

1. Copy/paste the contents of `/salesforce/fivetran/analytics_setup.sql` into the blank worksheet in Snowflake.
2. At the top of the worksheet, check the box for **All Queries** and then click the **Run** button.

# Data Visualization Configuration - Looker

1. View our Looker model here: https://github.com/DecisiveData/blocks_salesforce
2. In the Looker Admin section, first configure a Connection with the settings created in the `analytics_setup.sql` file of the last step. Be sure to test the connection.
3. In the Looker Develop menu, select **Manage LookML Projects** and click the **New LookML Project** button in the upper right.
4. Name the project and in Starting Point select **Clone Public Git Repository**. In the **Git Repository URL** textbox enter `git://github.com/DecisiveData/blocks_salesforce.git` and click **Create Project**.

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