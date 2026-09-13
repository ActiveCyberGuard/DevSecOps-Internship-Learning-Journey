# Backup and Restore Plan

## Objective

The objective is to protect important application data and
provide a documented recovery process.

## Backup Strategy

Important data should be backed up separately from the
primary workload.

## Backup Security

- Restrict backup access.
- Protect backup storage.
- Do not expose backups publicly.
- Avoid storing credentials in backup documentation.

## Restore Procedure

1. Identify the required backup.
2. Verify the backup.
3. Restore the data.
4. Validate the restored data.
5. Validate application functionality.
6. Document the result.

## Recovery Testing

A local backup and restore test was performed during Day 24.

## Result

The test data was successfully restored from the backup
archive.

## Recovery Principle

Backups should be tested regularly because an untested backup
cannot be assumed to be recoverable.