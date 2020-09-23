output "public_ip" {
  value       = module.ec2.public_ip
  description = "EC2 Instance Public IPv4 ADDRESS"
}

output "rds_endpoint" {
  value       = module.rds.endpoint
  description = "RDS Endpoint Name"
}
