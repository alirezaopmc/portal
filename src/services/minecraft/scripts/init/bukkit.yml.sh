#!/bin/bash

file=/data/bukkit.yml

rp() {
    sed -i "s/$1: [[:digit:]]\+/$1: $2/" $file
}

rp "monsters" 30
rp "animals" 8
rp "water-animals" 5
rp "water-underground-creature" 2
rp "axolotls" 2
rp "ambient" 1
rp "period-in-ticks" 400
rp "animal-spawns" 400
rp "monster-spawns" 20
rp "water-spawns" 40
rp "water-ambient-spawns" 80
rp "water-underground-creature-spawns" 80
rp "axolotl-spawns" 80
rp "ambient-spawns" 100