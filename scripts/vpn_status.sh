#!/bin/bash
if ip -br addr | grep -q tun; then
    echo '{ "text" : "VPN: ON", "class": "active"}'
    exit 0
else
    echo '{ "text" : "VPN: OFF", "class": "inactive"}'
    exit 0
fi
