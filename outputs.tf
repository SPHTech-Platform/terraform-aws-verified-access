output "verifiedaccess_group_id" {
  description = "The ID of the Verified Access group to associate the endpoint with."
  value       = aws_verifiedaccess_group.this.id
}

output "verifiedaccess_instance_id" {
  description = "The ID of the Verified Access instance to associate the logging configuration."
  value       = aws_verifiedaccess_instance.this.id
}
