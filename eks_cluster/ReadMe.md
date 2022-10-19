---
# Simple cluster
---

Simple EKS cluster provisioned on AWS. 

## .tf files:
__eks__ - EKS module to provision EKS cluster
__providers__ - provisions Terraform plugins to interact with used APIs
__security_groups__ - provisions security_groups for EKS cluster
__variables__ - contains variables regarding node_groups and AWS region
__vpc__ - VPC module to provision VPC for EKS cluster

## Usage:

#### create AWS configuration
    aws configure

Use command above an then follow the steps. You'll need secret_key and access_key.

#### Deploy configuration to AWS
    1. terraform init
    2. terraform plan -out tfplan
    3. terraform apply "tfplan"
    4. terraform destroy

#### Pass variables into Terraform
    create terraform.tfvars
    Insert values into terraform.tfvars

#### Update kubeconfig file
    aws eks --region <name> update-config --name <cluster_name>

If the command above is not working try remove  ~/.kube/config and run again.

## Useful links:
[AWS network security](https://aws.github.io/aws-eks-best-practices/security/docs/network/)
[EKS module](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest)
[EKS managed node_groups](https://docs.aws.amazon.com/eks/latest/userguide/managed-node-groups.html)
[VPC module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)

## TF Tutorials:
[Hashicorp tutorial](https://learn.hashicorp.com/tutorials/terraform/eks)