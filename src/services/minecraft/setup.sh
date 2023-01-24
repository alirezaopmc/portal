#!/bin/bash

docker compose up -d
container=$(docker ps --format "{{.Names}}" | grep minecraft)
is_running_cmd="docker container inspect "$container" -f '{{.State.Status}}'"

echo $(eval $is_running_cmd)

until eval $is_running_cmd
do
    sleep 1
done

path="$(pwd)/$(dirname --"$0")"

mkdir "$path/minecraft-data/scripts"
cp -r "$path/scripts/*" "$path/minecraft-data/scripts"
docker exec $container bash /data/scripts/init.sh
