# Installation

This section is about how to install a MassProspecting environment.

For **production environment**, you will need 3 nodes as minimum:

- one master,
- one slave, and
- one worker.

For **development environment**, you can run master, slaves and workers in your local computer.

1. [Environment](#1-environment)
2. [Databases](#2-databases)
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

In your local environment, all the component will be stored in the `~/code` folder.

```
ruby install.rb github_username=<your github username here> github_password=<your github password here> secrets=yes
```

The `secrets` parameter will clone the [secret](https://github.com/massprospecting/secret) repository and copy the configuration file of each component. This is explaned better in the next section.

**Production Environments**

In production environments, you have to choose which component you install on each node.

In the master node, run this command:

```
ruby install.rb github_username=<your github username here> github_password=<your github password here> component=master secrets=yes
```

In the slave nodes, run this command:

```
ruby install.rb github_username=<your github username here> github_password=<your github password here> component=slave secrets=yes
```

In the worker nodes, run these command:

```
ruby install.rb github_username=<your github username here> github_password=<your github password here> component=slave secrets=yes
```

```
ruby install.rb github_username=<your github username here> github_password=<your github password here> component=sdk secrets=yes
```

**Command Line Parameters**

| Name            | Mandatory | Description                                                                                                          | Type                                             | Default             |
|-----------------|-----------|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|---------------------|
| `component`     | false     | Name of the component you want to install. Leave blank to install all components. E.g., `master`. Default: `'-'`.     | `BlackStack::SimpleCommandLineParser::STRING`    | `'-'`               |
| `ask`           | false     | Show warning messages and ask the user to continue or not. Default: `true`.                                          | `BlackStack::SimpleCommandLineParser::BOOL`      | `true`              |
| `secrets`       | false     | Download the configuration file of the component. Existing configuration file will be overwritten. Default: `true`.   | `BlackStack::SimpleCommandLineParser::BOOL`      | `true`              |
| `update`        | false     | Update source code by running `git fetch` and `git update` commands. Default: `false`.                               | `BlackStack::SimpleCommandLineParser::BOOL`      | `false`             |
| `verbose`       | false     | Show the output of the commands executed. Default: `false`.                                                           | `BlackStack::SimpleCommandLineParser::BOOL`      | `false`             |
| `output`        | false     | File where to redirect the output of all the commands executed. Default: `deploy-output.log`.                         | `BlackStack::SimpleCommandLineParser::STRING`    | `deploy-output.log` |
| `github_username`| true     | GitHub username to access the private repositories. Mandatory.                                                       | `BlackStack::SimpleCommandLineParser::STRING`    | N/A                 |
| `github_password`| true     | GitHub password to access the private repositories. Mandatory.                                                       | `BlackStack::SimpleCommandLineParser::STRING`    | N/A                 |


## 4. Secrets

MassProspecting manages 3 configuration files:

- One `config.rb` file for the master nodes, inside the mass.master folder;
- One `config.rb` file for the slave nodes, inside the mass.slave folder;
- One `config.rb` file for the workers nodes, inside the mass-sdk folder.

The `config.rb` files are always included in the `.gitignore` files, and never submitted to the project repositories.

Instead, `config.rb` files are stored into the [secret](https://github.com/massprospecting/secret) repository, where very specific people should have access to.

To install the `config.rb` file with a component, you have to activate the `secrets` parameter when calling the `install.rb` command.

```
ruby install.rb github_username=<your github username here> github_password=<your github password here> component=master secrets=yes
```

## 5. Running Servers

## 6. Setup Integrations

## 7. Setup Marketplace

