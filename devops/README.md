# AWS Infrastructure

## Introduction
The aim of this project is to show standard AWS infrastructure using a variety of different infrastructure as code tool sets

* AWS CDK
* Terraform

## Infrastructure

* SNS

## TODO
* terraform state in S3 bucket
* Run script so we don't have to specify variables all the time

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

terraform plan --out default.plan -var="aws_profile=devops" -var="aws_region=eu-west-2"
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