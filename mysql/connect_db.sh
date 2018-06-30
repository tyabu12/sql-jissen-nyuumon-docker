#!/bin/bash

set -eu

cd `dirname $0`
. ../.env

DB_CONTAINER_NAME="${DB_CONTAINER_NAME_PREFIX}-mysql"

docker exec -it $DB_CONTAINER_NAME mysql -uroot -p${DB_ROOT_PASSWORD}

