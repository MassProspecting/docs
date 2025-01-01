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

## 1. Download BlackOps scripts in your computer

For installing [MassProspecting](https://github.com/massprospecting) in any server, you need the [BlackOps](https://github.com/leandrosardi/blackops) scripts:

```
mkdir -p ~/code1
cd ~/code1
git clone https://github.com/leandrosardi/blackops
```

You should update required gems too:

```
cd ~/code1/blackops
bundler update
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
cd ~/code1/blackops/cli
ruby install.rb --root --node=master
```

## 4. Deploy source code in `master`

The command below will update the version of MassProspecting, including:

- source code,
- Ruby gems.

```
cd ~/code1/blackops/cli
ruby deploy.rb --node=master
```

## 5. Run SQL migrations in `master`

You have to run database migrations too:

```
ruby migrations.rb --node=master
```

## 6. Starting `master`

The command below will start the MassProspecting webserver and other backend processes.

```
cd ~/code1/blackops/cli
ruby start.rb --node=master --root
```

If the website doesn't go online, access to the node via ssh 

```
ruby ssh.rb master
```

and run the following command:

```
sudo journalctl -u mass_master_app.service -f
```

## 7. Stopping `master`

```
cd ~/code1/blackops/cli
ruby stop.rb --node=master --root
```

## 8. Setting up `slave`

For setting up **slave node**, you have to follow the same steps than the master:

```
cd ~/code1/blackops/cli && \
	ruby install.rb --root --node=slave && \
	ruby deploy.rb --node=slave && \
	ruby migrations.rb --node=slave && \
	ruby start.rb --node=slave --root
```