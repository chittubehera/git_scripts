#!/bin/bash
#aws ec2 run-instances --image-id ami-d5c18eba --security-group-ids sg-5cb09334 --count 1 --instance-type t2.micro --key-name sam_cli-key --query 'Instances[0].InstanceId'
echo "The following image id and instance type are available"
echo "image id: ami-d5c18eba"
echo "instance type : t2.micro"

echo "Enter the image id"
read image_id
echo "Enter instance type"
read instance_type
echo "the image id is $image_id and the instance type is $instance_type"

if [[ "$image_id" == "ami-d5c18eba" || "$instance_type" == "t2.micro" ]]; then
	echo "creating instance"
	aws ec2 run-instances --image-id $image_id --security-group-ids sg-5cb09334 --count 1 --instance-type $instance_type --key-name sam_cli-key --query 'Instances[0].InstanceId'
	sleep 30
	echo "Displaying launched instance Public Ip Address  details: "
	aws ec2 describe-instances --output table |grep "PublicIpAddress"
else
	echo "Wrong data provided, cannot launch ec2"
fi

echo "Do you want to stop the instances: Y/N"
read answer
echo "You entered $answer"
if [ "$answer" == "Y" ]; then
	sleep 15
	aws ec2 describe-instances --output table | grep "InstanceId"|cut -d'|' -f5 >/home/sambit/scripts/instance.txt
	sleep 30
		while read p; do
		#  echo $p
		aws ec2 stop-instances --instance-ids $p
		done </home/sambit/scripts/instance.txt
else
	echo "Not stopping ec2"
fi
