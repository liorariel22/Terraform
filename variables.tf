variable "host_os" {
  type        = string
  default     = "linux"
  description = "Host operating system"
}

variable "resource_group_name" {
  type        = string
  default     = "Azure-tf-project-rg"
  description = "Resource group name for all module resources."
}

variable "region" {
  type        = string
  default     = "eastus"
  description = "Region for all module resources."
}

variable "vm_username" {
  type        = string
  default     = "adminuser"
  description = "The Username of the VM."
}