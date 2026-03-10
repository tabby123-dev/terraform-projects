
############################
# VCN CREATION
############################

resource "oci_core_vcn" "vcn" {
  for_each       = var.vcns
  compartment_id = var.compartment_id
  cidr_block     = each.value.cidr_block
  display_name   = each.key
  dns_label      = each.value.dns_label
}

############################
# ROUTE TABLES
############################

resource "oci_core_route_table" "rt" {
  for_each       = var.route_tables
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn[each.value.vcn_key].id
  display_name   = each.key
  route_rules {

  destination       = "0.0.0.0/0"
  destination_type  = "CIDR_BLOCK"

  network_entity_id = one([
    for k, v in oci_core_nat_gateway.nat :
    v.id if v.vcn_id == oci_core_vcn.vcn[each.value.vcn_key].id
  ])
}
/*
  route_rules {

    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.nat[each.value.vcn_key].id
  }
  */
/*
  route_rules {

    destination       = data.oci_core_services.services.services[0].cidr_block
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.sgw[each.value.vcn_key].id
  }
  */
  route_rules {

  destination       = data.oci_core_services.services.services[1].cidr_block
  destination_type  = "SERVICE_CIDR_BLOCK"

  network_entity_id = one([
    for k, v in oci_core_service_gateway.sgw :
    v.id if v.vcn_id == oci_core_vcn.vcn[each.value.vcn_key].id
  ])

}
}

############################
# SECURITY LISTS
############################

resource "oci_core_security_list" "sl" {
  for_each       = var.security_lists
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn[each.value.vcn_key].id
  display_name   = each.key
    egress_security_rules {
    protocol    = "All"
    destination = "0.0.0.0/0"
  }

  # ICMP Type 3 - Destination Unreachable from subnet
  ingress_security_rules {
    protocol = "1" #ICMP
    source   = "10.20.0.0/25"
    icmp_options {
      type = 3
    }
  }
  ingress_security_rules {
    protocol = "1"
    source   = "0.0.0.0/0"
    icmp_options {
      type = 3
      code = 4
    }
  }

}

############################
# SUBNETS
############################
resource "oci_core_subnet" "subnet" {
  for_each = var.subnets

  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn[each.value.vcn_key].id
  cidr_block     = each.value.cidr_block
  display_name   = each.key

  dns_label = each.value.dns_label
  prohibit_internet_ingress = "true"
  prohibit_public_ip_on_vnic = "true"

  route_table_id = oci_core_route_table.rt[each.value.route_table].id

  security_list_ids = [
    oci_core_security_list.sl[each.value.sec_list].id
  ]

  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
}
#############################
# NAT GATEWAYS
#############################
resource "oci_core_nat_gateway" "nat" {
  for_each       = var.nat_gateways
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn[each.value.vcn_key].id
  display_name   = each.key
}

#############################
# SERVICE GATEWAYS    
#############################
resource "oci_core_service_gateway" "sgw" {
  for_each       = var.service_gateways
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn[each.value.vcn_key].id
  display_name   = each.key

  services {
    service_id = data.oci_core_services.services.services[1].id
  }
}