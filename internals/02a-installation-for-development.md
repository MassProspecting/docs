# Installation for Development

This section is about how to install a MassProspecting on your local computer **for development** using [BlackOps](https://github.com/leandrosardi/blackops).

## Some Notes Before Starting

- For a steady installation of MassProspecting, perform this procedure into a FRESH installation of **Ubuntu 20.04**

- If you want to install MassProspecting **on production**, refer to [this article](./02-installation.md).

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

## 2. Create your `BlackOpsFile`

1. Download a `BlackOpsFile` from [this link](../assets/internals/BlackOpsFile).

```
cd ~
wget https://raw.githubusercontent.com/MassProspecting/docs/refs/heads/main/assets/internals/BlackOpsFile
```

2. Edit the `BlackOpsFile`:

```
cd ~
nano BlackOpsFile
```

3. In such a `BlackOpsFile`, edit your SSH connection parameters:

```ruby
# Setup the IP of node where you want to install the dev environment.
#
# Since BlackOps connect such a node via SSH, you can define the IP
# of a remote computer.
#
LOCAL_IP = '127.0.0.1'

# Write the root password of your local computer here
#
SSH_ROOT_PASSWORD = '<write here>'

# Write the password for the new Linux user `blackstack` that will run your server
#
SSH_PASSWORD = '<write here>'
```

**Note:** If you want to install a *development environment* into a remote computer, replace `127.0.0.1` with the IP of such a remote computer. Otherwise, keep `127.0.0.1`.

4. Also, set the password for your PostgreSQL database:

```ruby
# Write the password for the `blackstack` user of your postgresql
#
POSTGRES_PASSWORD = '<write here>'
````

5. And ask your team leader for the secret keys for connecting MassProspecting with other third-party services:

```ruby
# Git password is required for cloning/pulling souce code from your private repositories.
#
GIT_PASSWORD = '<write here>'

# The following keys are about integrations between
#
SU_API_KEY = '<write here>'
TINYMCE_API_KEY = '<write here>'
ADSPOWER_API_KEY = '<write here>'
VYMECO_API_KEY = '<write here>'
DROPBOX_REFRESH_TOKEN = '<write here>'
POSTMARK_API_KEY = '<write here>'
SMTP_USER = '<write here>'
SMTP_PASSWORD = '<write here>'
```

6. Finally, save changes and exit by pressing `CTRL+X`.

## 3. Setup the path of your `BlackOpsFile`

```
export OPSLIB=~/
```

## 4. Install the `master` node in your local computer

The **installation** is for getting all the software pieces required for running MassProspecting, like Ruby and PostgreSQL.

**Note:**

- The installation requires the `--root` argument to connect the server as `root`.

- The installation will create a new Linux user `blackstack` who is the user you will work with furtherly.

```
cd ~/code1/blackops/cli
ruby install.rb --root --node=localmaster
```

## 4. Deploy source code in `master`

The command below will update the version of MassProspecting, including:

- source code,
- Ruby gems.

```
cd ~/code1/blackops/cli
ruby deploy.rb --node=localmaster
```

## 5. Run SQL migrations in `master`

You have to run database migrations too:

```
cd ~/code1/blackops/cli
ruby migrations.rb --node=localmaster
```

## 6. Starting `master`

The command below will start the MassProspecting webserver and other backend processes.

```
cd ~/code1/blackops/cli
ruby start.rb --node=localmaster --root
```

After the command above is done, you should be able to access MassProspecting in the URL [http://127.0.0.1:3000](http://127.0.0.1:3000).

If the website doesn't go online, run the following command:

```
sudo journalctl -u mass_master_app.service -f
```

## 7. Stopping `master`

```
cd ~/code1/blackops/cli
ruby stop.rb --node=localmaster --root
```

## 8. Setting up `slave`

For setting up a **slave node** in your local computer, you have to follow the same steps than the master:

```
cd ~/code1/blackops/cli && \
	ruby install.rb --root --node=localslave && \
	ruby deploy.rb --node=localslave && \
	ruby migrations.rb --node=localslave && \
	ruby start.rb --node=localslave --root
```

After the command above is done, you should be able to access MassProspecting in the URL [http://127.0.0.1:3001](http://127.0.0.1:3001).

## 9. Setting up `worker`

For setting up a **worker node** in your local computer, you have to follow the same steps than the master except the **migrations** part.

```
cd ~/code1/blackops/cli && \
	ruby install.rb --root --node=localworker && \
	ruby deploy.rb --node=localworker && \
	ruby start.rb --node=localworker --root
```

After the command above is done, you should be able to access MassProspecting in the URL [http://127.0.0.1:3001](http://127.0.0.1:3001).

## 10. Setting the `.sandbox` Flag

When you are running a local environment, it is better you set the `.sandbox` flag.

```
sudo touch /home/blackstack/code1/master/.sandbox && \
sudo touch /home/blackstack/code1/slave/.sandbox && \
sudo touch /home/blackstack/code1/sdk/.sandbox
```

Remember to restart all services.

```
ruby stop.rb --node=* --root && \
ruby start.rb --node=* --root
```

## 11. Differences Between Environments

Aside of a **production environment**, in a **development environment**:

1. Both **master** and **slave** run in the same node.
That is why master and slave are listening different ports (`3000` and `3001`).

2. A **worker** is also running in your local computer.

3. Domain and SSL are not configured.

## 12. Initialization

Ask your team leader for the **submit1.rb** script, for initializing:

1. channels,
2. profile types,
3. enrichment types; and
4. outreach types.

```
ruby submit1.rb
```

Then, ask your team leader for the **submit2.rb** script, for initializing:

1. profile,
2. enrichment; and
3. outreach.

```
ruby submit2.rb
```