# smartschedule
Scheduled S.M.A.R.T. tests and reports (Debian package).

A script to easily start a long S.M.A.R.T. test on all the disks and
report the status of the latest tests.

Also has a crontab entry to start a test on every Monday at 02:01 AM and
to create a report 6 hours later. The output of the test is directed to
stdout so it should be received by the recipient of cron generated
e-mails.

## Usage

**smartschedule start**

Enables the S.M.A.R.T. on all disks and starts an Extended Self Test (or
"background long" self-test) immediately.


**smartschedule report**

It reports the results of all tests for each disks in a short form and
then and the smart infos.


**smartschedule quickreport**

Checks all disks for all the reports ran and prints the overall status,
"1" if there were no failed self-tests for any of the disk, "2"
otherwise.
