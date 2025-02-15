variable "ec2_name" {
  description = "Name of EC2"
  type        = string
  default     = "huang-tf-ec2" 
}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of EC2 Key Pair"
  type        = string
  default     = "huang-vpc-keypair"
}

variable "sec_group_name" {
  description = "Name of EC2 security group"
  type        = string
  default     = "huang-tf-sg-allow-ssh-http-https"
}