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
  -var="aws_profile=<your aws cli profile>"

terraform plan --out default.plan -var="aws_profile=devops"
```

#### Apply

```
terraform \
  apply \
  -var="aws_profile=<your aws cli profile>"
  
terraform apply "default.plan"
```

#### Destroy

```
terraform \
  destroy \
  -var="aws_profile=<your aws cli profile>"
  
```