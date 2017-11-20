#!/bin/bash
echo "copying jar to slave on spark location"
echo $(aws ec2 describe-instances --filters "Name=tag:aws:elasticmapreduce:instance-group-role,Values=CORE" --region us-east-1 | grep  "PublicIpAddress" | cut -f2 -d":" | cut -f1 -d "," | tr -d '""' | tr -d ' '> ip.txt)

echo $(sudo sh /tmp/run.sh)
