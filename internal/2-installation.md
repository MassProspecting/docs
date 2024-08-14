# Installation

This section is about how to install a MassProspecting environment.

For **production environment**, you will need 3 nodes as minimum:

- one master,
- one slave, and
- one worker.

For **development environment**, you can run master, slaves and workers in your local computer.

1. [Environment](#1-environment)
2. [Database](#2-database)
3. [Source Code](#3-source-code)

## 1. Environment

Into a fresh installation of Ubuntu 20.04, install our **standard environment** by following [this tutorial](https://github.com/leandrosardi/environment).

## 2. Databases

When you ran the script to install our [standard environment](https://github.com/leandrosardi/environment), you chosen the password of the `blackstack` linux-user under you will run the platform.

```
bash install.ubuntu.20_04.sh <hostname> <password>
```

Such a username and password is also valid to access the PostgreSQL installed in your database.

You can use a database tool like [DBeaver](https://dbeaver.io/) to connect PostgreSQL.

![Connecting MassProspecting Database with DBeaver](/assets/internal/2-1.png)

Setup your connection to see all databases running in the server.

![Connecting MassProspecting Database with DBeaver](/assets/internal/2-2.png)

**Local Environments**

If you are installing your local environment, both databases (master and slave) are hosted by your local PostgreSQL, with names **mass.master** and **mass.slave** respectively.

![MassProspecting - Local Environment Configuration](/assets/internal/2-3.png)

**Production Environments**

If you are installing in production, 

- the master's database is hosted by the master node called **mass.master**, and 

- the slave's database is hosted by the slave node called **mass.s01**.

The name for both databases is **blackstack**.

![MassProspecting - Production Environment Configuration](/assets/internal/2-4.png)

**Initialization**

Initialize the **master** database with:

1. the my.saas migrations [hosted here](https://github.com/leandrosardi/my.saas/tree/main/sql),

2. the mass.commons migrations [hosted here](https://github.com/massprospecting/mass.commons/tree/main/sql),

3. the mass.account migrations [hosted here](https://github.com/massprospecting/mass.account/tree/main/sql),

4. the i2p migrations [hosted here](https://github.com/leandrosardi/i2p/tree/main/sql),

5. the content migrations [hosted here](https://github.com/leandrosardi/content/tree/main/sql),

6. the affiliates migrations [hosted here](https://github.com/leandrosardi/affiliates/tree/main/sql),

7. the monitoring migrations [hosted here](https://github.com/leandrosardi/monitoring/tree/main/sql),

8. the dropbox-token-helper migrations [hosted here](https://github.com/leandrosardi/dropbox-token-helper/tree/main/sql).

Initialize the **slave** database with:

1. the my.saas migrations [hosted here](https://github.com/leandrosardi/my.saas/tree/main/sql),

2. the mass.commons migrations [hosted here](https://github.com/massprospecting/mass.commons/tree/main/sql),

3. the mass.subaccount migrations [hosted here](https://github.com/massprospecting/mass.subaccount/tree/main/sql).

## 3. Source Code

For installing the source code you need access to all the repostiories of https://github.com/MassProspecting.

The required repositories of https://github.com/leandrosardi are alrady public.

The computer where you run this script should be a fresh Ubuntu 20.04 with our [standard environment](https://github.com/leandrosardi/environment) installed.

Download the script for installing the environment:

```
mkdir ~/code
cd ~/code
wget https://raw.githubusercontent.com/MassProspecting/docs/main/scripts/install.rb
```

**Local Environments**

In your local environment, all the components will be stored in the `~/code` folder.

```
ruby install.rb git_username=<your github username here> git_password=<your github password here>
```

**Production Environments**

In production environments, you have to choose which components you install on each node.

In the master node, run this command:

```
ruby install.rb git_username=<your github username here> git_password=<your github password here> component=mass.master
```

In the slave nodes, run this command:

```
ruby install.rb git_username=<your github username here> git_password=<your github password here> component=mass.slave
```

In the worker nodes, run these command:

```
ruby install.rb git_username=<your github username here> git_password=<your github password here> component=mass.slave
ruby install.rb git_username=<your github username here> git_password=<your github password here> component=mass-sdk
```

## 4. Running Servers
