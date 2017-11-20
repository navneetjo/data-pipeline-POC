#!bin/bash

echo "copy file from s3"
echo $(aws s3 cp s3://dentsu-poc-navneet/Encryption-POC/encrypted.asc /home/ubuntu/test/encryption-POC/)
echo "decrypting file"
echo $(cat encrypted.asc | base64 -d > decrypted64.asc)
echo $(aws kms decrypt --region us-east-1 --ciphertext-blob fileb://decrypted64.asc --output text --query Plaintext | base64 -d > password.txt)
echo "successfully decrypted"
