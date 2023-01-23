#!/bin/bash

docker compose up -d
container=$(docker ps --format "{{.Names}}" | grep minecraft)
is_running_cmd="docker container inspect "$container" -f '{{.State.Status}}'"

until ! -z eval $is_running_cmd
do
    sleep 1
done

mkdir ./minecraft-data/scripts
cp -r ./scripts/* ./minecraft-data/scripts
docker exec $container bash /data/scripts/init.sh
