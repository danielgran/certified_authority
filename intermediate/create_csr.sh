#!/bin/bash

# Be sure to exec this script from this path.

# Change the directory to the name of the intermediate
name="danielgran_webservices"

rm -rf ./$name

# Create necessary files
mkdir ./$name
mkdir ./$name/certs
touch ./$name/certs.db
touch ./$name/certs.db.attr
touch ./$name/serial
echo 01 > ./$name/serial
touch ./$name/password


# Create the private key with a generated password
echo $(openssl rand -base64 1024) > ./$name/password
openssl genrsa -aes256 -passout file:./$name/password -out ./$name/private.pem 4096

# Create the request itself
openssl req -new -config configuration.cfg -passin file:./$name/password -key ./$name/private.pem -out ./$name/request.csr
