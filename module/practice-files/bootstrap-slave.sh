#!/bin/bash

set e

echo "########## start executing script to copy jar##########"

echo $(aws s3 cp s3://dentsu-poc-navneet/Data-Pipeline-POC/module/helloworld.jar /tmp/new/)
echo "jar is copied to /tmp/new location"

echo "providing permission to jar"
echo $(sudo chmod 777 /tmp/new/helloworld.jar)

echo "copy jar to spark jar location"
echo $(sudo cp -rf /tmp/new/helloworld.jar /usr/lib/spark/jars/)

echo "######################ending execution###############"
