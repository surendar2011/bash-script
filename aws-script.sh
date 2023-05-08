#!/bin/bash

# List all S3 buckets and their sizes
echo "S3 Buckets:"
aws s3 ls | awk '{print $3}' | while read bucket_name; do
  echo "$bucket_name:"
  aws s3 ls s3://$bucket_name --recursive --human-readable --summarize | tail -n 2
  echo ""
done

# List EC2 instances and their types
echo "EC2 Instances:"
aws ec2 describe-instances | jq -r '.Reservations[].Instances[] | .InstanceId + " (" + .InstanceType + ")"'

# List Lambda functions
echo "Lambda Functions:"
aws lambda list-functions | jq -r '.Functions[].FunctionName'

# List IAM users
echo "IAM Users:"
aws iam list-users | jq -r '.Users[].UserName'

#output:
S3 Buckets:
bucket1:
  Total Objects: 100
  Total Size: 100.00 MiB

bucket2:
  Total Objects: 50
  Total Size: 50.00 MiB

EC2 Instances:
i-1234567890abcdef0 (t2.micro)
i-0987654321fedcba0 (t3.medium)

Lambda Functions:
function1
function2
function3

IAM Users:
user1
user2
user3
