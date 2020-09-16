#!/bin/bash
rm -rf tls-gen
git clone https://github.com/michaelklishin/tls-gen tls-gen
cd tls-gen/basic
make regen CN=webhook-server.webhook-demo.svc
cd result

openssl pkcs12 -in client_key.p12 -out clientCom.pem -nodes \
 -passin pass:
cat ca_certificate.pem >> clientCom.pem
cd ./..
# Copy to certs directory
cp -r result certs
