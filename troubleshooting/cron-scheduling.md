# Cron Scheduling

## Scenario

An administrator needs to schedule a recurring task on a Linux system.

The objective is to configure a cron job, verify that it is executed automatically, and then remove the test job after verification.

## Checking the Cron Service

The cron service was checked using:

```bash
systemctl status cron
```

The service was active and running.

## Creating a Cron Job

A user crontab was created using:

```bash
crontab -e
```

A test job was added:

```bash
* * * * * date >> /home/gruppo/cron-test.log
```

The five scheduling fields define:

- Minute
- Hour
- Day of month
- Month
- Day of week

Using `*` in every field means that the command runs every minute.

The command:

```bash
date >> /home/gruppo/cron-test.log
```

writes the current date and time to the log file.

## Verifying the Cron Job

The crontab configuration was checked with:

```bash
crontab -l
```

After waiting for the scheduled execution, the generated file was checked using:

```bash
cat ~/cron-test.log
```

The file contained a timestamp generated automatically by cron, confirming that the scheduled task was executed successfully.

## Removing the Test Job

After verifying that cron was working correctly, the test job was removed using:

```bash
crontab -e
```

The following line was deleted:

```bash
* * * * * date >> /home/gruppo/cron-test.log
```

The configuration was then verified again with:

```bash
crontab -l
```

Only the default comment lines remained.

## Result

The cron scheduling procedure was completed successfully.

The exercise demonstrated how to:

- check the cron service
- create a user crontab
- understand cron scheduling fields
- schedule a recurring command
- verify automatic execution
- inspect the crontab configuration
- remove a scheduled task
