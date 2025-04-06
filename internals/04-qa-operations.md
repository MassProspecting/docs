# QA Ops

A **QA Operations Center** (or just **QAOC**) is a centralized hub responsible for overseeing infrastructure and software processes of **production environment**, and ensuring quality.

A **QAOC** is very similar to a [NOC](https://en.wikipedia.org/wiki/Network_operations_center) but oritented to **software** more than **infrastructure** 

![Image](https://github.com/user-attachments/assets/104bce25-a5ac-4bd6-a8c8-870a663d4fb1)

## 1. MassProspecting Architecture

Before start working on **QAOC**, you must have understand the [software architecture of MassProspecting](https://github.com/MassProspecting/docs/blob/main/internals/01-architecture.md).

![Image](https://github.com/user-attachments/assets/c45bfd93-4eca-429d-8084-be87f70ae3eb)

Different **QA operations** will take place on different parts of the architecture.

If you are not familiarized with **MassProspecting Architecture**, is is very important you stop here and [read this](https://github.com/MassProspecting/docs/blob/main/internals/01-architecture.md) before to continue. It is also recommended that you learn to [install MassProspecting on new servers](https://github.com/MassProspecting/docs/blob/main/internals/02-installation.md).

## 2. Access to Criticial Resources

As a **QAOC Operator** you the following tools:

### 2.1. **The `saas` command**

The `saas` command is part of our [BlackOps project](https://github.com/leandrosardi/blackops) and it is what you need to perform all DevOps.

If you are not familiarized with the `saas` command, stop here and read the [BlackOps documentation](https://github.com/leandrosardi/blackops).

### 2.2. **The `secret` repository**

This is a GitHub repository where we place all the server's passwords, API keys and all sensitive information.

Ask your team leader to grant to access to [https://github.com/MassProspecting/secret](https://github.com/MassProspecting/secret).

### 2.3. **The `mass-sdk` repository**

The [mass-sdk](https://github.com/MassProspecting/mass-sdk) is the software running in the **worker servers**.

Most of the **QA operations** are related with these processes.

Ask your team leader to grant to access to [https://github.com/MassProspecting/mass-sdk](https://github.com/MassProspecting/mass-sdk).

### 2.4. **AdsPower**

AdsPower is the stealth-browser techology we use to manage multiple social profiles in one single server, without being tracked.

More infromation about AdsPower [here](https://www.adspower.com).

Ask your team leader for access to our [AdsPower](https://www.adspower.com) account.

### 2.5. **Admin access to MassProspecting**

If you access [MassProspecting](https://massprospecting.com/) as an **administrator**, you will have access to private dashboards that allow your to access users' account information.

Ask your team leader for access to our [MassProspecting](https://massprospecting.com/) account.

### 2.6. **PgAdmin**

Many operations will require you have access to production databases.

We recommend to use [pgAdmin](https://www.pgadmin.org).

![Image](https://github.com/user-attachments/assets/b7e1f39e-7172-492f-a222-81121fa9c818)

Access credentials to each **production database** can be found in our [secret repository](https://github.com/massprospecting/secret), sign inside the production **BlackOpsFile**.

![Image](https://github.com/user-attachments/assets/c74f372e-9a2d-40bd-908e-09998485931d)

## 3. Accessing Users' Accounts

As an **admin** of MassProspecting, you can access the **users screen** here: [https://massprospecting.com/monitoring/users](https://massprospecting.com/monitoring/users).

![Image](https://github.com/user-attachments/assets/30ec9308-3500-4652-9c91-e5fc43ecb481)

In such a screen you can find an email using the text-field in the top-right corner.

You can also use the **copy button** (![Image](https://github.com/user-attachments/assets/cec6667b-febb-4854-a241-0f955bb781ee)) to grab an **access link** to such a user's account.

**Note:** Remember to paste such an **access link** into another browser profile (e.g.: incognito mode), since you cannot be logged into 2 different MassProspecting accounts from the same browser.

## 4. Accessing Users' Jobs

Part of the **QA operations** work is to find processing jobs that failed for a further patch development.

Follow the steps below to access the **jobs screen** of a user.

1. Access the user's account as is has been explained in the previous chapter.

2. Once you are into the account of a user, you can access one of his subaccounts here: [https://massprospecting.com/subaccounts](https://massprospecting.com/subaccounts).

Click on the URL of the subaccount you want to access.

![Image](https://github.com/user-attachments/assets/80b45d03-dd23-4a81-a10a-56f4117a90db)

3. Once into a subaccount, go to the left-bar and click on **jobs**.

![Image](https://github.com/user-attachments/assets/d53468ab-a7ac-4c21-be6b-c03a5639d57a)

## 5. Different Type of Jobs

In the picture above, you can see 5 different type of jobs:

1. **Scraping Jobs** (or just **Jobs**): Grabbing information from the web. E.g.: The latest posts on a Facebook group.

2. **Inbox Check**: Grabbing the latest incoming messages from an email inbox or a social profile (LinkedIn, Facebook).

3. **Connection Check**: Grabbing the new connections of a social profile (LinkedIn, Facebook)

4. **Enrichment**: appending information to a **lead** or **company**. E.g.: looking for the email address of a lead, or scraping insights from a company website.

5. **Outreach**: sending an email, a connection request on LinkedIn, a friend request on Facebook, or a direct message to an existing contact on Facebook or Linkedin.

## 6. Replicating Failed Jobs

In the jobs screen, you can click on a **failed job**, and grab the command you need to run such a job in your local environment.

Such a commend is placed in the dark-blue textarea in the right-side panel.

![Image](https://github.com/user-attachments/assets/a07334a8-92a9-4a16-a9fd-3d58afb67c19)

E.g.:

```
ruby profile.rb api_key=c95c020c-xxx-xxxx-xxxx-5xxxxxxxx37e api_url=https://free01.massprospecting.com:443 id=a0ed7771-32b5-48fe-843e-0904fb096fe5 ignore-hostname=yes force-profile-run=yes headless=no run-once=yes inboxcheck=no connectioncheck=no scraping=yes id_job=84f7193c-ce12-4631-89ba-02413c29a6ec enrichment=no outreach=no 
```

Below are the steps you must to follow to run such a command in your local environment:

### 6.1. Install `mass-sdk`

In your local computer, run the following command:

```
export OPSLIB=~/code1/secret/local-ubuntu-22.04 && \
saas install --node=localworker --root && \
saas deploy --node=localworker --root && \
sudo mv /home/blackstack/mass-sdk /home/blackstack/sdk
```

### 6.2. Switch your terminal to `blackstack` user

```
su - blackstack
```

### 6.3. Setup permissions to your `sdk` folder.

Depending on your previous configuration, you may need to do this under the `blackstack` user.

```
sudo chmod 777 -R ~/code1
```

### 6.4. Install the `.sandbox` flag.

The `.sandbox` flag is necessary to get brakpoint `binding.pry` in your source code.

```
touch ~/code1/sdk/p/.sandbox
```

### 6.5. Open AdsPower.

You must of get AdsPower opened.

![Image](https://github.com/user-attachments/assets/7d26e3a6-5b3a-4669-a6ce-fbab11854900)

### 6.5. Run the command.

```
export RUBYLIB=~/code1/sdk && \
cd ~/code1/sdk/p && \
ruby profile.rb api_key=c95c020c-xxx-xxxx-xxxx-5xxxxxxxx37e api_url=https://free01.massprospecting.com:443 id=a0ed7771-32b5-48fe-843e-0904fb096fe5 ignore-hostname=yes force-profile-run=yes headless=no run-once=yes inboxcheck=no connectioncheck=no scraping=yes id_job=84f7193c-ce12-4631-89ba-02413c29a6ec enrichment=no outreach=no 
```


