#!/bin/bash

path="$(pwd)/$(dirname -- "$0")"
echo $(pwd)
echo $(dirname -- "$0")

for f in "$path/init/*.sh"; do
    /bin/bash $f
done