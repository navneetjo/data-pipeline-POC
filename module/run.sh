#!/usr/bin/bash

while read -r line
do
    name="$line"
    echo "Name read from file - $name"
    scp -o StrictHostKeyChecking=no -i /home/hadoop/.ssh/dentsu-keypair.pem ip.txt  hadoop@$name:/home/hadoop/
done < "ip.txt"
