# SSH User Troubleshooting

## Scenario

A new user reported that they could not connect to the Linux server through SSH.

The task was to verify the user account, check the account status, investigate the SSH service, and test the connection.

## Objective

Determine whether the user account and SSH service were working correctly.

## Analysis

First, I checked whether the user `marco1` existed and verified its UID, GID, and group membership.

Then, I checked the password status of the account. The account had a password set and was not locked.

Next, I checked the status of the SSH service.

The `ssh.service` unit was inactive, so I checked the SSH socket.

The `ssh.socket` unit was active and listening on port 22. This showed that SSH was using socket activation and that the inactive service status did not mean that SSH was broken.

## Commands Used

    id marco1
    sudo passwd -S marco1
    systemctl status ssh
    systemctl status ssh.socket
    ssh marco1@localhost

## Verification

I tested an SSH connection using the `marco1` account.

The user was able to authenticate successfully and access the system.

## Result

The SSH service was working correctly.

The `ssh.service` unit was inactive because SSH was socket-activated.

The `ssh.socket` unit was active and listening on port 22, and the `marco1` user was able to connect successfully.

## What I Learned

I learned how to:

- Verify whether a Linux user exists
- Check the password and account status
- Check the status of the SSH service
- Understand SSH socket activation
- Verify that an SSH socket is listening
- Test an SSH connection locally
