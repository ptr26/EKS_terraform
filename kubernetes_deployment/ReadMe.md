---
# Deploy workloads to EKS
---

Deploy nginx, nodejs nad MongoDB to existing EKS cluster. 

## .tf files:
__provider__ - retrieve kubernetes configuration, so that configuration can be deployed on existing cluster
__nginx__ - deploy nginx to EKS cluster (using kubernetes_deployment)
__nodejs__ - deploy nodejs and MongoDB to EKS cluster (using kubernetes_deployment)
__jenkins__ - deploy Jenkins (using helm_chart)

## Usage:

Before deployment of this configuration, existing EKS cluster is required.

#### Update kubeconfig file
    aws eks --region <name> update-config --name <cluster_name>

If the command above is not working try remove  ~/.kube/config and run again.

#### Deploy configuration to AWS
    1. terraform init
    2. terraform plan -out tfplan
    3. terraform apply "tfplan"
    4. terraform destroy

#### View deployed microservices
    kubectl get services -A

Choose desired external-ip from obtained table

    curl <external-ip>

Or open in browser

## Useful links:
[TF Kubernetes](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service)

## TF Tutorials:
[Terraform Kubernetes Deployment with AWS EKS](https://www.clickittech.com/devops/terraform-kubernetes-deployment/)