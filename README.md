# Terraform Projects

## Overview

This repository contains **Infrastructure as Code (IaC)** configurations built using **Terraform**. The goal of this repository is to define, provision, and manage cloud infrastructure in a repeatable and version-controlled way.

Terraform allows infrastructure such as  networks, and storage resources to be described in code rather than configured manually. This enables consistent deployments across environments, easier collaboration, and automated infrastructure management.

This repository serves as a learning and experimentation environment for building Terraform infrastructure and practicing DevOps workflows using Git and GitHub.

---

## Objectives

* Manage infrastructure using **Infrastructure as Code (IaC)**
* Practice Terraform workflows and best practices
* Version-control infrastructure using Git
* Automate infrastructure provisioning

---

## Repository Structure

A typical Terraform project structure in this repository may include:

```
terraform-projects/
│
├── main.tf          # Primary Terraform configuration
├── variables.tf     # Input variables used in the configuration
├── outputs.tf       # Outputs returned after deployment
├── providers.tf     # Provider configuration (AWS, Azure, etc.)
├── modules/         # Reusable Terraform modules
└── README.md        # Project documentation
```

### Key Files

* **main.tf** – Defines infrastructure resources and configurations.
* **variables.tf** – Stores configurable input variables.
* **outputs.tf** – Displays important values after deployment.
* **modules/** – Contains reusable infrastructure components.

---

## Prerequisites

Before using this project, ensure you have:

* Terraform installed
* Git installed
* Access credentials for the target cloud provider (AWS, Azure, GCP, etc.)
* Basic understanding of Terraform and Infrastructure as Code

---

## Getting Started

### 1. Clone the repository

```
git clone https://github.com/tabby123-dev/terraform-projects.git
cd terraform-projects
```

### 2. Initialize Terraform

```
terraform init
```

### 3. Review the execution plan

```
terraform plan
```

### 4. Apply the configuration

```
terraform apply
```

---

## Terraform Workflow

Typical workflow when working with Terraform:

1. Write or update infrastructure code
2. Initialize Terraform (`terraform init`)
3. Review changes (`terraform plan`)
4. Deploy infrastructure (`terraform apply`)
5. Destroy resources when no longer needed (`terraform destroy`)

---

## Best Practices

* Use version control for all infrastructure code
* Avoid storing secrets directly in Terraform files
* Use modules to reuse infrastructure components
* Keep environments separated (e.g., dev, staging, production)


