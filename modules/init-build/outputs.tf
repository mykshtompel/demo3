output "aws_region_name" {
  value = data.aws_region.current.name
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "confirmation" {
  value = "Done"
}
