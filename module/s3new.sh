#!/usr/bin/env bash
set -e

echo
echo "### BEGIN ###: s3copy.sh"

echo "> Copy elephant_rele	ase.jar"
aws s3 cp s3://dentsu-poc-navneet/Data-Pipeline-POC/module/master-slave-ip.py /tmp/
echo "###  END  ###: s3copy.sh"
exit 0

