# Lambda CI/CD Example

This repository provides an automated way to deploy a Python application as an AWS Lambda function using Github Actions and Terraform.

## Features
- **AWS Authentication**: Uses OpenID Connect (OICD) for secure AWS Access.
- **Infraestructure as code**: Deploy AWS resources using Terraform.
- **Automated cleanup**: Supports automatic resource destruction via a configuration file.
- **Multi-Environment Deployment**: Uses git branches to manage different environments.
- **Versioning & Rollback**: Integrates with lambda alias to publish new versions, allowing fast rollbacks in case of errors.

## Prerequisites
- AWS Account with IAM permissions for OICD Authentication.