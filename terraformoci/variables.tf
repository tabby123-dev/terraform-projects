variable "compartment_id" {
  description = "OCI Compartment where resources will be created"
  type        = string
}

variable "region" {
  description = "OCI region"
  type        = string
}

variable "vcns" {
  description = "VCN configuration"
  type = map(object({
    cidr_block = string
    dns_label  = string
  }))
}

variable "nat_gateways" {
  description = "NAT gateways for each VCN"
  type = map(object({
    vcn_key = string
  }))
}

variable "service_gateways" {
  description = "Service gateways for each VCN"
  type = map(object({
    vcn_key = string
  }))
}

variable "route_tables" {
  description = "Route tables"
  type = map(object({
    vcn_key = string
  }))
}

variable "security_lists" {
  description = "Security lists"
  type = map(object({
    vcn_key = string
  }))
}

variable "subnets" {
  description = "Subnet definitions"
  type = map(object({
    vcn_key     = string
    cidr_block  = string
    route_table = string
    sec_list    = string
    dns_label    = string
  }))
}