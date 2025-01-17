# Bring Your Own Profiles

If you want to connect your own profiles instead of [leasing them](/user/2-leasing-profiles.md), MassPropsecting allows you to do that, as it is explained in this article.

Profiles are added into one of your  [sub-accounts](/user/1-getting-started.md#2-setup-your-sub-account). So you have to access a sub-account first:

1. Login to your MassProspecting account [here](https://massprospecting.com/login).

2. In the left-bar, click on **subaccounts**.

3. Click on the sub-account where you want to add your profiles.

Once in your sub-account:

1. In the left-bar, click on **integrations**.

2. In the top-bar, click on the **plus button**.

You will be redirected to the integrations screen, from where you can connect your profiles of LinkedIn, Facebook, Apollo, Reoon, etc.

![MassProspecting Integrations](/assets/user/3-1.png)

There are 2 types of integrations:

1. Native Integrations, and
2. Profile Integrations.

## 1. Native Integrations

A **native integration** is the ability to connect MassPropsecting to a third-party service like [OpenAI](https://openai.com) or [Zyte](https://zyte.com).

Native integrations are not used to perform any operation, but they are used by **Profile Integrations**.

Here are some examples of native integrations and how to get their API keys:

- [OpenAI](/integrations/10-openai.md).
- [Zyte](/integrations/9-zyte.md).

## 2. Profile Integrations 

A **profile integration** is a **social account** like LinkedIn or Facebook; or a **SaaS accounts** like Apollo, Reoon, FindyMail, ZeroBounce, Targetron, etc.

Profile integrations are used for **scraping**, **enrichment** and **outreach** operations. 

Unlike native integrations; profile integrations are **open source**, and any **software developer** can create new profile integrations using our [MassProspecting SDK](https://github.com/massprospecting/mass-sdk) and [MassProspecting API](https://github.com/massprospecting/mass-client).

There are 4 types of profile integrations:

1. **Basic** access,
2. **API** access,
3. **MTA** access; and
4. **RPA** access.

## 3. Basic Access

Basic profiles manage public pages, and they don't require login credentials or api keys.

Basic profiles usally uses the native integration to perform their operations.

**E.g.:** Our [Indeed](https://indeed.com) integration will require your [Zyte](https://zyte.com) API key to scrape Indeed pages.

![MassPropsecting Indeed Integration](/assets/user/3-2.png)

## 4. API Access

API profiles connect to a third-party service through an API key.

To create an API profile, you have to define:

1. a name (e.g.: `Reoon LTD 1`); and

2. its API key.

![MassPropsecting Reoon Integration trough API key](/assets/user/3-3.png)

Here are some examples of API integrations and how to get their API keys:

- [Reoon](/integrations/7-reoon.md).
- [ZeroBounce](/integrations/8-zerobounce.md).

## 5. MTA Access

MTA profiles connect to an email outreach using SMTA/IMAP credentials.

To create a MTA profile, you have to define:

1. a name (e.g.: `GMail 1`),

2. the email address that you want to connect; and

3. the SMTP/IMAP password.

![MassPropsecting GMail Integration trough MTA credentials](/assets/user/3-4.png)

Here are some examples of MTA integrations and how to get their credentials:

- [GMail or GSuite](/integrations/1-gmail-or-gsuite.md).
- [PostMark](/integrations/2-postmark.md).

## 6. RPA Access

RPA profiles open a browser and operate social accounts or SaaS accounts like a human.

RPA profiles are typically used to perform operations that are not possible with the API.

**Examples:**

- It is not possible to send Facebook Friend Requests through its API.

- Emails scraped from Apollo on the user interface are 10x cheaper than using Apollo's API.

To create a RPA profile, you have to define:

1. a name (e.g.: `LinkedIn 1`); and

2. the email address of the profile.

![MassPropsecting GMail Integration trough MTA credentials](/assets/user/3-5.png)

Additionally, you have to [share an AdsPower profile](/integrations/11-adspower.md) from where we can access your profile.

Here are some examples of RPA integrations:

- [Facebook](/integrations/5-facebook.md).
- [LinkedIn](/integrations/4-linkedin.md).
- [Apollo](/integrations/6-apollo.md).


