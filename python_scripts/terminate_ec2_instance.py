#!/usr/bin/python
import sys
import boto3
ec2 = boto3.resource('ec2')
instance_id=raw_input("Enter instance_id")
#for instance_id in sys.argv[1:]:
instance = ec2.Instance(instance_id)
response = instance.terminate()
print response
