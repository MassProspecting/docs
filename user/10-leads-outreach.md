# Leads Outreach

Leads Outreach is a feature in MassProspecting that allows you to send targeted communications, such as cold emails, to your leads. By creating rules, you can automate outreach to leads who meet specific criteria, ensuring efficient and effective prospect engagement.

## Accessing a Sub-Account

To set up an outreach rule, first access the relevant sub-account:

1. Log in to your MassProspecting account [here](https://massprospecting.com/login).
2. In the left sidebar, click on **Subaccounts**.
3. Select the sub-account where your leads are stored.

## Creating a New Rule for Outreach

Follow these steps to create an outreach rule:

1. Inside your sub-account, click on **Rules** in the left menu.
2. Click the **blue button** in the top-left corner to create a new rule.

   ![Rules Screen](../assets/user/10-1.png)

### Defining the Rule Trigger

3. In the **Trigger** section:
   - Select **Rule Performed** as the **Trigger Type**.
   - Choose the rule that this outreach rule will follow.  
     Example: Send cold emails to leads who passed the verification rule explained in the [previous chapter](./09-emails-verification.md).

   ![Defining Rule Trigger](../assets/user/10-2.png)

### Filtering Leads for Outreach

4. In the **Filters** section:
   - Select **Lead** in the **Apply to** field.
   - Define filter parameters, such as job position, location, industry, or company headcount.
   - Set **Must Have an Email** to **Yes** and **Email Verification** to **Valid** to ensure the leads have verified email addresses.

   ![Filtering by Leads Attributes](../assets/user/10-3.png)

   **Note:** While filters are optional, using them is highly recommended to avoid unnecessary processing or, worse, sending emails to invalid email addresses.

### Defining the Outreach Action

5. In the **Action** section:
   - Select **New Outreach** as the **Action Type**.
   - Choose the **Outreach Type** (e.g., `Gmail_directmessage`).

   ![Defining Rule Action](../assets/user/10-4.png)

By setting up these rules, you can streamline your outreach process and ensure that your messages reach the right leads at the right time.
