#General Variables
variable "env" {
  type    = string
  default = "env"
}

variable "app" {
  type    = string
  default = "app"
}

#Variables for Network
variable "cidr_block" {
  description = "The CIDR block of the project"
  default     = "10.0.0.0/16"
}

variable "aws_dns" {
  type    = bool
  default = true
}

locals {
  number_public_subnets  = 2
  number_private_subnets = 1
  azs                    = data.aws_availability_zones.available.names
}

#Variables for Application Load Balancer
variable "app_port" {
  description = "The application port"
  default     = 80
}

variable "app_target_port" {
  description = "The application port"
  default     = 80
}

variable "health_check_path" {
  description = "The path for health check web servers"
  default     = "/"
}

#Variables for ECS
variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default     = "TaskExecutionRole"
}

variable "ecs_task_role_name" {
  description = "ECS task role name"
  default     = "TaskRole"
}

variable "taskdef_template" {
  default = "web_server.json.tpl"
}

variable "web_server_count" {
  description = "Number of web server containers to run"
  default     = 1
}

variable "web_server_fargate_cpu" {
  description = "Fargate instance CPU units to provision for web server (1 vCPU = 1024 CPU units)"
  default     = 256
}

variable "web_server_fargate_memory" {
  description = "Fargate instance memory to provision for web server (in MiB)"
  default     = 512
}

variable "name_container" {
  type    = string
  default = "container"
}

variable "aws_ecr_repository_url" {
  type = string
}

variable "image_tag" {
  type = string
}

locals {
  image = format("%s:%s", var.aws_ecr_repository_url, var.image_tag)
}
