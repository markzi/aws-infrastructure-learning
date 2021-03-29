# AWS Infrastructure

## Introduction
The aim of this project is to show standard AWS infrastructure using a variety of different infrastructure as code tool sets

* AWS CDK
* Terraform

## Infrastructure

* VPC
* 2 Public / 2 Private Subnets
* NAT
* API Gateway
* ALB

* Operational Dashboards
  * Service request times - 90th/99th percentile etc ( show customers experience )

 * Extenal github project that will build
   * ECS Cluster/s
     * auto scaling group
     * private subnet
     * across 2 availability zones

## Usage

### Terraform

#### Initialise
```
terraform init
```

#### Plan

```
terraform \
  plan --out default.plan \
  -var="aws_profile=<your aws cli profile>" \
  -var="aws_region=<your aws cli region>"

terraform plan --out default.plan -var="aws_profile=dev" -var="aws_region=eu-west-2"
```

#### Apply

```
terraform \
  apply \
  -var="aws_profile=<your aws cli profile>" \
  -var="aws_region=<your aws cli region>"
  
terraform apply "default.plan"
```

#### Destroy

```
terraform \
  destroy \
  -var="aws_profile=<your aws cli profile>" \
  -var="aws_region=<your aws cli region>"
  
```