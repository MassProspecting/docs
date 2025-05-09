# Installation

This section is about how to install a MassProspecting **on production** using [BlackOps](https://github.com/leandrosardi/blackops).

## Some Notes Before Starting

- For a steady installation of MassProspecting, perform this procedure into a FRESH installation of **Ubuntu 20.04**

- If you want to install MassProspecting your local computer **for development**, refer to [this article](./02a-installation-for-development.md).

- In order to understand the whole picture, we recommend you to read this artichle about [the architecture of MassProspecting](https://github.com/MassProspecting/docs/blob/main/internals/01-architecture.md) before starting.

- The SSH service in your node must accept `root` connections. 
To enable `root` connections, follow the steps below in your node:

1. Open `sshd_config` for edition:
```
sudo nano /etc/ssh/sshd_config
```

2. Edit this line in `sshd_config`:
```
PermitRootLogin yes
```

3. Restart SSH
```
sudo systemctl restart ssh
```

## 1. Download the `saas` command:

BlackOps works on 

1. Ubuntu 20.04,
2. Ubuntu 22.04.

**Ubuntu 20.04**

```
wget https://github.com/leandrosardi/blackops/raw/refs/heads/main/bin/saas--ubuntu-20.04
sudo mv ./saas--ubuntu-20.04 /usr/bin/saas
sudo chmod 777 /usr/bin/saas
```

**Ubuntu 22.04**

```
wget https://github.com/leandrosardi/blackops/raw/refs/heads/main/bin/saas--ubuntu-22.04
sudo mv ./saas--ubuntu-22.04 /usr/bin/saas
sudo chmod 777 /usr/bin/saas
```

## 2. Setup your `BlackOpsFile`

Ask your team leader of the `BlackOpsFile`, and place it into your folder `~/code1/blackops/cli`.

Also, setup the path of your `BlackOpsFile`:

```
export OPSLIB=~/code1/blackops/cli
```

**Note:** Such a `BlackOpsFile` will have the parameters of some VPSs rented to [Contabo](https://contabo.com/), with a fresh installation of **Ubuntu 20.04**, and assigned to you for your development tasks.

## 3. Install the `master` node into a Contabo VPS

The **installation** is for getting all the software pieces required for running MassProspecting, like Ruby and PostgreSQL.

**Note:** 

- The installation requires the `--root` argument to connect the server as `root`. 

- The installation will create a new Linux user `blackstack` who is the user you will work with furtherly.

```
saas install --root --node=master
```

## 4. Deploy source code in `master`

The command below will update the version of MassProspecting, including:

- source code,
- Ruby gems.

```
saas deploy --node=master
```

## 5. Run SQL migrations in `master`

You have to run database migrations too:

```
saas migrations --node=master
```

## 6. Starting `master`

The command below will start the MassProspecting webserver and other backend processes.

```
saas start --node=master --root
```

If the website doesn't go online, access to the node via ssh 

```
saas ssh master
```

and run the following command:

```
sudo journalctl -u mass_master_app.service -f
```

## 7. Stopping `master`

```
saas stop --node=master --root
```

## 8. Setting up slave nodes

For setting up **slave nodes**, you have to follow the same steps than the master:

```
saas install --root --node=s* && \
saas deploy --node=s* && \
saas migrations --node=s* && \
saas start --node=s* --root
```

## 9. Setting up worker nodes

For setting up **worker nodes**, you have to follow the same steps than the master, except running migrations.

```
saas install --root --node=w* && \
saas deploy --node=w* && \
saas start --node=w* --root
```

## 10. Initialization

Ask your team leader for the **submit1.rb** script, for initializing:

1. channels,
2. profile types,
3. enrichment types; and
4. outreach types.

```
ruby submit1.rb
```

Then, ask your team leader for the **submit2.rb** script, for inserting some profiles:

The **submit2.rb** script requires access to the source code of the different profile types. 

So you need to download the source code of [mass-sdk](https://github.com/massprospecting/mass-sdk) in your local computer:

```
mkdir -p ~/code1
cd ~/code1
git https://github.com/massprospecting/mass-sdk
mv ./mass-sdk ./sdk
```

Then, you have to add such a path in your environment variable `RUBYLIB`:

```
export RUBYLIB=~/code1/sdk
ruby submit2.rb
```

