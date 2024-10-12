variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "eks_cluster_name" {
  default = "my-k8s-cluster"
}

variable "node_instance_type" {
  default = "t2.medium"
}

variable "desired_capacity" {
  default = 2
}

variable "max_size" {
  default = 3
}

variable "min_size" {
  default = 1
}
