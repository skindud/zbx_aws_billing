#!/bin/sh

echo -n "{\"data\":[";

counter=1

for service in $(aws cloudwatch list-metrics --namespace "AWS/Billing"|jq ".Metrics[].Dimensions[0].Value" |grep -v '"USD"'|sort|uniq);
do
# echo "### service=$service";
 if [ "$counter" == "1" ];then
  echo -n "{\"{#AWSSERVICENAME}\": $service}";
 else
  echo -n ",{\"{#AWSSERVICENAME}\": $service}";
 fi
 let counter=$counter+1
done

echo -n "]}"