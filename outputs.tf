output "verifiedaccess_group_id" {
  description = "The ID of the Verified Access group to associate the endpoint with."
  value       = aws_verifiedaccess_group.this.id
}
