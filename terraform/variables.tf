variable "region" {
  description = "AWS region"
  type        = string
  default     = #REPLACE FOR YOUR REGION
}

variable "clusterName" {
  description = "Name of the EKS cluster"
  type        = string
  default     = #REPLACE FOR YOUR CLUSTER NAME
}
