sudo apt-get install -y unzip openvpn network-manager-openvpn
sudo systemctl restart systemd-networkd

unzip vpn.zip -d vpn

cp vpn/OpenVPN/vpnconfig_cert.ovpn vpnconfig.ovpn

sed -i '/$CLIENTCERTIFICATE/r .tempVpn/${USERNAME}Cert.pem' vpnconfig.ovpn
sed -i '/$PRIVATEKEY/r .tempVpn/${USERNAME}Key.pem' vpnconfig.ovpn

sed -i '/$CLIENTCERTIFICATE/d' vpnconfig.ovpn
sed -i '/$PRIVATEKEY/d' vpnconfig.ovpn

mkdir -p ~/.config/vpnconfig

cp ./vpnconfig.ovpn ~/.config/vpnconfig/



