# Architecture

First thing first, you need to have the whole picture of MassProspecting's architecture.

In this section we review the architecture of MassProspecting, and how to install it in both: **development** and **production** environments.

1. [Overview](#1-overview)
2. [Processes](#2-processes)

## 1. Overview

![MassProspecting Architecture](/assets/internals/1-1.png)

**Master Node**

The **master node** is where users signup and login (among other use cases).
There is one, and only one, **master node** running.

There is one, and only one, **master node** running.

The **master** is one server running a [my.saas](https://github.com/leandrosardi/my.saas) platform with the following [extensions](https://github.com/leandrosardi/my.saas/tree/1.6.8?tab=readme-ov-file#4-extensions):

- [mass.commons](https://github.com/massprospecting/mass.commons)
- [mass.account](https://github.com/massprospecting/mass.account)
- [i2p](https://github.com/leandrosardi/i2p)
- [content](https://github.com/leandrosardi/content)
- [affiliates](https://github.com/leandrosardi/affiliates)
- [monitoring](https://github.com/leandrosardi/monitoring)
- [dropbox-token-helper](https://github.com/leandrosardi/dropbox-token-helper)

The my.saas platform running into the master has its own `config.rb` file, and its own PostgreSQL database running locally.

The master node:

- hosts all the user accounts of the platform,
- publishes the marketplace of profiles,
- manage the sub-accounts hosted in **salve servers**,
- manage invoicing and payments processing; and
- manage all security use cases like login, logout, password reset and password recovery.

Users create **sub-accounts** that are stored in **slave nodes**.

**Slave Node**

There are one or more **slave nodes** running.

The **slave nodes** are where sub-accounts are hosted.

A sub-account is used for:

- white-labeling, creating one sub-account for each client of the user.

- costs control, creating one sub-account for each sector in an organization.

Also, sub-accounts allows to create custom domains the brand of the user, and grant access to the user's clients too.

The **slaves** run a [my.saas](https://github.com/leandrosardi/my.saas) platform with the following [extensions](https://github.com/leandrosardi/my.saas/tree/1.6.8?tab=readme-ov-file#4-extensions):

- [mass.commons](https://github.com/massprospecting/mass.commons)
- [mass.subaccount](https://github.com/massprospecting/mass.subaccount)

The my.saas platform running into the master has its own `config.rb` file, and its own PostgreSQL database running locally.

The communication between the **master** and the **slaves** is is via API only.

One **slave node** may have one or more **worker nodes**.

**Worker Nodes**

The **worker nodes** run one process for each **profiles** assigned to that worker node.

**E.g.:**

- LinkedIn profiles,
- Facebook profiles,
- an email verification API,
- an MTA outreach.

The profiles are exectuted by the [mass-sdk](https://github.com/massprospecting/mass-sdk).

The communication between the mass-sdk and the slave node is is via API only.


There is an instance of [mass.slave](https://github.com/massprospecting/mass.slave) running with the only goal of connecting the database of the slave to know what are the profiles assigned to that worker node, and launch one process for each one.

As an additional note, that instance of mass.slave shouldn't be running in a worker node. The worker node should get the list of profiles assigned via API. This wrong design is reportd to be fixed [here](https://github.com/MassProspecting/docs/issues/198).

## 2. Processes

**Master Node**

| Process                               | Description                                                                                       |
|---------------------------------------|---------------------------------------------------------------------------------------------------|
| nginx                                 | Nginx is used as a reverse proxy, listining port 443 (https) and redirecting to port 3000 (http). |
| app.rb port=3000                      | It is a [Sinatra webserver](https://sinatrarb.com/), serving the webpages of the platofrm.        |
| extensions/mass.account/p/allocate.rb | This process find a slave node with available slots, and signup a sub-account there.              |


**Slave Nodes**

| Process                                  | Description                                                                                                                                                                                                                                                                                                                                                            |
|------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| nginx                                    | Nginx is used as a reverse proxy, listining port 443 (https) and redirecting to port 3000 (http).                                                                                                                                                                                                                                                                      |
| app.rb port=3000                         | It is a [Sinatra webserver](https://sinatrarb.com/), serving the webpages of the platofrm.                                                                                                                                                                                                                                                                             |
| extensions/mass.subaccount/p/ingest.rb   | This process take records from the table `import` insert rows into the table `import_row`.                                                                                                                                                                                                                                                                             |
| extensions/mass.subaccount/p/import.rb   | This process take records from the table `import_row` and processes them one by one, merging into the `lead` table.                                                                                                                                                                                                                                                    |
| extensions/mass.subaccount/p/plan.rb     | This command create requests in the tables `inboxcheck`, `connectioncheck`, `job`, `enrichment`, and `outreach`.                                                                                                                                                                                                                                                       |
| extensions/mass.subaccount/p/rule.rb     | This process iterates active rules table; bringing the triggered records, evaluating filters and creating records into the `rule_instance` table.<br>Also, it iterates pending `rule_instance` records and create records in the tables `outreach`, `enrichment`, `lead_tag` and `company_tag`, or mark records as deleted in the tables `lead_tag` and `company_tag`. |
| extensions/mass.subaccount/p/timeline.rb | This process create manage a snapshot in the table `timeline`, in order to get performance stats online.                                                                                                                                                                                                                                                               |

**Worker Nodes**

| Process                                 | Description                                                                                                                           |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| extensions/mass.subaccount/p/launch1.rb | This process get the list of basic profiles assisgned to the worker node, and launch one `basic.rb` process for each one.             |
| extensions/mass.subaccount/p/launch2.rb | This process get the list of mta, api or rpa profiles assisgned to the worker node, and launch one `profile.rb` process for each one. |


