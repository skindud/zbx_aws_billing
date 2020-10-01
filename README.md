# zbx_aws_billing
Zabbix template and scripts for AWS billing monitoring

## Requirements
- Installed jq, awscli packages
- Probably you need to increase ZBX timeout due to much time to receive the AWS reply 

## Installation
- Put /etc/zabbix/ scripts and ZBX config to the appropriate place
- Restart zabbix-agent
- Set up aws credentials with the appropriate rights with AWSBillingReadOnlyAccess, CloudWatchLogsReadOnlyAccess policies for scripts - run aws configure under zabbix user.
- check with the following command: `zabbix_agentd -t aws.services`
- Import zbx_aws_billing_export_templates.xml to ZBX server and assign it to the host  
- Wait at least some days and tune zabbix Macro for the template/host accordingly your levels.
- Do not change zabbix interval for items - Actually it updates once in a 4 hours.

## Features
- There is no zero-counted (not used) AWS services. 
- Use host screen

## Tested
It have been tested on CentOS 7.

## Figures
![alt text](figures/1-total.png) 
![alt text](figures/2-service.png) 
![alt text](figures/3-delta.png) 
![alt text](figures/4-delta.avg1d.png) 
