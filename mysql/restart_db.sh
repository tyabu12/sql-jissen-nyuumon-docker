#!/bin/bash

set -eu

echo "Rrestarting db container ..."

cd `dirname $0`
. ../.env

RUNNING_ID=$(docker ps -q -f "name=${DB_CONTAINER_NAME}")
if [ -n "$RUNNING_ID" ]; then
  docker stop $RUNNING_ID
fi

docker run \
  --name $DB_CONTAINER_NAME \
  --rm \
  -d \
  -v "`pwd`/my.cnf:/etc/mysql/conf.d/my.cnf:ro" \
  -v "`pwd`/initdb.d:/docker-entrypoint-initdb.d:ro" \
  -e MYSQL_ROOT_PASSWORD=$DB_ROOT_PASSWORD \
  -p "3306:3306" \
  mysql:8 \
  --character-set-server=utf8mb4 \
  --collation-server=utf8mb4_unicode_ci

echo "done!"

