#General variables
aws_profile = "default"
aws_region  = "us-east-2"

#Variables for module "s3_terraform_state"
bucket_name = "bucket-web-dev-nginx-us-east-2"
table_name  = "table-web-dev-nginx-us-east-2"

#General variables for other modules
env            = "dev"
app            = "web"
name_container = "nginx"

#Variables for module "initial_build"
image_tag = "0.0.1"

#Variables for module "ecs_cluster"
cidr_block                = "10.10.0.0/16"
app_port                  = 80
web_server_fargate_cpu    = 256
web_server_fargate_memory = 512
web_server_count          = 1

#Variables for module "codebuild"
repo_url          = "https://github.com/mykshtompel/demo3"
branch_pattern    = "^refs/heads/dev$"
git_trigger_event = "PUSH"
