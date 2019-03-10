#!/usr/bin/env bash
Str="attack at dawn"
echo "PlainText is:" ${Str}

echo ""
echo "aes-256-cbc"
echo "ToEnc Type: attack at dawn | openssl aes-256-cbc -e -pass pass:1234 -nosalt" 
echo "Result"
echo attack at dawn | openssl aes-256-cbc -e -pass pass:1234 -nosalt 
echo ""
echo "ToDec Type: attack at dawn | openssl aes-256-cbc -e -pass pass:1234 -nosalt | openssl aes-256-cbc -d -pass pass:1234 -nosalt" 
echo "Result"
echo attack at dawn | openssl aes-256-cbc -e -pass pass:1234 -nosalt | openssl aes-256-cbc -d -pass pass:1234 -nosalt

echo ""
echo "rc4"
echo "ToEnc Type: attack at dawn | openssl rc4 -e -pass pass:1234 -nosalt" 
echo "Result"
echo attack at dawn | openssl rc4 -e -pass pass:1234 -nosalt 
echo ""
echo "ToDec Type: attack at dawn | openssl rc4 -e -pass pass:1234 -nosalt | openssl rc4 -d -pass pass:1234 -nosalt" 
echo "Result"
echo attack at dawn | openssl rc4 -e -pass pass:1234 -nosalt | openssl rc4 -d -pass pass:1234 -nosalt

echo ""
echo "DES"
echo "ToEnc Type: attack at dawn | openssl DES -e -pass pass:1234 -nosalt" 
echo "Result"
echo attack at dawn | openssl DES -e -pass pass:1234 -nosalt 
echo ""
echo "ToDec Type: attack at dawn | openssl DES -e -pass pass:1234 -nosalt | openssl DES -d -pass pass:1234 -nosalt" 
echo "Result"
echo attack at dawn | openssl DES -e -pass pass:1234 -nosalt | openssl DES -d -pass pass:1234 -nosalt

echo ""
echo "DES3"
echo "ToEnc Type: attack at dawn | openssl DES3 -e -pass pass:1234 -nosalt" 
echo "Result"
echo attack at dawn | openssl DES3 -e -pass pass:1234 -nosalt 
echo ""
echo "ToDec Type: attack at dawn | openssl DES3 -e -pass pass:1234 -nosalt | openssl DES3 -d -pass pass:1234 -nosalt" 
echo "Result"
echo attack at dawn | openssl DES3 -e -pass pass:1234 -nosalt | openssl DES3 -d -pass pass:1234 -nosalt

