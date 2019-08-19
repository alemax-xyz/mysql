#!/bin/sh

test -f /var/lib/mysql/auto.cnf || mysqld --user="$PUSER" --initialize --init-file=/usr/share/mysql/init.sql

trap 'kill -TERM $PID; wait $PID' INT
mysqld --user="$PUSER" &
PID=$!
wait $PID
