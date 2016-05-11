#!/bin/sh
/usr/bin/aws s3 cp ${S3_PATH:?}/mumble-server.sqlite /data/mumble-server.sqlite
/usr/bin/aws ec2 associate-address --instance-id `curl -s -m 10 http://169.254.169.254/latest/meta-data/instance-id` --allocation-id ${ALLOC_ID:?} --region us-east-1
/usr/sbin/murmurd -fg -ini /config/mumble-server.ini -supw ${MURMUR_PW:?}
