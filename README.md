# AWS + Terraform + Docker
This page describes how to deploy a web application in Docker container on AWS using Terraform. 

### Tool versions:
- Terraform - 1.02
- AWS CLI - 2.2.23

## Description
This solution was created to demonstrate how deploying a web application in Docker container by creating a cloud infrastructure on AWS based on "Infrastructure as a code" using Terraform looks like. It consists of Terraform modules, "main" Terraform files and configuration files to create infrastructure.

The solution creates AWS infrastructure according to specified requirements.

The repo contains the next components:
* Terraform project
* Presentation

## Folders and Files
- ./presentation - presentation of the project
- ./app - app directory
- ./config - configuration directory 
- ./modules - Terraform modules
- provider.tf
- terraform.tf
- variables.tf
- main.tf
- outputs.tf

## Implemention
### Preparation
- Create an account on AWS 
- Create an user with required permissions using AWS IAM
- Install the required version of Terraform and AWS CLI
- Download the repo content
- Change "variables" in *.tfvars

### Deployment
#### Initial step
- Add AWS AIM user credentials to ~/.aws/credentials

\[default\]  
aws_access_key_id = YOUR AWS ACCESS KEY ID  
aws_secret_access_key = YOUR AWS SECRET ACCESS KEY  

#### Steps for environment "dev"
- Copy terraform project to your github repo to branch "dev"
  
- Go to the /project directory and run:

terraform init  
terraform apply -target=module.s3_terraform_state --var-file=./config/dev.tfvars  

- Uncomment backend "s3" for dev in terraform.tf

- Go to the /project directory and run (use your secret.tfvars):

terraform init  
terraform apply -target=module.elastic_container_registry --var-file=./config/dev.tfvars  
terraform apply -target=module.initial_build --var-file=./config/dev.tfvars  
terraform apply -target=module.ecs_cluster --var-file=./config/dev.tfvars  
terraform apply -target=module.codebuild --var-file=./config/dev.tfvars --var-file=./config/secret.tfvars  

- Check results
  - Go to your AWS account and check created infrastructure elements 
  - Go to the DNS name created Application Load Balancer and check an information on a web page

- Change file app/web/index.html in local git directory and push changes to your github repo to branch "dev"

- Check results
  - Go to your AWS account and check created infrastructure elements 
  - Go to the DNS name created Application Load Balancer and check an information on a web page

#### Steps for environment "prod"
- Delete .terraform, terraform.tfstate, terraform.tfstate.backup, .terraform.lock.hcl from local root terraform directory

- Copy terraform project to your github repo to branch "prod"

- Comment backend "s3" for dev in terraform.tf

- Go to the /project directory and run:

terraform init  
terraform apply -target=module.s3_terraform_state --var-file=./config/prod.tfvars  

- Uncomment backend "s3" for prod in terraform.tf

- Go to the /project directory and run (use your secret.tfvars):

terraform init  
terraform apply -target=module.elastic_container_registry --var-file=./config/prod.tfvars  
terraform apply -target=module.initial_build --var-file=./config/prod.tfvars  
terraform apply -target=module.ecs_cluster --var-file=./config/prod.tfvars  
terraform apply -target=module.codebuild --var-file=./config/prod.tfvars --var-file=./config/secret.tfvars  

- Check results
  - Go to your AWS account and check created infrastructure elements 
  - Go to the DNS name created Application Load Balancer and check an information on a web page

- Change file app/web/index.html in local git directory and push changes to your github repo to branch "prod"

- Check results
  - Go to your AWS account and check created infrastructure elements 
  - Go to the DNS name created Application Load Balancer and check an information on a web page

#### Final step
- Delete created infrastructure
