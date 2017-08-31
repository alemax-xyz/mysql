#!/bin/sh

if [ ! -f /var/lib/mysql/auto.cnf ]; then
    mysqld --user=root --initialize-insecure --init-file=/usr/share/mysql/init.sql
fi

mysqld --user=root
