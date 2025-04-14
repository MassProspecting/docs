# Working with SDK

Every time you run a scraping job, or an enrichment, or an outreach from [MassProspecting](https://massprospecting.com); such a job is performed by the [**SDK**](https://github.com/massprospecting/mass-sdk).

Every single step in your [MassProspecting Workflow](https://github.com/MassProspecting/docs) is perfrmed by the [**MassProspecting SDK**](https://github.com/MassProspecting/mass-sdk).

The **MassProspecting SDK** is executed by the [worker nodes of our architecture](https://github.com/MassProspecting/docs/blob/main/internals/01-architecture.md).

![MassProspecting Architecture](https://github.com/MassProspecting/docs/raw/main/assets/internals/1-1.png)

## 1. Abstract 

This document explain how to find failed jobs (scraping, enrochment, outreach, etc.) and replicate them in out local computer for debugging and fixing.

## 2. Accessing User's Accounts

Access your MassProspecting account with **admin grants**.

1. Login to MassProspecting here:
[https://massprospecting.com/login](https://massprospecting.com/login)

2. Go to the list of Users here:
[https://massprospecting.com/monitoring/users](https://massprospecting.com/monitoring/users)

3. Find the the purple **SysOwner** badget. That means that you can find and user of MassProspecting in such a screen.

If you don't have a **SysOwner** badge, then ask your team leader for the right grantes for managing other users' accounts.

![Image](https://github.com/user-attachments/assets/486fc290-c1a8-49dd-a83b-12cdb91b8835)

4. In the screen above, use the search box in the top-right corner to search for the user you want to access.

5. Once you found the user you want to access, click on the **copy icon** that you can find in the **Access Link** column.

Such a link is for accessing the user's account in another browser, with out the need of writing its password.

6. Since you can't loging to 2 MassProspecting accounts in the same browser; open a new browser in **incognito mode** in order to access the user's account.

In the new **incognito browser**, paste the link you copied in the previous step.

7. Once you accessed the user's account, go to the [**sub-accounts screen**](https://massprospecting.com/subaccounts), access the user's subaccount. 

![MassProspecting User Sub-Accounts](../assets/internals/6-1.png)

## 3. Finding Failed Jobs

1. Once you have accessed the user's subaccount, find the **jobs** icon in the left-bar and click on it.

![MassProspecting Jobs Icon](../assets/internals/6-2.png)

2. In the jobs screen, you can choose beetween the diffent tye of jobs (scraping, enrichment, outreach, etc.)

Go to the type of jobs you want to work with (e.g: **scraping**)

![MassProspecting Jobs Screen](../assets/internals/6-3.png)

3. Filter the jobs with status **failed**.

4. Optionally, you can write the name of the **profile** you want to work with or even the name of the **lead** (if you are working on enrichment jobs or outreach jobs).

5. Click on one of the results to see such a result's details in the right-side panel.

6. Find the **command** to execute such a job in your computer.

7. Optinonally, click on the **snapshot** icon to get the exact HTML code of the website at the moment the failure happened.

8. Optionally, find the **backtrace** of the exception that generated such a failure.


---

2. Access the subaccount "Selling MassProspecting".

3. Find the only one `ApolloRPA` that such a subaccount has.

**Important:** Don't mess between `ApolloRPA` and `ApolloAPI` profiles.

![Image](https://github.com/user-attachments/assets/361d993d-de5e-49aa-a749-1449196bb157)

4. Stop such a profile.

If you are going to run such a profile in your local computer, you need it is not running at any other server / computer. 

![Image](https://github.com/user-attachments/assets/60f3b317-3a2b-4612-a0b1-ecd3f1706d43)

5. Find failed enrichment jobs.

Search by `apollo.01f` and `failed` status. 
Grab the command from the right-side panel.
Replicate the job in your local computer. Debug. Fix.

![Image](https://github.com/user-attachments/assets/266e86f9-4142-4c1a-b0cf-004bb01c2866)

6.

---

### 1. Reproducing the Issue

First, I replicated the glitch by running the `profile` command locally. This revealed that there were actually three separate issues. The first and most immediate problem was that the Apollo account had been logged out.

[[Video Demo](https://youtu.be/-0YkSat5nvo)](https://youtu.be/-0YkSat5nvo)

## 2. Fixing the Apollo Login Issue

In this step, I manually logged into the Apollo account and verified that the login persists correctly even after restarting the browser.

[[Video Demo](https://youtu.be/8-hQGGvirRk)](https://youtu.be/8-hQGGvirRk)

## 3. Confirming Additional Issues

Running the `profile` command again revealed two more problems:

- Our scraper was fetching email addresses from Apollo, which we no longer want because Apollo now charges for accessing emails. Instead, we should only scrape publicly available data (lead name, LinkedIn URL, company name, headcount, etc.).
- A new issue was detected related to scraping Apollo company URLs.

[[Video Demo](https://youtu.be/YbtrXtJrtYE)](https://youtu.be/YbtrXtJrtYE)

## 4. Disabling Email Scraping

Here, I demonstrate how to disable email scraping to avoid charges from Apollo. Also, the previously mentioned company URL glitch surfaced again.

[[Video Demo](https://youtu.be/6zRsaqbQ5D4)](https://youtu.be/6zRsaqbQ5D4)

## 5. Clarifying the Apollo Company URL Issue

We identified that Apollo company URLs must match the `/organization/` pattern as required by MassProspecting validation. When users fetch email addresses, leads are added to Apollo's CRM, converting public URLs into private URLs visible only to logged-in users.

Thus, the company URL issue is not actually a bug but expected behavior. Once email scraping is disabled, future URLs will remain publicly accessible and valid.

[[Video Demo](https://youtu.be/aJki6QBstW8)](https://youtu.be/aJki6QBstW8)

## 6. Addressing Scraping Issues Due to New UI

Finally, I illustrate preliminary steps to resolve incorrect scraping of fields such as industry and company headcount, caused by recent Apollo UI changes.

[[Video Demo](https://youtu.be/FwMCzJhHGXA)](https://youtu.be/FwMCzJhHGXA)

---

@alirazasabir94 , here is another video about how to inspect the HTML code of a website, so you can build your `xpath` queries.

[How to Inspect HTML](https://youtu.be/MEZhI2_q3Lo)
