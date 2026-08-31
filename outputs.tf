output "vpc_id" {
  value       = aws_vpc.hellocloud.id
  description = "The ID of the VPC"
}

output "vpc_cidr_block" {
  value       = aws_vpc.hellocloud.cidr_block
  description = "The CIDR block of the VPC"
}

output "vpc_region" {
  value       = aws_vpc.hellocloud.region
  description = "The region of the VPC"
}

output "subnet_id" {
  value       = aws_subnet.hellocloud.id
  description = "The ID of the subnet"
}

output "elastic_ip" {
  description = "Elastic IP address of the web server"
  value       = aws_eip.hellocloud.public_ip
}

output "website_url" {
  description = "URL of the web server"
  value       = "http://${aws_eip.hellocloud.public_ip}"
}