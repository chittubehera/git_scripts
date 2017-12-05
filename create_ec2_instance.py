#!/usr/bin/python
import boto3
ec2 = boto3.resource('ec2')
instance = ec2.create_instances(
    	ImageId='ami-d5c18eba',
    	SecurityGroupIds=['sg-5cb09334'],
    	KeyName="sam_cli-key",
    	SubnetId='subnet-ba2551d3',
	MinCount=1,
    	MaxCount=1,
    	InstanceType='t2.micro')
print instance[0].id
