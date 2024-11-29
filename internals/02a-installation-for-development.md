# Installation for Development

This section is about how to install a MassProspecting on your local computer **for development** using [BlackOps](https://github.com/leandrosardi/blackops).

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
GIT_OASSWORD = '<write here>'

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
ruby install.rb --root --node=test2
```

## 4. Deploy source code in `master`

The command below will update the version of MassProspecting, including:

- source code,
- Ruby gems.

```
cd ~/code1/blackops/cli
ruby deploy.rb --node=test2
```

## 5. Run SQL migrations in `master`

You have to run database migrations too:

```
ruby migrations.rb --node=test2
```

## 6. Starting `master`

The command below will start the MassProspecting webserver and other backend processes.

```
cd ~/code1/blackops/cli
ruby start.rb --node=test2 --root
```

If the website doesn't go online, access to the node via ssh 

```
ruby ssh.rb test2
```

and run the following command:

```
sudo journalctl -u mysaas_app.service -f
```

## 7. Stopping `master`

```
cd ~/code1/blackops/cli
ruby stop.rb --node=test2 --root
```
