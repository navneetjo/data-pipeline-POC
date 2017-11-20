#!bin/bash

echo "Enter the command"
echo $(aws s3 cp s3://dentsu-poc-navneet/Data-Pipeline-POC/module/hello.py /tmp/)
echo $(sudo chmod 666 /tmp/hello.py)
echo $(python /tmp/hello.py)
echo "I am here"
exit 0