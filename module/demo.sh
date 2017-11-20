#!/usr/bin/env bash
set e

echo
echo "### BEGIN ###: s3copy.sh"

echo "> Copy elephant_rele	ase.jar"
echo $(aws s3 cp s3://dentsu-poc-navneet/Data-Pipeline-POC/module/master-slave-ip.py /tmp/)
echo $(aws s3 cp s3://dentsu-poc-navneet/Data-Pipeline-POC/module/master-slave-ip.py /tmp/new/)
echo $(sudo chmod 666 /tmp/master-slave-ip.py)
echo $(sudo chown root:root /tmp/new/master-slave-ip.py)
echo $(sudo yum  install python -y)
echo $(sudo yum  install python-pip -y)
echo $(sudo pip install boto3)

#echo $(python3 /tmp/master-slave-ip.py)
echo "###  END  ###: s3copy.sh"
exit 0

