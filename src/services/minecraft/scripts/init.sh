#!/bin/bash

for f in ./init/*.sh; do
    /bin/bash $f
done