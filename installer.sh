#!/bin/bash

# RasPi Auto Config Script - Install Stage
# Developed by Joe Izzard (Obigeek)
# Version: 1.0.1

 # Orange
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m'


echo -e "${ORANGE}"
# Output Script Info
cat<<"EOF"
   ____  __    _                 __
  / __ \/ /_  (_)___ ____  ___  / /__
 / / / / __ \/ / __ `/ _ \/ _ \/ //_/
/ /_/ / /_/ / / /_/ /  __/  __/ ,<
\____/_.___/_/\__, /\___/\___/_/|_|
             /____/
EOF
echo -e "${NC}"
echo 'Raspberry Pi Auto Configuration Script'
echo 'Install - Master Branch'
echo 'Version: 1.0.1'
echo -e "Status: ${ORANGE}Alpha${NC}"
echo '----------------------------------------------------------------------------------------------------'

echo '----- Downloading -----'
echo -n "Download Configuration? [y/n]: "
read download_conf
if [[ $download_conf =~ [Yy]$ ]]; then
  wget -o install.sh https://raw.githubusercontent.com/Obigeek/Pi_AutoSetup/master/config_settings.conf
fi

wget -o install.sh https://raw.githubusercontent.com/Obigeek/Pi_AutoSetup/master/install.sh
wget -0 setup.sh https://raw.githubusercontent.com/Obigeek/Pi_AutoSetup/master/setup.sh

clear

echo -e "${ORANGE}"
# Output Script Info
cat<<"EOF"
   ____  __    _                 __
  / __ \/ /_  (_)___ ____  ___  / /__
 / / / / __ \/ / __ `/ _ \/ _ \/ //_/
/ /_/ / /_/ / / /_/ /  __/  __/ ,<
\____/_.___/_/\__, /\___/\___/_/|_|
             /____/
EOF
echo -e "${NC}"
echo 'Raspberry Pi Auto Configuration Script'
echo 'Install'
echo 'Version: 1.0.1'
echo -e "Status: ${ORANGE}Alpha${NC}"
echo '----------------------------------------------------------------------------------------------------'
echo ''
echo '----- Downloading -----'
echo -e "Download: ${GREEN}[Complete]${NC}"
echo ''
echo '----------------------------------------------------------------------------------------------------'
echo -n "Continue? [y/n]: "
read continue_reply
if [[ $continue_reply =~ [Yy]$ ]]; then
  bash update.sh
else
  exit
fi
