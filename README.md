# smartschedule
Scheduled S.M.A.R.T. tests and reports (Debian package).

A script to easily start a long S.M.A.R.T. test on all the disks and
report the status of the latest tests.

Also has a crontab entry to start a test on every Monday at 01:59 AM and
then create a report. The output is directed to stdout so it should be
received by the recipient of cron generated e-mails.


## Usage

**smartschedule start**

Enables the S.M.A.R.T. on all disks and starts an Extended Self Test (or
"background long" self-test) immediately.

Note: when running self-tests the performance of the disks drops,
especially if more than one member in a RAID array is running self-test.
See **startslow**.


**smartschedule startslow**

Enables the S.M.A.R.T. on all disks and starts an Extended Self Test (or
"background long" self-test) one after the other. It starts on the first
disk and waits until it finishes (with 24 hour timeout) and then proceeds
to the next disks one by one.


**smartschedule report**

It reports the results of all tests for each disks in a short form and
then and the smart infos.


**smartschedule quickreport**

Checks all disks for all the reports ran and prints the overall status,
"1" if there were no failed self-tests for any of the disk, "2"
otherwise.


**smartschedule startslow-and-report**

Runs a **startslow** then a **report**.

This option is in the crontab.


## License

MIT License

Copyright (c) 2015-2017 Gabor Heja

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
