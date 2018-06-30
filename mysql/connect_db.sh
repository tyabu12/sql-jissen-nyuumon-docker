#!/bin/bash

set -eu

cd `dirname $0`
. ../.env

docker exec -it $DB_CONTAINER_NAME mysql -uroot -p${DB_ROOT_PASSWORD}

