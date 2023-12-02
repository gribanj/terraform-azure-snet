#============================================= SNET

variable "name" {
  description = "The name of the subnet"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the virtual network will be created."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "address_prefixes" {
  description = "The address space that is used the by the virtual network. You should input it in CIDR notation."
  type        = list(string)
  # e.g. default     = ["10.0.1.0/24"]
}

#============================================= LOGIC

variable "create" {
  description = "Boolean flag to control whether a new resource should be created"
  type        = bool
  default     = false
}

variable "enable_delegation" {
  description = "value to control whether to enable delegation or not"
  type        = bool
  default     = false
}
