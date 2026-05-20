[ -f /var/lib/mysql/auto.cnf ] || suexec mysqld --user="$PUSER" --initialize --init-file=/usr/share/mysql-8.4/init.sql || exit $?
suexec mysqld  --skip-mysqlx --skip-name-resolve --user="$PUSER" &
