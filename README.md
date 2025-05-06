# AWS Terraform Infrastructure Setup

This project sets up a fully modular and reusable AWS infrastructure using Terraform, with:

- A custom VPC with public and private subnets
- EC2 instance deployment in a public subnet
- RDS (MySQL) in a private subnet
- Security groups and key management
- Environment-based separation and S3 backend support

> **Note**: This is a demo replication of a real infrastructure project delivered for a client.

##  Modules Used

- **VPC** — CIDR block, subnets, internet gateway, route tables
- **EC2** — Configurable AMI, instance type, key pair
- **RDS** — Private subnet MySQL deployment

##  Getting Started

```bash
cd environments/dev
terraform init
terraform plan
terraform apply

```

## Best Practices Followed
- Remote backend with locking (S3 + DynamoDB)
- Modular folder structure
- .gitignore and sensitive files excluded
- Reusable variables and outputs
- Clearly documented environment config

## Backend
Update backend.tf with your own:
- S3 bucket
- DynamoDB table
- AWS region

##  Notes

- Secrets like RDS passwords should be managed via secret managers in production.
- This is a mock project created as a demo of freelance work (client repo cannot   be shared).