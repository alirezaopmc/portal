#!/bin/bash

file=/data/server.properties

rp() {
    sed -i "s/$1=[[:digit:]]\+/$1: $2/" $file
}

rp "view-distance" 6 # lower = blind
rp "online-mode" false
