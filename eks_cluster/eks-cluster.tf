module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = local.cluster_name
  cluster_version = local.cluster_version

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type =  "AL2_x86_64"  # https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-eks-nodegroup.html

    # Disabling and using externally provided security groups from security_groups.tf
    create_security_group = false
  }

  eks_managed_node_groups = {
    one = {
        name = var.node1.group_name
        
        instance_types = [var.node1.instance_type]

        min_size = var.node1.min_size
        max_size = var.node1.max_size
        desired_size = var.node1.desired_size

      pre_bootstrap_user_data = <<-EOT
      echo 'foo bar'
      EOT

      vpc_security_group_ids = [aws_security_group.node_group_one.id]
    }

    two = {
        name = var.node2.group_name

        instance_types = [var.node2.instance_type]

        min_size = var.node2.min_size
        max_size = var.node2.max_size
        desired_size = var.node2.desired_size

        pre_bootstrap_user_data = <<-EOT
        echo 'foo bar'
        EOT

        vpc_security_group_ids = [aws_security_group.node_group_two.id]        
    }
  }
}