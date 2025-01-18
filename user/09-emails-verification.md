# Emails Verification

Email verification is an essential feature in MassProspecting that ensures the accuracy of email addresses associated with your leads. This process helps improve email deliverability and maintain the quality of your contact lists.

## Accessing a Sub-Account

To begin verifying emails, you need to access a sub-account:

1. Log in to your MassProspecting account [here](https://massprospecting.com/login).
2. In the left menu, click on **Subaccounts**.
3. Select the sub-account where you want to manage your leads.

## Creating a New Rule for Email Verification

Follow these steps to set up a rule for verifying email addresses:

1. Inside your sub-account, click on **Rules** in the left menu.
2. Click the **blue button** in the top-left corner to create a new rule.

   ![Rules Screen](../assets/user/9-1.png)

### Defining the Rule Trigger

3. In the **Trigger** section:
   - Select **Rule Performed** as the **Trigger Type**.
   - Choose the rule that this new rule should follow.  
     Example: You can verify emails appended by the rule explained in the [previous chapter](./08-leads-enrichment.md).

   ![Defining Rule Trigger](../assets/user/9-2.png)

### Filtering Leads for Email Verification

4. In the **Filters** section:
   - Select **Lead** in the **Apply to** field.
   - Define filter parameters such as job position, location, industry, or company headcount.
   - Set **Must Have an Email** to **Yes** to ensure only leads with email addresses are processed.

   ![Filtering by Leads Attributes](../assets/user/9-3.png)

   **Note:** While filters are not mandatory, it is highly recommended to use them to avoid processing unnecessary leads and optimize your workflow.

### Defining the Email Verification Action

5. In the **Action** section:
   - Select **New Enrichment** as the **Action Type**.
   - Choose the **Enrichment Type**, such as `Reoon_EmailVerification`.

   ![Defining Rule Action](../assets/user/9-4.png)

   **Important:** Ensure the leads have the required parameters for the selected enrichment type. For example, `Reoon_EmailVerification` requires an email address. This is why applying the appropriate filter is crucial.

By following these steps, you can efficiently verify email addresses and maintain the quality and deliverability of your email campaigns.
