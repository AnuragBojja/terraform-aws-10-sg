variable "env" {
#   default = "dev"
}
variable "project_name" {
#   default = "Roboshop"
}
variable "sg_tags" {
  default = {}
}
variable "sg_names" {
#   default = [
#     #databases
#     "mongodb",
#     #backend

#     #frontend

#     #bastion_host
#     "bastion"
#     ]
}
variable "sg_descripition" {
  default = "Managed by Terraform for Roboshop Project"
}
variable "vpc_id" {
}
