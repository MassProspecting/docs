# Architecture

This document provides an overview of MassProspecting's architecture.

1. [Overview](#1-overview)
2. [Processes](#2-processes)

## 1. Overview

MassProspecting has 3 keys components:

1. the **master** node,
2. the **slave** nodes, and
3. the **worker** nodes.

The picture below shows the stack running on each one of them, and the communication between them too.

![MassProspecting Architecture](/assets/internals/1-1.png)

### Master Node

The **master node** is the main server where users sign up, log in, and access the platform. There is only one master node running at any time. The master node performs several key functions:

- Hosts user accounts for the platform.
- Manages the marketplace for available profiles.
- Controls sub-accounts on **slave servers** (explained below).
- Handles invoicing and payment processing.
- Manages security, including login, logout, password reset, and recovery.

The master node runs a [my.saas](https://github.com/leandrosardi/my.saas) platform with the following extensions:

- [mass.commons](https://github.com/massprospecting/mass.commons) _(private access)_
- [mass.account](https://github.com/massprospecting/mass.account) _(private access)_
- [i2p](https://github.com/leandrosardi/i2p) (invoicing & payments processing)
- [content](https://github.com/leandrosardi/content) (a CMS)
- [monitoring](https://github.com/leandrosardi/monitoring)
- [dropbox-token-helper](https://github.com/leandrosardi/dropbox-token-helper)

The master node's `my.saas` platform uses a `config.rb` configuration file and runs its own local PostgreSQL database.

Users can create **sub-accounts** that are hosted on **slave nodes**.

### Slave Nodes

The **slave nodes** are servers where sub-accounts are hosted. There can be one or more slave nodes running at any given time. A sub-account is used for:

- **White-labeling**: Creating a sub-account for each client of a user.
- **Cost Control**: Creating sub-accounts for different sectors within an organization.

Sub-accounts allow custom domains with the user's brand, and users can grant access to their clients.

The slave nodes also run a [my.saas](https://github.com/leandrosardi/my.saas) platform with the following extensions:

- [mass.commons](https://github.com/massprospecting/mass.commons)
- [mass.subaccount](https://github.com/massprospecting/mass.subaccount)

Each slave node has its own `config.rb` file and runs a local PostgreSQL database. Communication between the **master** and **slave** nodes is done via APIs.

### Worker Nodes

The **worker nodes** handle tasks for each profile assigned to them, such as:

- Managing **LinkedIn** and **Facebook** profiles.
- Running **email verification** or **MTA outreach** processes.

Profiles are executed by the [mass-sdk](https://github.com/massprospecting/mass-sdk). Communication between the mass-sdk and slave nodes is done via APIs.

## 2. Processes

### Master Node

| Process                               | Description                                                                                       |
|---------------------------------------|---------------------------------------------------------------------------------------------------|
| nginx                                 | Nginx is used as a reverse proxy, listening on port 443 (https) and redirecting to port 3000 (http). |
| app.rb (port=3000)                    | A [Sinatra web server](https://sinatrarb.com/) that serves the platform's webpages.               |
| extensions/mass.account/p/allocate.rb | Finds an available slave node and signs up a sub-account there.                                   |
| ipn.rb                                | Part of the [my.saas i2p extension](https://github.com/leandrosardi/i2p), used for processing PayPal transactions. |
| expire.rb                             | Removes credits from users who are no longer subscribed (part of the i2p extension).              |
| baddebt.rb                            | Cancels subscriptions for users failing payment (details [here](https://github.com/ConnectionSphere-DEPRECATED/cs-issues/issues/69)). |
| movement.rb                           | Updates the snapshot table to show the net balance of accounts.                                   |

### Slave Nodes

| Process                                  | Description                                                                                         |
|------------------------------------------|-----------------------------------------------------------------------------------------------------|
| nginx                                    | Nginx acts as a reverse proxy, listening on port 443 (https) and redirecting to port 3000 (http).   |
| app.rb (port=3000)                       | A [Sinatra web server](https://sinatrarb.com/) serving the platform's webpages.                     |
| extensions/mass.subaccount/p/ingest.rb   | Moves records from the `import` table to the `import_row` table.                                    |
| extensions/mass.subaccount/p/import.rb   | Processes each record in `import_row` and merges them into the `lead` table.                        |
| extensions/mass.subaccount/p/plan.rb     | Creates requests for inbox checks, connection checks, jobs, enrichment, and outreach.               |
| extensions/mass.subaccount/p/rule.rb     | Handles active rules, triggers records, evaluates filters, and manages outreach, enrichment, and tagging actions. |
| extensions/mass.subaccount/p/timeline.rb | Manages a snapshot of the `timeline` table for tracking performance statistics.                     |

### Worker Nodes

| Process                                 | Description                                                                                         |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------|
| extensions/mass.subaccount/p/launch1.rb | Retrieves a list of basic profiles assigned to the worker node and launches a `basic.rb` process for each profile. |
| extensions/mass.subaccount/p/launch2.rb | Retrieves a list of MTA, API, or RPA profiles assigned to the worker node and launches a `profile.rb` process for each. |
