#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  exec sudo "$0" "$@"
fi

ifconfig  enp5s0

sleep 2

macchanger -r enp5s0

sleep 2

macchanger -s enp5s0
