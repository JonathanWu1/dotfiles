#!/bin/bash

if [[ "$1" = '' ]]; then
	echo "parameter password is required"
	exit 0
fi

export PASSWORD="$1"
export USERNAME=$(hostnamectl --static)

sudo apt install -y strongswan strongswan-pki libstrongswan-extra-plugins libtss2-tcti-tabrmd0 openvpn network-manager-openvpn

sudo systemctl restart systemd-networkd

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash


openssl x509 -in caCert.pem -outform der | base64 -w0 ; echo

ipsec pki --gen --outform pem > "${USERNAME}Key.pem"
ipsec pki --pub --in "${USERNAME}Key.pem" | ipsec pki --issue --cacert caCert.pem --cakey caKey.pem --dn "CN=${USERNAME}" --san "${USERNAME}" --flag clientAuth --outform pem > "${USERNAME}Cert.pem"

openssl pkcs12 -in "${USERNAME}Cert.pem" -inkey "${USERNAME}Key.pem" -certfile caCert.pem -export -out "${USERNAME}.p12" -password "pass:${PASSWORD}"


cp "${USERNAME}.p12" "${USERNAME}.pfx"

openssl pkcs12 -in "${USERNAME}.pfx" -nodes -out "profileinfo.txt"
