#!/bin/bash

path="$(dirname -- "$0")"

for f in "$path/init/*.sh"; do
    /bin/bash $f
done