# AWS Web Infrastructure with Terraform

This project demonstrates how to provision a simple AWS web infrastructure environment using Terraform.

The infrastructure includes networking resources, an EC2 instance, an Elastic IP, and a simple Apache web page.

## Architecture

The project creates:

- VPC
- Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- EC2 Instance
- Elastic IP
- Elastic IP Association

The EC2 instance runs Apache HTTP Server and displays a simple web page.

## AWS Terraform Infrastructure Analysis

This diagram documents the Terraform configuration, AWS resource relationships, deployment flow, state verification, and final web server output.

![AWS Terraform Infrastructure Analysis](diagrams/aws-terraform-infrastructure-analysis.png)

## Terraform Files

- `versions.tf` - Defines the required Terraform and AWS provider versions
- `providers.tf` - Configures the AWS provider
- `variables.tf` - Defines input variables
- `terraform.tfvars` - Stores local variable values and is excluded from Git
- `vpc.tf` - Creates the VPC, subnet, security group, internet gateway, route table, route table association, Elastic IP, and EIP association
- `data.tf` - Looks up a recent Amazon Linux 2023 AMI
- `instance.tf` - Creates the EC2 web server and configures Apache using `user_data`
- `outputs.tf` - Defines useful Terraform outputs

## Deployment Flow

Format the Terraform files:

```bash
terraform fmt
```

Initialize the Terraform working directory:

```bash
terraform init
```

Validate the Terraform configuration:

```bash
terraform validate
```

Review the planned infrastructure changes:

```bash
terraform plan
```

Create the AWS resources:

```bash
terraform apply
```

## Verification

After deployment, use the following command to list the resources managed by Terraform:

```bash
terraform state list
```

To inspect a specific resource:

```bash
terraform state show <resource>
```

Example:

```bash
terraform state show aws_vpc.hellocloud
```

## Final Output

The Terraform deployment provisions an EC2 instance running Apache HTTP Server and serves a simple web page.

The final web page displays:

**Hello Cloud from Terraform 🚀**

## Cleanup

To destroy all resources managed by this Terraform configuration:

```bash
terraform destroy
```

After the destroy is complete, verify that the Terraform state is empty:

```bash
terraform state list
```

## Security Notes

- `terraform.tfvars` is excluded from Git using `.gitignore`.
- AWS credentials and personal public IP addresses are not committed to the repository.
- SSH access on port `22` is restricted to a trusted IPv4 CIDR.
- Public HTTP access on port `80` is allowed for the web server.
- Terraform state files are not committed to the repository.

## Project Result

This project demonstrates a basic Infrastructure as Code workflow using Terraform and AWS.

The infrastructure can be created, verified, destroyed, and recreated using the same Terraform configuration.