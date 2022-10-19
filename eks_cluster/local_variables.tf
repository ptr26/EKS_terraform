# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

locals{
    cluster_name = "my_cluster"
    cluster_version = "1.23" # EKS K8s version - https://docs.aws.amazon.com/eks/latest/userguide/kubernetes-versions.html
}