#!/bin/bash

# RasPi Auto Config Script - Configuration Stage
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
echo 'Stage 2'
echo 'Version: 1.0.1'
echo -e "Status: ${ORANGE}Alpha${NC}"
echo '----------------------------------------------------------------------------------------------------'
echo ''

# Settings file?
if [ -f config_settings.conf ]; then
  source config_settings.conf
  echo -e "Settings File: ${GREEN}[Loaded]${NC}"
  conf_file=true
else
  echo -e "Settings File: ${RED}[Missing]${NC}"
  conf_file=false
  echo -n "Do you want to continue? [y/n]: "
  read cont
  if [[ $cont =~ ^[Yy]$ ]]; then
    echo "Continuing Configuration..."
  else
    echo "Aborting Configuration..."
    exit
  fi
fi

echo ""
echo "----- Raspi-config Basics -----"

# Expand Filesystem
if [ ! $conf_file = true ]; then
  echo -n "Expand Filesystem? [y/n]: "
  read expand_filesystem
  if [[ $expand_filesystem =~ [Yy]$ ]]; then
    expand_filesystem=true
  else
    expand_filesystem=false
  fi
fi

if [ $expand_filesystem = true ]; then
  raspi-config nonint do_expand_rootfs
  echo -e "Expanding Filesystem: ${GREEN}[True]${NC}"
else
  echo -e "Expanding Filesystem: ${RED}[False]${NC}"
fi

# Boot to
if [ ! $conf_file = true ]; then
  echo -n "Headless Server? [y/n]: "
  read boot_to
  if [[ $boot_to =~ [Yy]$ ]]; then
    boot_to='CLI'
  else
    boot_to='Desktop'
  fi

  echo -n "Auto Login? [y/n]: "
  read auto_login
  if [[ $auto_login =~ [Yy]$ ]]; then
    auto_login=true
  else
    auto_login=false
  fi
fi

if [ $boot_to = 'CLI' ]; then
  if [ $auto_login = true ]; then
    raspi-config nonint do_boot_behaviour B2
    echo -e "Headless Server: ${GREEN}[True]${NC}"
    echo -e "Auto Login: ${GREEN}[True]${NC}"
  else
    raspi-config nonint do_boot_behaviour B1
    echo -e "Headless Server: ${GREEN}[True]${NC}"
    echo -e "Auto Login: ${RED}[False]${NC}"
  fi
else
  if [ $auto_login = true ]; then
    raspi-config nonint do_boot_behaviour B4
    echo -e "Headless Server: ${RED}[False]${NC}"
    echo -e "Auto Login: ${GREEN}[True]${NC}"
  else
    raspi-config nonint do_boot_behaviour B3
    echo -e "Headless Server: ${RED}[False]${NC}"
    echo -e "Auto Login: ${RED}[False]${NC}"
  fi
fi

# Boot Wait?
if [ ! $conf_file = true ]; then
  echo -n "Wait for Network on Boot? [y/n]: "
  read boot_wait
  if [[ $boot_wait =~ [Yy]$ ]]; then
    boot_wait=true
  else
    boot_wait=false
  fi
fi

if [ $boot_wait = true ]; then
  raspi-config nonint do_boot_wait 1
  echo -e "Wait for Network: ${GREEN}[True]${NC}"
else
  raspi-config nonint do_boot_wait 0
  echo -e "Wait For Network: ${RED}[False]${NC}"
fi

# Splash Screen?
if [ ! $conf_file = true ]; then
  echo -n "Show Splash Screen? [y/n]: "
  read splash_screen
  if [[ $splash_screen =~ [Yy]$ ]]; then
    splash_screen=true
  else
    splash_screen=false
  fi
fi

if [ $splash_screen = true ]; then
  raspi-config nonint do_boot_splash 1
  echo -e "Show Splash Screen: ${GREEN}[True]${NC}"
else
  raspi-config nonint do_boot_splash 0
  echo -e "Show Splash Screen: ${RED}[False]${NC}"
fi


echo ''
echo "----- Interfacing Options -----"

# SSH
if [ ! $conf_file = true ]; then
  echo -n "Enable SSH? [y/n]: "
  read enable_ssh
  if [[ $enable_ssh =~ [Yy]$ ]]; then
    enable_ssh=true
  else
    enable_ssh=false
  fi
fi

if [ $enable_ssh = true ]; then
  raspi-config nonint do_ssh 1
  echo -e "SSH: ${GREEN}[Enabled]${NC}"
else
  raspi-config nonint do_ssh 0
  echo -e "SSH: ${RED}[Disabled]${NC}"
fi

# VNC
if [ ! $conf_file = true ]; then
  echo -n "Enable VNC? [y/n]: "
  read enable_vnc
  if [[ $enable_vnc =~ [Yy]$ ]]; then
    enable_vnc=true
  else
    enable_vnc=false
  fi
