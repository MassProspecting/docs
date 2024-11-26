# Installation

This section is about how to install a MassProspecting environment using [BlackOps](https://github.com/leandrosardi/blackops).

## 1. Download BlackOps scripts in your computer

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
ruby install.rb --root --node=test2
```

## 4. Deploy source code in `master`

```
cd ~/code1/blackops/cli
ruby deploy.rb --node=test2
```

## 5. Starting `master`

