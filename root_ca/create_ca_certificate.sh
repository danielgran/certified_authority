#!/bin/bash

name="danielgran1"

rm -rf ./$name

mkdir ./$name
mkdir ./$name/certs

touch ./$name/certs.db
touch ./$name/certs.db.attr
touch ./$name/serial
echo 01 > ./$name/serial
touch ./$name/password
echo $(openssl rand -base64 1024) > ./$name/password

# Create a private key
openssl genrsa -aes256 -passout file:./$name/password -out ./$name/private.pem 4096

# Create the certificate with the private key
openssl req -new -x509 -days 7000 -config configuration.cfg -passin file:./$name/password -key ./$name/private.pem -out ./$name/certificate.crt