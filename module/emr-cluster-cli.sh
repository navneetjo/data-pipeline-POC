aws emr create-cluster --name "dentsu-cluster"  \
--release-label emr-5.8.0 \
--use-default-roles --ec2-attributes SubnetId=subnet-00b1b259,KeyName=dentsu-keypair \
--applications Name=Hadoop Name=Spark \
--instance-count 2 --instance-type m3.xlarge \
--bootstrap-action Path="s3://dentsu-poc-navneet/Data-Pipeline-POC/module/myshell.sh" \
--steps Type=CUSTOM_JAR,Name=CLI-TRY,ActionOnFailure=CONTINUE,Jar=command-runner.jar,Args=spark-submit,/tmp/master-slave-ip.py --region us-east-1

