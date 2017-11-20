import _json
import os

import pprint
import json
import boto3
from aws_access import aws_account

from pprint import pprint

access_key = aws_account["access_key_id"]
secret_key = aws_account["secret_access_key"]
region = 'us-east-1'

emr = boto3.client('emr', aws_secret_access_key=secret_key, aws_access_key_id=access_key, region_name=region)
activeCluster = emr.list_instances(
ClusterId = 'j-1SQXW4QZMHT1G'
)
os.remove("list.txt")
for instance in activeCluster['Instances']:
    pprint("Instance details is :" + str(instance))
    if instance['InstanceType'] == 'm3.xlarge':
        f = open("list.txt", "a+")
        pprint('instance ip is ' + instance['PublicIpAddress'])
        f.write(instance['PublicIpAddress'] + "\r")
    else:
        pprint("No ip")
f.close()






"""

pprint("Instance details is :" + str(instance))


instances = ec2.describe_instances(
    Filters=[
        {'Name': 'instance-state-name', 'Values': ['running']},
        {'Name': 'vpc-id', 'Values': ['vpc-62ec191b']}
    ])

for instance in instances['Reservations']:
    for inst in instance['Instances']:
        pprint("print instance info333: " + str(inst['InstanceId']))

        id = inst['InstanceId']
        ec2.stop_instances(InstanceIds=[id])
        pprint("stopping instance " + str(id))

"""