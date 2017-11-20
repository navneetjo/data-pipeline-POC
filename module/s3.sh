#!/bin/bash
set -e
cd /tmp/
sudo apt-get update -y
sudo apt-get install python3 -y
sudo apt-get install awscli -y
sudo aws s3 cp s3://dentsu-poc-navneet/Data-Pipeline-POC/module/master-slave-ip.py /tmp/
sudo chmod 666 master-slave-ip.py
sudo apt install python3-pip -y
sudo pip3 install boto3
python3 master-slave-ip