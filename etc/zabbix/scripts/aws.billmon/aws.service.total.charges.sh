#!/bin/sh

progdir='/etc/zabbix/scripts/aws.billmon'
logfile="$progdir/aws.service.total.charges.sh.log"
pid=$$

echo "### $(date) $pid [info] start" >> $logfile

t_res=$(aws cloudwatch get-metric-statistics --metric-name EstimatedCharges --namespace 'AWS/Billing' --start-time $(date "+%Y-%m-%dT%H:%M:%SZ" --date="-300 minutes") --end-time $(date "+%Y-%m-%dT%H:%M:%SZ") --statistics Maximum --period 60 --dimensions Name=Currency,Value=USD | jq ".Datapoints[].Maximum"|tail -1)
if [ "$t_res" = "" ]
then
	echo "### ($date) $pid [error] get from AWS t_res=$t_res" >> $logfile
	t_res_date_str=$(tail -100 $progdir/aws.service.log|grep "^### aws.service.total.charges"|tail -1|awk {'print $3,$4,$5,$6,$7,$8'})
	t_res_date=$(date -d "$t_res_date_str" +%s)
	t_now_date_str=$(date)
	t_now_date=$(date -d "$t_now_date_str" +%s)
	let t_diff=$t_now_date-$t_res_date
	if [ $t_diff -lt 43200 ]
	then
    	t_res=$(tail -100 $progdir/aws.service.log|grep "^### aws.service.total.charges"|tail -1|awk {'print $9'})
		echo "### $(date) $pid [info] ok cashed data t_res_date=$t_res_date t_now_date=$t_now_date t_diff=$t_diff" >> $logfile
    else
		echo "### $(date) $pid [error] too old cashed data t_res_date=$t_res_date t_now_date=$t_now_date t_diff=$t_diff" >> $logfile
    fi
else
	echo "### aws.service.total.charges $(date) $t_res" >> "$progdir/aws.service.log"
fi

echo "### $(date) $pid [info] t_res=$t_res" >> $logfile
echo $t_res
echo "### $(date) $pid [info] finish" >> $logfile
