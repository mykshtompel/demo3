variable "github_oauth_token" {
  type        = string
  description = "Github OAuth token with repo access permissions"
  default     = ""
}

variable "repo_url" {
  type        = string
  description = "URL to Github repository to fetch source from"
  default     = ""
}

variable "build_spec_file" {
  default = "buildspec.yml"
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "The VPC ID that CodeBuild uses"
}

variable "subnets" {
  type        = list(string)
  default     = null
  description = "The subnet IDs that include resources used by CodeBuild"
}

variable "security_groups" {
  type        = list(string)
  default     = null
  description = "The security group IDs used by CodeBuild to allow access to resources in the VPC"
}

variable "env" {
  type    = string
  default = "env"
}

variable "app" {
  type    = string
  default = "app"
}

variable "name_container" {
  type    = string
  default = "container"
}

locals {
  codebuild_project_name = "${var.app}-${var.env}-${var.name_container}"
  description            = "Codebuild for ${var.app}-${var.name_container} environment ${var.env}"
  region                 = data.aws_region.current.name
}

variable "branch_pattern" {
  type    = string
  default = ""
}

variable "git_trigger_event" {
  type    = string
  default = ""
}

variable "environment_variable" {
  description = <<EOF
Pass env vars for codebuild project(in native for codebuild project format)
Example:
env_vars = [
      {
        "name"  = "SOME_KEY1"
        "value" = "SOME_VALUE1"
      },
      {
        "name"  = "SOME_KEY2"
        "value" = "SOME_VALUE2"
      },
    ]
EOF

  default = []
}
