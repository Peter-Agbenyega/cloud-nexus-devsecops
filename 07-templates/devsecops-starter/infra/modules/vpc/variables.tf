variable "name" {
  type        = string
  description = "Base name for VPC resources"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid CIDR block."
  }
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"

  validation {
    condition     = length(var.azs) > 0
    error_message = "azs must contain at least one Availability Zone."
  }

  validation {
    condition     = length(var.azs) >= max(length(var.public_subnet_cidrs), length(var.private_subnet_cidrs))
    error_message = "azs must be at least as long as both subnet CIDR lists."
  }
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public subnet CIDR blocks"

  validation {
    condition     = length(var.public_subnet_cidrs) > 0
    error_message = "public_subnet_cidrs must contain at least one CIDR block."
  }

  validation {
    condition     = alltrue([for cidr in var.public_subnet_cidrs : can(cidrhost(cidr, 0))])
    error_message = "Each entry in public_subnet_cidrs must be a valid CIDR block."
  }
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private subnet CIDR blocks"

  validation {
    condition     = length(var.private_subnet_cidrs) > 0
    error_message = "private_subnet_cidrs must contain at least one CIDR block."
  }

  validation {
    condition     = alltrue([for cidr in var.private_subnet_cidrs : can(cidrhost(cidr, 0))])
    error_message = "Each entry in private_subnet_cidrs must be a valid CIDR block."
  }
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags"
  default     = {}

  validation {
    condition     = alltrue([for k in ["Owner", "Project", "Env"] : contains(keys(var.tags), k)])
    error_message = "tags must include Owner, Project, and Env."
  }
}
