#!/bin/sh

HOSTNAME=`hostname`
EC2_INSTANCES=`aws ec2 describe-instances --query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key==\`Name\`]|[0].Value}'`
echo -e "<h3>EC2 Instances</h3>\n<p>$EC2_INSTANCES </p></div></body>" >> index.html
echo -e "<footer class='text-center'>\n<p>Served from container: $HOSTNAME running on $CLUSTERENV</p>\n</footer>\n</html>\n" >> index.html

nginx -g "daemon off;"
