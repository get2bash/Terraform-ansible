# Terraform and Ansible Mini-Project

This project demonstrates the use of Terraform to provision AWS infrastructure and Ansible to configure the provisioned servers. It creates a load-balanced web server environment with custom content.

## Project Overview

The project automates the following:
1.  **Infrastructure Provisioning (Terraform)**:
    - Creates a VPC with public subnets.
    - Launches 3 EC2 instances (Ubuntu).
    - Sets up an Application Load Balancer (ALB) to distribute traffic.
    - Configures AWS Route53 for domain name resolution (pointing to the ALB).
    - Generates a `host-inventory` file with the public IPs of the created instances.

2.  **Configuration Management (Ansible)**:
    - Updates and upgrades the Ubuntu servers.
    - Installs Apache2 web server.
    - Sets the timezone to Africa/Lagos.
    - Deploys a custom `index.html` page displaying the server's hostname and IP address to verify load balancing.

## Prerequisites

Before running this project, ensure you have the following installed and configured:

-   [Terraform](https://www.terraform.io/downloads)
-   [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
-   [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials (`aws configure`).
-   An AWS account with permissions to create VPCs, EC2 instances, ALBs, and Route53 records.
-   A registered domain name (for Route53 configuration).

## Project Structure

-   `vpc.tf`: Defines the VPC, subnets, internet gateway, and route tables.
-   `server.tf`: Defines the 3 EC2 instances and the local file resource for the inventory.
-   `loadb.tf`: Configures the Application Load Balancer, target groups, and listeners.
-   `route53.tf`: Manages DNS records.
-   `output.tf`: Defines Terraform outputs.
-   `playbook.yml`: Ansible playbook for server configuration.
-   `ansible.cfg`: Ansible configuration file.
-   `run-playbook.sh`: Helper script to execute the Ansible playbook.

## Usage

### 1. Provision Infrastructure with Terraform

Initialize Terraform to download necessary providers:

```bash
terraform init
```

Preview the changes:

```bash
terraform plan
```

Apply the configuration to create resources on AWS:

```bash
terraform apply --auto-approve
```

Once completed, Terraform will generate a `host-inventory` file containing the IP addresses of the new instances.

### 2. Configure Servers with Ansible

Run the Ansible playbook using the generated inventory file. You can use the provided helper script:

```bash
./run-playbook.sh
```

Or run the command directly:

```bash
ansible-playbook playbook.yml -i host-inventory
```

### 3. Verify Deployment

Visit your configured domain (e.g., `terraform-test.yourdomain.com`) in a web browser. Refresh the page multiple times to see the content change as the Load Balancer directs traffic to different servers.

---

## Original Task Description

