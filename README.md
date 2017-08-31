## Mysql docker image
MySQL is a widely used, open-source relational database management system (RDBMS).

This image is based on official mysql client and server packages for Ubuntu Xenial and is built on top of [clover/perl-base](https://hub.docker.com/r/clover/perl-base/).

Data volume is located at `/var/lib/mysql`. It will be initialized with `/usr/share/mysql/init.sql` on the first run with no password set to `root` user.
