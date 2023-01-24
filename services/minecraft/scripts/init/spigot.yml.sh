#!/bin/bash

file=/data/spigot.yml

rp() {
    sed -i "s/$1: [[:digit:]]\+/$1: $2/" $file
}

rp "save-user-cache-on-stop-only" true
rp "tile" 1000
rp "entity" 1000
rp "mob-spawn-range" 4 # For xp farm higher is better
rp "animals" 16
rp "monsters" 24
rp "misc" 8
rp "tick-inactive-villagers" false
rp "item" 4 # Anoyying
rp "exp" 6
rp "nerf-spawner-mobs" true
#rp "item-despawn-rate" 1200 #Use clearLag plugin instead
rp "arrow-despawn-rate" 120