#!/bin/bash

bash <(curl -s https://raw.githubusercontent.com/alirezaopmc/portal/main/src/security/disable_root_login.sh)
bash <(curl -s https://github.com/alirezaopmc/portal/raw/main/src/install/docker.sh)
bash <(curl -s https://github.com/alirezaopmc/portal/raw/main/src/misc/adduser_j.sh)