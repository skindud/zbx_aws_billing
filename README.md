# zbx_aws_billing

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

[![GitHub Super-Linter][super-linter-shield]][super-linter-url]

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

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/skindud/zbx_aws_billing.svg?style=for-the-badge
[contributors-url]: https://github.com/skindud/zbx_aws_billing/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/skindud/zbx_aws_billing.svg?style=for-the-badge
[forks-url]: https://github.com/skindud/zbx_aws_billing/network/members
[stars-shield]: https://img.shields.io/github/stars/skindud/zbx_aws_billing.svg?style=for-the-badge
[stars-url]: https://github.com/skindud/zbx_aws_billing/stargazers
[issues-shield]: https://img.shields.io/github/issues/skindud/zbx_aws_billing.svg?style=for-the-badge
[issues-url]: https://github.com/skindud/zbx_aws_billing/issues
[license-shield]: https://img.shields.io/github/license/skindud/zbx_aws_billing.svg?style=for-the-badge
[license-url]: https://github.com/skindud/zbx_aws_billing/blob/master/LICENSE.txt
[super-linter-shield]: https://github.com/skindud/zbx_aws_billing/workflows/Lint%20Code%20Base/badge.svg
[super-linter-url]: https://github.com/marketplace/actions/zbx_aws_billing/
