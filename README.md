# smartschedule
Scheduled S.M.A.R.T. tests and reports (Debian package).

A script to easily start a long S.M.A.R.T. test on all the disks and
report the status of the latest tests.

Also has a crontab entry to start a test on every Monday at 02:01 AM and
to create a report 6 hours later. The output of the test is directed to
stdout so it should be received by the recipient of cron generated
e-mails.
