#!/bin/bash

if [[ "$1" = '' ]]; then
	echo "parameter password is required"
	exit 0
fi

export PASSWORD="$1"
export USERNAME=$(hostnamectl --static)


mkdir -p "$HOME/.config/vpnconfig"

openssl genrsa -out "$HOME/.config/vpnconfig/caKey.pem" 2048
openssl req -x509 -new -nodes -key "$HOME/.config/vpnconfig/caKey.pem" -subj "/CN=VPN CA" -days 3650 -out "$HOME/.config/vpnconfig/caCert.pem"

openssl x509 -in "$HOME/.config/vpnconfig/caCert.pem" -outform der | base64 -w0 | tee -a "$HOME/.config/vpnconfig/clientCert_base64.txt" | xclip -selection clipboard

# Generate a private key
openssl genrsa -out "$HOME/.config/vpnconfig/${USERNAME}Key.pem" 2048

# Generate a CSR (Certificate Sign Request)
openssl req -new -key "$HOME/.config/vpnconfig/${USERNAME}Key.pem" -out "$HOME/.config/vpnconfig/${USERNAME}Req.pem" -subj "/CN=${USERNAME}"

# Sign the CSR using the CA certificate and CA key
openssl x509 -req -days 365 -in "$HOME/.config/vpnconfig/${USERNAME}Req.pem" -CA "$HOME/.config/vpnconfig/caCert.pem" -CAkey "$HOME/.config/vpnconfig/caKey.pem" -CAcreateserial -out "$HOME/.config/vpnconfig/${USERNAME}Cert.pem" -extfile <(echo -e "subjectAltName=DNS:${USERNAME}\nextendedKeyUsage=clientAuth")
openssl verify -CAfile "$HOME/.config/vpnconfig/caCert.pem" "$HOME/.config/vpnconfig/caCert.pem" "$HOME/.config/vpnconfig/${USERNAME}Cert.pem"

mv "$HOME/.config/vpnconfig/${USERNAME}Key.pem" "$HOME/.config/vpnconfig/key.pem"
mv "$HOME/.config/vpnconfig/${USERNAME}Cert.pem" "$HOME/.config/vpnconfig/cert.pem"

echo -----------------------------------------------
echo "base64 cert has been copied to clipboard"
echo "key has been moved to $HOME/.config/vpnconfig/key.pem"
echo "cert has been moved to $HOME/.config/vpnconfig/cert.pem"
echo -----------------------------------------------

exec "$HOME/dotfiles/vpnConfig.sh"



