## Mysql docker image

MySQL is a widely used, open-source relational database management system (RDBMS).

This image is based on official mysql server packages for debian and is built on top of [clover/common](https://hub.docker.com/r/clover/common/).

### Exposed ports
| Port | Description
| ---- | -----------
| 3306 | TCP port _mysqld_ is listening on

### Enviroment variables

| Name | Default value | Description
| ---- | ------------- | -----------
| `PUID` | _not set_ | desired user id of the process owner
| `PGID` | _not set_ | desired group id of the process pwner (primary group of the `PUID` user)
| `PUSER` | _not set_ | desired `PUID` user name
| `PGROUP` | _not set_ | desired `PGID` group name
| `CHOWN` | _not set_ | space-separated list of directories to change ownership to `PUID`/`PGID` during container startup
| `CRON` | _not set_ (`0`) | will start _cron_ inside the container if set to `1`
| `TZ` / `TIMEZONE` | _not set_ (`UTC`) | desired container timezone

### Configuration files

| Location | Description
| -------- | -----------
| `/etc/mysql/mysql.cnf/` | mani _mysql_ configuration file
| `/etc/mysql/conf.d/` | _mysql_ configuration directory, all files within will be included by `/etc/mysql/mysql.cnf`

### Supported platforms

 * `linux/amd64`;
