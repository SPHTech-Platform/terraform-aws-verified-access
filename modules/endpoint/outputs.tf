output "ednpoint_id" {
  description = "The ID of the AWS Verified Access endpoint."
  value       = aws_verifiedaccess_endpoint.this.id
}

output "endpoint_domain" {
  description = "A DNS name that is generated for the endpoint."
  value       = aws_verifiedaccess_endpoint.this.endpoint_domain
}
