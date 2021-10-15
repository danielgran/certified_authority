#!/bin/bash

ca_name="danielgran1"
intermediate_name="danielgran_webservices"


openssl ca -create_serial -config configuration.cfg -passin file:./$ca_name/password -keyfile ./$ca_name/private.pem -cert ./$ca_name/certificate.crt -in ../intermediate/$intermediate_name/request.csr -out ../intermediate/$intermediate_name/certificate.crt -notext
