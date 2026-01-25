#!/bin/bash
sudo -v
mkdir -p $HOME/.cache/vpn

if ip -br addr | grep -q tun; then
    read -p "VPN is current active do you want to disconnect? [y/n]: " DISCONNECT
    if [ "$DISCONNECT" = "y" ]; then
        sudo killall openvpn
        echo "Vpn disconnected"
    fi
else
    exec sudo openvpn --config $HOME/.config/vpnconfig/vpnconfig.ovpn --log $HOME/.cache/vpn/vpn.log &
    sleep 2
    echo "Vpn connected"
    ip -br addr
fi

