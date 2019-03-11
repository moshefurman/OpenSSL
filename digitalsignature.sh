#!/usr/bin/env bash
echo "delete old files"
rm private_key.pem
rm public_key.pem
rm ash256.enc
rm solomon.png
rm ash256.sha
rm ash256.dec
rm ash256.signed
echo ""
echo "========================================================================================="
echo ""
echo "Step 1"
echo "Create Private And Public Key, use ash256 to the file and encrypted by privatekey"
echo ""
echo "========================================================================================="
echo ""
echo "Download Image From Web Into solomon.png"
echo "Use - wget -O ./solomon.png  https://upload.wikimedia.org/wikipedia/commons/a/a2/Dore_Solomon_Proverbs.png"
echo ""
echo "========================================================================================="
echo ""
wget -O ./solomon.png  https://upload.wikimedia.org/wikipedia/commons/a/a2/Dore_Solomon_Proverbs.png
echo ""
echo "========================================================================================="
echo ""
echo "Create Private Key as private_key.pem"
echo "Use - openssl genrsa -out private_key.pem 2048"
openssl genrsa -out private_key.pem 2048
echo ""
echo "========================================================================================="
echo ""
echo "Create Public Key as public_key.pem | note: you need generate public key from private key"
echo "Use - openssl rsa -pubout -in private_key.pem -out public_key.pem"
openssl rsa -pubout -in private_key.pem -out public_key.pem
echo ""
echo "========================================================================================="
echo ""
echo "Create ash (sha256sum) File to solomon.png Into ash256.sha"
echo "Use - cat solomon.png | sha256sum >> ash256.sha"
cat solomon.png | sha256sum >> ash256.sha
echo ""
echo "========================================================================================="
echo ""
echo "Sign ash256.sha (ash file) with the private key to get the signature Into ash256.signed"
echo "Use - cat ash256.sha | openssl rsautl -inkey private_key.pem -sign > ash256.signed"
cat ash256.sha | openssl rsautl -inkey private_key.pem -sign > ash256.signed
echo ""
echo "========================================================================================="
echo "========================================================================================="
echo ""
echo "Step 2"
echo "verify the data (ash256.sha) with the public_key"
echo ""
echo "========================================================================================="
echo ""
echo "Decrypted ash256.signed into ash25.dec with the public_Key"
echo "Use - openssl rsautl -inkey public_key.pem -pubin -in ash256.signed -out ash256.dec"
openssl rsautl -inkey public_key.pem -pubin -in ash256.signed -out ash256.dec
echo ""
echo "========================================================================================="
echo ""
echo "Step 3"
echo "Equal ash256.sha with ash256.dec"
echo ""
echo "========================================================================================="
echo ""
echo "read ash256.sha into Var ash1"
echo "Use - ash1="$(cat ash256.sha)""
ash1="$(cat ash256.sha)"
echo "read ash256.dec into Var ash2"
echo "Use - ash2="$(cat ash256.dec)""
ash2="$(cat ash256.dec)"
echo ""
echo "========================================================================================="
echo ""
echo "Equal the Variants"
echo "Use-"
echo "if [[ $ash1 == $ash2 ]]; then"
echo "  echo "Valid signature""
echo "else"
echo "  echo "Error signatute""
echo "fi"
if [[ $ash1 == $ash2 ]]; then
  echo "Valid signature"
else
  echo "Error signatute"
fi

