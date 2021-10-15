#/bin/bash

name="comgrandanielcertificationcheck"
intermediate="danielgran_webservices"

openssl ca -create_serial -config configuration.cfg -passin file:./$intermediate/password -in ../ssl/$name/request.csr -out ../ssl/$name/certificate.crt -notext
