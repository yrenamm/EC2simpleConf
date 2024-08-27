# Define Output Values

output "ec2_ami" {
  description = "AMI to create EC2"
  value       = aws_instance.web_server_https.ami
}

output "ec2_public_ip" {
  description = "VM Public IP"
  value       = aws_instance.web_server_https.public_ip
}