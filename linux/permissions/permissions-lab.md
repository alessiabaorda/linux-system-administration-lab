# Linux Permissions Lab

## Scenario

A company application needs a shared directory for configuration files.

Two users need different access levels:

- Alessia needs to read and modify the files.
- Marco needs to read the files but must not modify them.
- Other users must not have access.

## Objective

Configure Linux users, groups, ownership and permissions to provide the correct level of access.

## Analysis

First, I checked the `myapp` group and verified the users and their group memberships.

Then, I created the application directory and the required files.

I assigned the files to the correct owner and group and configured the permissions according to the required access levels.

## Commands Used

```bash
getent group myapp
id alessia1
id marco1

sudo mkdir -p /opt/myapp

sudo touch /opt/myapp/config.conf
sudo touch /opt/myapp/script.sh

sudo chown alessia1:myapp /opt/myapp/config.conf /opt/myapp/script.sh
sudo chmod 640 /opt/myapp/config.conf /opt/myapp/script.sh

sudo chown alessia1:myapp /opt/myapp
sudo chmod 750 /opt/myapp
```

## Verification

I tested the permissions using the different users.

Alessia was able to read and modify the configuration file.

Marco was able to read the file but received `Permission denied` when trying to modify it.

The user `gruppo` was not able to access the file.

## Result

The final permissions were:

- Owner: read and write
- Group: read only
- Others: no access

The directory used permission `750` and the files used permission `640`.

## What I Learned

I learned how Linux permissions work with:

- users
- groups
- file ownership
- `chmod`
- `chown`
- read, write and execute permissions

I also learned how to verify permissions by testing access with different users.
