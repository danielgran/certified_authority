#!/bin/bash

# Be sure to exec this script from this path.

# Change the directory to the name of the intermediate
name="comgrandanielcertificationcheck"
rm -rf ./$name
mkdir $name

# Create the private key with a generated password
openssl genrsa -out ./$name/private.pem 4096

# Create the request itself
openssl req -new -config configuration.cfg -key ./$name/private.pem -out ./$name/request.csr