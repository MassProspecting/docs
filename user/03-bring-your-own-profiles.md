# Bring Your Own Profiles

MassProspecting allows you to connect your own profiles instead of [leasing them](/user/2-leasing-profiles.md). This guide will walk you through the steps to integrate your profiles into the platform.

## Accessing a Sub-Account

Before adding profiles, ensure you are inside a sub-account:

1. **Login** to your MassProspecting account [here](https://massprospecting.com/login).
2. In the left sidebar, click on **Subaccounts**.
3. Select the sub-account where you want to add profiles.



## Adding Integrations

Once inside the sub-account:

1. In the left sidebar, click on **Integrations**.
2. In the top-right corner, click the **plus button** to add a new integration.

You will be redirected to the integrations screen, where you can connect profiles such as LinkedIn, Facebook, Apollo, Reoon, and more.

![MassProspecting Integrations](/assets/user/3-1.png)

### Integration Types

There are two main types of integrations:

1. **Native Integrations**
2. **Profile Integrations**



## 1. Native Integrations

Native integrations connect MassProspecting to third-party services like [OpenAI](https://openai.com) or [Zyte](https://zyte.com). These integrations enable features used by profile integrations.

Examples of native integrations and how to obtain their API keys:
- [OpenAI](/integrations/10-openai.md)
- [Zyte](/integrations/9-zyte.md)



## 2. Profile Integrations

Profile integrations connect social or SaaS accounts, such as LinkedIn, Facebook, Apollo, Reoon, and others. They are essential for **scraping**, **enrichment**, and **outreach** operations.

MassProspecting supports open-source profile integrations, allowing developers to create new ones using the [MassProspecting SDK](https://github.com/massprospecting/mass-sdk) and [MassProspecting API](https://github.com/massprospecting/mass-client).

### Types of Profile Integrations

1. **Basic Access**
2. **API Access**
3. **MTA Access**
4. **RPA Access**



### 1. Basic Access

Basic profiles handle public pages and do not require login credentials or API keys. These profiles typically rely on native integrations for their operations.

**Example:** The [Indeed](https://indeed.com) integration requires your [Zyte](https://zyte.com) API key to scrape Indeed pages.

![MassProspecting Indeed Integration](/assets/user/3-2.png)



### 2. API Access

API profiles connect to third-party services using an API key. To create an API profile:
1. Provide a **name** (e.g., `Reoon LTD 1`).
2. Enter the **API key**.

![MassProspecting Reoon Integration via API Key](/assets/user/3-3.png)

Examples of API integrations and how to get their keys:
- [Reoon](/integrations/7-reoon.md)
- [ZeroBounce](/integrations/8-zerobounce.md)



### 3. MTA Access

MTA profiles connect email accounts for outreach using SMTP/IMAP credentials. To create an MTA profile:
1. Provide a **name** (e.g., `GMail 1`).
2. Enter the **email address** you want to connect.
3. Add the **SMTP/IMAP password**.

![MassProspecting GMail Integration via MTA Credentials](/assets/user/3-4.png)

Examples of MTA integrations:
- [GMail or GSuite](/integrations/1-gmail-or-gsuite.md)
- [PostMark](/integrations/2-postmark.md)



### 4. RPA Access

RPA profiles simulate human interactions by opening a browser and operating social or SaaS accounts. They are ideal for tasks not possible via APIs, such as sending Facebook friend requests.

To create an RPA profile:
1. Provide a **name** (e.g., `LinkedIn 1`).
2. Enter the **email address** of the profile.

![MassProspecting RPA Integration](/assets/user/3-5.png)

Additionally, [share an AdsPower profile](/integrations/11-adspower.md) for access.

Examples of RPA integrations:
- [Facebook](/integrations/5-facebook.md)
- [LinkedIn](/integrations/4-linkedin.md)
- [Apollo](/integrations/6-apollo.md)
