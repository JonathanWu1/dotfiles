rm -rf "$HOME/.temp/vpn"
mkdir -p "$HOME/.temp/vpn"
cp "$HOME/Downloads/vpng-logineer-tunnel.zip" "$HOME/.temp/vpn/vpn.zip"

sudo pacman -Sy unzip openvpn networkmanager-openvpn
sudo systemctl restart systemd-networkd

unzip -o "./vpn.zip" -d "$HOME/.temp/vpn/vpn"

mkdir -p $HOME/.config/vpnconfig

mv $HOME/.temp/vpn/vpn/OpenVPN/vpnconfig_cert.ovpn ~/.config/vpnconfig/vpnconfig.ovpn

echo "key $HOME/.config/vpnconfig/key.pem" >> $HOME/.config/vpnconfig/vpnconfig.ovpn
echo "cert $HOME/.config/vpnconfig/cert.pem" >> $HOME/.config/vpnconfig/vpnconfig.ovpn

rm -rf "$HOME/.temp/vpn"





