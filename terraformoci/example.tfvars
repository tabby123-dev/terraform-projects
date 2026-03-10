region = "enter here"

compartment_id = "enetr here"

vcns = {
  vcn1 = {
    cidr_block = "10.10.0.0/16"
    dns_label  = "vcn1"
  }

  vcn2 = {
    cidr_block = "10.20.0.0/16"
    dns_label  = "vcn2"
  }
}

nat_gateways = {
  ngw-vcn1 = { vcn_key = "" }
  ngw-vcn2 = { vcn_key = "vcn2" }
}

service_gateways = {
  sgw-vcn1 = { vcn_key = "vcn1" }
  sgw-vcn1 = { vcn_key = "vcn2" }
}

route_tables = {

  rt-subnet1 = { vcn_key = "vcn1" }
  rt-subnet2 = { vcn_key = "vcn1" }
  rt-subnet3 = { vcn_key = "vcn1" }

  rt1-subnet1 = { vcn_key = "vcn2" }
  rt2-subnet2 = { vcn_key = "vcn2" }
  rt3-subnet3 = { vcn_key = "vcn2" }

}

security_lists = {

  sl-subnet1 = { vcn_key = "vcn1" }
  sl-subnet2 = { vcn_key = "vcn1" }
  sl-subnet3 = { vcn_key = "vcn1" }

  sl1-subnet1 = { vcn_key = "vcn2" }
  sl2-subnet2 = { vcn_key = "vcn2" }
  sl3-subnet3 = { vcn_key = "vcn2" }

}


subnets = {

  ebs_subnet1 = {
    vcn_key     = "vcn1"
    cidr_block  = "10.10.1.0/24"
    dns_label   = "subnet1"
    route_table = "rt-subnet1"
    sec_list    = "sl-subnet1"
  }

  ebs_subnet2 = {
    vcn_key     = "vcn1"
    cidr_block  = "10.10.2.0/24"
    dns_label   = "subnet2"
    route_table = "rt-subnet2"
    sec_list    = "sl-subnet2"
  }

  ebs_subnet3 = {
    vcn_key     = "vcn1"
    cidr_block  = "10.10.3.0/24"
    dns_label   = "subnet3"
    route_table = "rt-subnet3"
    sec_list    = "sl-subnet3"
  }


  bss_subnet1 = {
    vcn_key     = "vcn2"
    cidr_block  = "10.20.1.0/24"
    dns_label   = "subnet1"
    route_table = "rt1-subnet1"
    sec_list    = "sl1-subnet1"
  }

  bss_subnet2 = {
    vcn_key     = "vcn2"
    cidr_block  = "10.20.2.0/24"
    dns_label   = "subnet2"
    route_table = "rt2-subnet2"
    sec_list    = "sl2-subnet2"
  }

  bss_subnet3 = {
    vcn_key     = "vcn2"
    cidr_block  = "10.20.3.0/24"
    dns_label   = "subnet3"
    route_table = "rt3-subnet3"
    sec_list    = "sl3-subnet3"
  }

}
