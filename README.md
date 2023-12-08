## Mysqld docker image
MySQL is a widely used, open-source relational database management system (RDBMS).

This image is based on official mysql server packages and is built on top of [clover/common](https://hub.docker.com/r/clover/common/).

### Data volumes
| Location | Description |
|---|---|
| `/var/lib/mysql` | MySQL data directory, will be initialized with `/usr/share/mysql/init.sql` on the first, `root` password will be generated |

### Exposed ports
| Port | Description |
|---|---|
| 3306 | TCP port _mysqld_ is listening on |

### Enviroment variables
| Name | Default value | Description |
|---|---|---|
| `PUID` | `50` | Desired _UID_ of the process owner _*_ |
| `PGID` | primary group id of the _UID_ user (`50`) | Desired _GID_ of the process owner _*_ |

_*_ `PUID`/`PGID` could be used to preserve data volume ownership on host.

### Configuration files
| Location | Description |
|---|---|
| `/etc/mysql/conf.d/` | _mysql_ configuration directory, all files within will be included by `/etc/mysql/my.cnf` |
