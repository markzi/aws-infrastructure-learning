# AWS Infrastructure Learning

## Introduction 
The purpose of this project is to test out AWS infrastructure setup using a number IAC tools.

* Terraform
* AWS CDK

This project is split acrosss to main responsibilties

### DevOps

This is shared services across the environments

* SNS


TODO

* CloudWatch
* ECR

### Infrastructure 

This is a setup for an environment

* VPC
  * Flow Logs
* IG
* 2 Public Subnets across 2 AV Zones
  * NAT
* 2 Private Subnets across 2 AV Zones
  * ALB
    * Default Response
* Cloudwatch

TODO

* move CloudWatch to devops
* move ECR to devops


## CI Tools

### Jenkins

There is a docker compose file to create a Jenkins instance.
The __jenkins_home__ folder is created in the root of __jenkins__ folder.

Start Jenkins
```
docker-compose up -d
```
Stop Jenkins
```
docker-compose down
```