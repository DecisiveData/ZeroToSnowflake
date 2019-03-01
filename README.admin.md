# Data Source Setup: Creating a New Salesforce Dev Instance

## Create an Office 365 Distribution List

1. Setup a new Office 365 distribution list: https://admin.microsoft.com/Adminportal/Home?source=applauncher#/groups
2. Use the `snowflakeN@decisivedata.net` pattern where N is the next instance available.
3. In the Exchange settings (Office 365 takes an hour to update) for the group add the distribution list `snowflake@decisivedata.net` as a member.

## Create a Salesforce Developer Edition

1. Register for Salesforce Developer Edition: https://developer.salesforce.com
2. Use the `snowflakeN@decisivedata.net` distribution list that was created.
3. Use the standard password format that is stored on the Slack channel #zerotosnowflake.

## Turn off Firewall: Set Login IP Ranges in System Administrator Profile

1. Click to Salesforce **Setup** (the gear icon).
2. On the Left panel under **Administration**, open up **Users** and select **Profiles**.
3. Navigate to the **System Administrator** profile (usually on the 2nd page) and click the **System Administrator** hyperlink. *Do not mistake this instruction for clicking 'Edit'.*
4. In the System Administrator Profile at the very top above Profile Detail, click **Login IP Ranges** and click the **New** button in the popup.
5. Set **Start IP Address** to `0.0.0.0` and set **End IP Address** to `255.255.255.255` and click the **Save** button.

## Install More Sample Data 

1. Go to https://appexchange.salesforce.com/listingDetail?listingId=a0N3A00000EO5smUAD and click **Get It Now**.
2. Click **Log In** and enter the credentials you used to create your new Salesforce account.
2. Click **Install in Production**.
3. If your profile details are missing any required blanks click **Edit** to fill them in. Then check the box to agree to the terms, and click **Confirm and Install**.
4. Select **Install for All Users**, click the button to start. and then wait. This page may be loading for a few minutes. When it is done, the message box will say "Installation Complete!".
5. Click **Done**.
6. To confirm the data has loaded, navigate back to your Salesforce homepage and click the square icon (made up of 9 dots) in the upper left. In the box that pops up, under All Items, click **Accounts**.
7. At the top, change from Recently Viewed to All Accounts to see the newly loaded accounts.

# Data Pipeline Cleanup: Clearning Old salesforce_z2s Salesforce Configuration

1. TODO

# Data Warehouse Cleanup: Clearing Old salesforce_z2s Schema

1. TODO
