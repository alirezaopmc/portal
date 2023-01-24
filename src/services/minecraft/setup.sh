#!/bin/bash

docker compose up -d
container=$(docker ps --format "{{.Names}}" | grep minecraft)
is_running_cmd="docker container inspect "$container" -f '{{.State.Health.Status}}'"


until [[ $(eval $is_running_cmd) == *"healthy"* ]]
do
    sleep 5
done

path="$(pwd)/$(dirname -- "$0")"

mkdir "$path/minecraft-data/scripts"
cp -r "$path/scripts/" "$path/minecraft-data/"
docker exec $container bash /data/scripts/init.sh
