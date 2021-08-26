terraform {
  required_version = "= 1.0.2"
  /*
  #S3 bucket for environment "dev"
  backend "s3" {
    bucket         = "bucket-web-dev-nginx-us-east-2"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "table-web-dev-nginx-us-east-2"
  }
*/
  #S3 bucket for environment "prod"
  /*
  backend "s3" {
    bucket         = "bucket-web-prod-nginx-us-east-2"
    key            = "prod/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "table-web-prod-nginx-us-east-2"
  }
*/

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.55"
    }
  }
}
