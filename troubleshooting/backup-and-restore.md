# Backup and Restore

## Scenario

An administrator needs to create a backup of application data before making changes to the system.

The objective is to create a compressed backup, verify its contents, simulate data loss, and restore the missing file.

## Lab Environment

A test application directory was created:

~/backup-lab/myapp

The directory contained:

- config.conf
- data.txt

## Creating the Backup

A compressed tar archive was created using:

tar -czf ~/myapp-backup.tar.gz ~/backup-lab/myapp

The command created the following backup:

~/myapp-backup.tar.gz

The message:

tar: Removing leading `/' from member names

was displayed during creation. This is normal behavior when tar removes the leading slash from stored paths.

## Verifying the Backup

The contents of the archive were checked without extracting it:

tar -tzf ~/myapp-backup.tar.gz

The archive contained:

- config.conf
- data.txt

## Simulating Data Loss

The file data.txt was deleted from the application directory:

rm ~/backup-lab/myapp/data.txt

After deletion, only config.conf remained in the directory.

## Restoring the File

The backup was extracted using:

tar -xzf ~/myapp-backup.tar.gz -C /

The -C / option was used to extract the archived paths from the correct filesystem root.

After the restore, data.txt was present again in the application directory.

## Result

The backup and recovery procedure was completed successfully.

The exercise demonstrated how to:

- create a compressed backup with tar
- verify the contents of an archive
- simulate data loss
- restore files from a backup
