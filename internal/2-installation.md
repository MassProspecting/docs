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

## 2. Database

When you ran the script to install our [standard environment](https://github.com/leandrosardi/environment), you chosen the password of the `blackstack` linux-user under you will run the platform.

```
bash install.ubuntu.20_04.sh <hostname> <password>
```

Such a username and password is also valid to access the PostgreSQL installed in your database.

You can use a database tool like [DBeaver](https://dbeaver.io/) to connect PostgreSQL.

![Connecting MassProspecting Database with DBeaver](/assets/internal/2-1.png)

Setup your connection to see all databases running in the server.

![Connecting MassProspecting Database with DBeaver](/assets/internal/2-2.png)


## 3. Source Code

For installing the source code you need access to all the repostiories of https://github.com/MassProspecting.

The required repositories of https://github.com/leandrosardi are alrady public.

The computer where you run this script should be a fresh Ubuntu 20.04 with our [standard environment](https://github.com/leandrosardi/environment) installed.




```
wget ...
```