fi

if [ $enable_vnc = true ]; then
  raspi-config nonint do_vnc 1
  echo -e "VNC: ${GREEN}[Enabled]${NC}"
else
  raspi-config nonint do_vnc 0
  echo -e "VNC: ${RED}[Disabled]${NC}"
fi

# Camera
if [ ! $conf_file = true ]; then
  echo -n "Enable Camera? [y/n]: "
  read enable_camera
  if [[ $enable_camera =~ [Yy]$ ]]; then
    enable_camera=true
  else
    enable_camera=false
  fi
fi

if [ $enable_camera = true ]; then
  raspi-config nonint do_camera 1
  echo -e "Camera: ${GREEN}[Enabled]${NC}"
else
  raspi-config nonint do_camera 0
  echo -e "Camera: ${RED}[Disabled]${NC}"
fi

# Serial
if [ ! $conf_file = true ]; then
  echo -n "Enable Serial? [y/n]: "
  read enable_serial
  if [[ $enable_serial =~ [Yy]$ ]]; then
    enable_serial=true
  else
    enable_serial=false
  fi
fi

if [ $enable_serial = true ]; then
  raspi-config nonint do_serial 1
  echo -e "Serial: ${GREEN}[Enabled]${NC}"
else
  raspi-config nonint do_serial 0
  echo -e "Serial: ${RED}[Disabled]${NC}"
fi

# SPI
if [ ! $conf_file = true ]; then
  echo -n "Enable SPI? [y/n]: "
  read enable_spi
  if [[ $enable_spi =~ [Yy]$ ]]; then
    enable_spi=true
  else
    enable_spi=false
  fi
fi

if [ $enable_spi = true ]; then
  raspi-config nonint do_spi 1
  echo -e "SPI: ${GREEN}[Enabled]${NC}"
else
  raspi-config nonint do_spi 0
  echo -e "SPI: ${RED}[Disabled]${NC}"
fi

# I2C
if [ ! $conf_file = true ]; then
  echo -n "Enable I2C? [y/n]: "
  read enable_i2c
  if [[ $enable_i2c =~ [Yy]$ ]]; then
    enable_i2c=true
  else
    enable_i2c=false
  fi
fi

if [ $enable_i2c = true ]; then
  raspi-config nonint do_i2c 1
  echo -e "I2C: ${GREEN}[Enabled]${NC}"
else
  raspi-config nonint do_i2c 0
  echo -e "I2C: ${RED}[Disabled]${NC}"
fi

# 1 Wire
if [ ! $conf_file = true ]; then
  echo -n "Enable 1 Wire? [y/n]: "
  read enable_1wire
  if [[ $enable_1wire =~ [Yy]$ ]]; then
    enable_1wire=true
  else
    enable_1wire=false
  fi
fi

if [ $enable_1wire = true ]; then
  raspi-config nonint do_onewire 1
  echo -e "1 Wire: ${GREEN}[Enabled]${NC}"
else
  raspi-config nonint do_onewire 0
  echo -e "1 Wire: ${RED}[Disabled]${NC}"
fi

# GPIO
if [ ! $conf_file = true ]; then
  echo -n "Enable Remote GPIO? [y/n]: "
  read enable_rgpio
  if [[ $enable_rgpio =~ [Yy]$ ]]; then
    enable_rgpio=true
  else
    enable_rgpio=false
  fi
fi

if [ $enable_rgpio = true ]; then
  raspi-config nonint do_rgpio 1
  echo -e "Remote GPIO: ${GREEN}[Enabled]${NC}"
else
  raspi-config nonint do_rgpio 0
  echo -e "Remote GPIO: ${RED}[Disabled]${NC}"
fi



echo ''
echo "----- Network -----"

# Hostname
if [ ! $conf_file = true ]; then
  echo -n "Hostname? : "
  read set_hostname
fi
raspi-config nonint do_hostname $set_hostname
echo -e "Hostname: ${ORANGE}[$set_hostname]${NC}"

# Ip address
if [ ! $conf_file = true ]; then
  echo -n "Hostname? : "
  read ip_address
fi
ifconfig eth0 $ip_address
echo -e "IP: ${ORANGE}[$ip_address]${NC}"

# Netmask
if [ ! $conf_file = true ]; then
  echo -n "Netmask? : "
  read ip_netmask
fi
ifconfig eth0 netmask $ip_netmask
echo -e "Netmask: ${ORANGE}[$ip_netmask]${NC}"


echo ''
echo "----- User Account -----"

# New User
if [ ! $conf_file = true ]; then
  echo -n "New User? : "
  read new_user
fi
useradd $new_user -s /bin/bash -m -g sudo
echo -e "New User: ${ORANGE}[$new_user]${NC}"
passwd $new_user
