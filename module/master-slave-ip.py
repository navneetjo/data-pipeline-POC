import _json
import os

import pprint
import json
import boto3


from pprint import pprint

region = 'us-east-1'

emr = boto3.client('emr',  region_name=region)
activeClusters = emr.list_clusters(
    ClusterStates=[
       'RUNNING' or 'WAITING',
    ]
)
pprint("List of Clusters is  :" + str(activeClusters))

for cluster in activeClusters['Clusters']:
    clusterId = cluster['Id']
    pprint("cluster id of active cluster :" + clusterId)

instanceDetails = emr.list_instance_groups(
    ClusterId = clusterId
)

paginator = emr.get_paginator('list_instances')
slave_iterator = paginator.paginate(
    ClusterId=clusterId,
    InstanceGroupTypes=['CORE']
)

for slave_ip in slave_iterator:
    for ips in slave_ip['Instances']:
        f = open("slave_ip.txt", "a+")
        pprint("Slave IP is : " + str(ips['PublicIpAddress']))
        f.write(ips['PublicIpAddress'] + "\r")



master_iterator = paginator.paginate(
    ClusterId=clusterId,
    InstanceGroupTypes=['MASTER']
)


for master_ip in master_iterator:
    for ips in master_ip['Instances']:
        f = open("master_ip.txt", "a+")
        pprint("Master IP is : " + str(ips['PublicIpAddress']))
        f.write(ips['PublicIpAddress'] + "\r")

f.close()

