output "endpoint_id" {
  description = "The ID of the AWS Verified Access endpoint."
  value       = aws_verifiedaccess_endpoint.this.id
}

output "endpoint_domain" {
  description = "A DNS name that is generated for the endpoint."
  value       = aws_verifiedaccess_endpoint.this.endpoint_domain
}

output "instance_id" {
  description = "The ID of the AWS Verified Access instance."
  value       = aws_verifiedaccess_endpoint.this.verified_access_instance_id
}
