## Leads Enrichment

Leads Enrichment is a critical feature of MassProspecting that enhances your lead data by adding missing details and refining existing information. 

By defining automated rules and enrichment actions, users can augment leads with attributes like email addresses, phone numbers, company details, and more. 

This feature leverages integration with external data providers (e.g., Apollo API, Apollo RPA or FindyMail API) to transform basic lead profiles into enriched, actionable insights, ensuring that users have all the information needed to engage effectively with prospects.

## Accessing a Sub-Account

You have to access a sub-account first:

1. Login to your MassProspecting account [here](https://massprospecting.com/login).

2. In the left-bar, click on **subaccounts**.

3. Click on the sub-account where you want to add your profiles.

### Creating a New Rule

1. Inside your sub-account, click on **Rules** in the left menu.

2. Click on the blue button in the top-left corner.

![Rules Screen](../assets/user/8-1.png)

3. In the Trigger section, chosse "Tag Added" in the **Trigger Type**, and the tag you want to reference.

![Defining Rule Trigger](../assets/user/8-2.png)

4.a. In the Filters section, choose "Lead" in the **Apply to** field and define parameters to filter the leads scraped, like job position, location, industry or company headcount.

![Filtering by Leads Attributes](../assets/user/7-5.png)

**Important:** Remember to filter by parameters that you know are provided by the source. E.g.: If you are scraping the LinkedIn Public Feed, you have the job position of the leads that appear in the headline of such leads, but you don't have their company size yet.

![Scraping LinkedIn Public Feed](../assets/user/7-6.png)

4.b. Another choice is to choose "Event" in the **Apply to** field in order to filter by some keywords into the content of the posts scraped.

![Filtering by Events Content](../assets/user/7-7.png)

**Note:** Filters are not mandatory. You can click on the close icon in the top-right corner of the filters panel.

5. In the Action section, choose "New Enrichment" in the **Action Type**, and choose "Enrichment Type" to use (e.g.: `ApolloAPI_LinkedInToEmail`)

![Defining Rule Action](../assets/user/8-3.png)

**Important:** Be sure that the triggered leads already have the parameters required by the enrichment type. E.g.: The enrichment type `ApolloAPI_LinkedInToEmail` requires the LinkedIn URL of the lead to get his/her email address. If you scraped the lead from the LinkedIn Public Feed, you have such a field for sure.


