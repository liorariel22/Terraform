variable "resource_group_name" {
  type        = string
  description = "Resource group name for all module resources."
}

variable "region" {
  type        = string
  description = "Region for all module resources."
}

variable "host_os" {
  type        = string
  description = "Host operating system"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the network interface will be attached."
}

variable "vm_username" {
  type        = string
  description = "The Username of the VM."
}
