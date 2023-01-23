#!/bin/bash

useradd -m -s /usr/bin/bash j
echo j:j | chpasswd
usermod -aG sudo j
usermod -aG docker j