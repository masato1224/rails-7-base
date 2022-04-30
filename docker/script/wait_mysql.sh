#!/bin/sh

set -ex

host="$DATABASE_HOST"
user="$DATABASE_USERNAME"
pass="$DATABASE_PASSWORD"
cmd="$@"

echo "Waiting for mysql"
until mysql -h"$host" -u"$user" -p"$pass" -e"SHOW DATABASES;" 1> /dev/null 2> /dev/null
do
  echo -n "."
  sleep 1
done

echo "MySQL is up - executing command"

exec $cmd