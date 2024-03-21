This GitHub repository contains the configuration for setting up a CI/CD pipeline using GitHub Actions to automatically deploy an AWS EC2 instance using Terraform whenever a push event occurs in the repository.

A. Overview
The CI/CD pipeline is triggered whenever a new push event occurs in the GitHub repository. It utilizes GitHub Actions to automate the AWS intance creation using Terraform code. Also instead of saving the terraform.state file to local we have created a bacjend file to save the file directly to a AWS S3 bucket.

B.Workflow Steps
The CI/CD pipeline consists of the following steps:

Checkout: The pipeline checks out the latest code from the repository to the GitHub Actions runner.
a. Terraform Init: Initializes the Terraform configuration by downloading the required providers and modules.
b. Terraform Plan: Generates an execution plan for Terraform to review the changes that will be applied.
c. Terraform Apply: Applies the Terraform execution plan to create or update the AWS EC2 instance.

C. Prerequisites
Before setting up the CI/CD pipeline, ensure you have the following prerequisites:

1. An AWS account with appropriate permissions to create and manage EC2 instances.
2. Terraform installed on the GitHub Actions runner or available in the repository.
3. GitHub repository with Terraform configuration files and necessary IAM roles.
4. S3 bucket mentioed in backend.tf file

D. Getting Started
To set up the CI/CD pipeline for deploying an AWS EC2 instance using Terraform, follow these steps:

a. Clone Repository: Clone this GitHub repository to your local machine.
b. Configure Terraform: Update the Terraform configuration files (*.tf) with your AWS provider settings, EC2 instance details, and any other required configurations.
c. GitHub Secrets: Add your AWS access key ID and secret access key as secrets in the GitHub repository settings. This ensures secure authentication with AWS during the deployment process.
d. GitHub Actions Workflow: Create or update the GitHub Actions workflow file (.github/workflows/main.yml) with the steps required to deploy the EC2 instance using Terraform. You can customize the workflow according to your requirements.
e. Test and Deploy: Commit your changes and push them to the GitHub repository. GitHub Actions will automatically trigger the CI/CD pipeline, which will provision the EC2 instance using Terraform.
f. Verify Deployment: Once the deployment is complete, verify that the EC2 instance is successfully provisioned and functioning as expected in the AWS Management Console UI.

Example Workflow Configuration
Here's an example GitHub Actions workflow configuration (main.yml) for deploying an AWS EC2 instance using Terraform:

GitgHub worlkflow yaml Code:

name: 'Terraform'

on:
  push:
    branches: [ "main" ]

jobs:
  terraform:
    name: 'Terraform'
    env:
        AWS_ACCESS_KEY_ID: ${{ secrets.MY_ACCESS_KEY }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.MY_SECRET_ACCESS }}
    runs-on: ubuntu-latest
    environment: production

    steps:
    # Checkout the repository to the GitHub Actions runner
    - name: Checkout
      uses: actions/checkout@v3

    # Initialize a new or existing Terraform working directory by creating initial files, loading any remote state, downloading modules, etc.
    - name: Terraform Init
      uses: hashicorp/terraform-github-actions@master
      with: 
        tf_actions_version: 0.14.3
        tf_actions_subcommand: 'init'
        tf_actions_working_dir: '.'
        tf_actions_comment: true

    - name: Terraform Plan
      uses: hashicorp/terraform-github-actions@master
      with: 
        tf_actions_version: 0.14.3
        tf_actions_subcommand: 'plan'
        tf_actions_working_dir: '.'
        tf_actions_comment: true

    - name: Terraform Apply
      uses: hashicorp/terraform-github-actions@master
      with: 
          tf_actions_version: 0.14.3
          tf_actions_subcommand: 'apply'
          tf_actions_working_dir: '.'
          tf_actions_comment: true


Contributing
Contributions to improve and enhance this CI/CD pipeline are welcome! Feel free to fork the repository, make your changes, and submit a pull request.

By following this guide, you can set up a robust CI/CD pipeline for deploying AWS EC2 instances using Terraform on every push event in your GitHub repository. If you have any questions or need further assistance, don't hesitate to reach out or open an issue in the repository. Happy deploying!
