#!/bin/bash

# RasPi Auto Config Script - Update Stage
# Developed by Joe Izzard (Obigeek)
# Version: 1.0.1

 # Orange
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m'

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
echo 'Stage 1'
echo 'Version: 1.0.1'
echo -e "Status: ${ORANGE}Alpha${NC}"
echo '----------------------------------------------------------------------------------------------------'

echo ""
echo "----- Update -----"
echo -n "Updating: "
apt-get update -qq
apt-get upgrade -qq

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
echo 'Version: 1.0.1'
echo -e "Status: ${ORANGE}Alpha${NC}"
echo '----------------------------------------------------------------------------------------------------'
echo ''

echo "----- Update -----"
echo -n "Update: "
echo -e "${GREEN}[Complete]${NC}"
echo '----------------------------------------------------------------------------------------------------'
echo -n "The Raspberry Pi needs to Reboot before continuing. Do you want to reboot now? [y/n]"
read reboot_reply

if [[ $reboot_reply =~ [Yy]$ ]]; then
  reboot
else
  exit
fi
