variable "aws_profile" {
    type = string
    description = "AWS profile defined in  ~/.aws/"
    default = "default"
}

variable "aws_region" {
    type = string
    description = "AWS region"
    default = "eu-west-2"
  
}

variable "cluster_name" {
    type = string
    description = "name for EKS cluster"
    default = "my_cluster"
}

variable "node1" {
    type = object({
        group_name = string
        instance_type = string
        min_size = number
        max_size = number
        desired_size = number
    })

    default = {
      desired_size = 1
      group_name = "node_group_1"
      instance_type = "t3.small"
      max_size = 1
      min_size = 1
    }
}

variable "node2" {
    type = object({
        group_name = string
        instance_type = string
        min_size = number
        max_size = number
        desired_size = number
    })

    default = {
        desired_size = 1
        group_name = "node_group_2"
        instance_type = "t3.small"
        max_size = 1
        min_size = 1
    }
}