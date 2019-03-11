#!/usr/bin/env bash
rm private_key.pem
rm public_key.pem
rm ash256.enc
rm solomon.png
rm ash256.sha
rm ash256.dec
rm ash256.signed
wget -O ./solomon.png  https://upload.wikimedia.org/wikipedia/commons/a/a2/Dore_Solomon_Proverbs.png
openssl genrsa -out private_key.pem 2048
openssl rsa -pubout -in private_key.pem -out public_key.pem
cat solomon.png | sha256sum >> ash256.sha
cat ash256.sha | openssl rsautl -inkey private_key.pem -sign > ash256.signed
openssl rsautl -inkey public_key.pem -pubin -in ash256.signed -out ash256.dec
ash1="$(cat ash256.sha)"
ash2="$(cat ash256.dec)"

if [[ $ash1 == $ash2 ]]; then
  echo "Valid signature"
else
  echo "Error signatute"
fi
