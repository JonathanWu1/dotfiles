#!/bin/bash

if [[ "$1" = '' ]]; then
	echo "parameter password is required"
	exit 0
fi

export PASSWORD="$1"
export USERNAME=$(hostnamectl --static)

mkdir -p .tempVpn
cd .tempVpn

openssl genrsa -out caKey.pem 2048
openssl req -x509 -new -nodes -key caKey.pem -subj "/CN=VPN CA" -days 3650 -out caCert.pem

openssl x509 -in caCert.pem -outform der | base64 -w0 && echo

# Generate a private key
openssl genrsa -out "${USERNAME}Key.pem" 2048

# Generate a CSR (Certificate Sign Request)
openssl req -new -key "${USERNAME}Key.pem" -out "${USERNAME}Req.pem" -subj "/CN=${USERNAME}"

# Sign the CSR using the CA certificate and CA key
bash -c 'openssl x509 -req -days 365 -in "${USERNAME}Req.pem" -CA caCert.pem -CAkey caKey.pem -CAcreateserial -out "${USERNAME}Cert.pem" -extfile <(echo -e "subjectAltName=DNS:${USERNAME}\nextendedKeyUsage=clientAuth")'

openssl verify -CAfile caCert.pem caCert.pem "${USERNAME}Cert.pem"

cd ..
