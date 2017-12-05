#!/usr/bin/python
import boto3
ec2 = boto3.resource('ec2')
print ("The ImageID and InstanceType available are :ami-d5c18eba ,t2.micro")
Image=raw_input("Enter ImageId")
Instance=raw_input("Enter InstanceType")
instance = ec2.create_instances(
        ImageId=Image,
        SecurityGroupIds=['sg-5cb09334'],
        KeyName="sam_cli-key",
        SubnetId='subnet-ba2551d3',
        MinCount=1,
        MaxCount=1,
        InstanceType=Instance)
print instance[0].id
