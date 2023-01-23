#!/bin/bash

file=/data/spigot.yml

rp() {
    sed -i "s/$1: [[:digit:]]\+/$1: $2/" $file
}

rp "player-max-concurrent-loads" 10
rp "target-player-chunk-send-rate" 20