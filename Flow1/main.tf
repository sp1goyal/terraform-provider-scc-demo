resource "scc_subaccount" "scc_sa" {
  region_host    = var.region_host
  subaccount     = var.subaccount
  cloud_user     = var.cloud_user
  cloud_password = var.cloud_password
}

resource "scc_system_mapping" "scc_sm" {
  region_host         = scc_subaccount.scc_sa.region_host
  subaccount          = scc_subaccount.scc_sa.subaccount
  virtual_host        = var.virtual_host
  virtual_port        = var.virtual_port
  internal_host       = var.internal_host
  internal_port       = var.internal_port
  protocol            = "HTTP"
  backend_type        = "abapSys"
  authentication_mode = "KERBEROS"
  host_in_header      = "VIRTUAL"
}

resource "scc_system_mapping_resource" "scc_smr" {
  region_host  = scc_subaccount.scc_sa.region_host
  subaccount   = scc_subaccount.scc_sa.subaccount
  virtual_host = scc_system_mapping.scc_sm.virtual_host
  virtual_port = scc_system_mapping.scc_sm.virtual_port
  url_path     = "/"
  enabled      = true
}

resource "scc_domain_mapping" "scc_dm" {
  region_host     = scc_subaccount.scc_sa.region_host
  subaccount      = scc_subaccount.scc_sa.subaccount
  virtual_domain  = var.virtual_domain
  internal_domain = var.internal_domain
}

resource "scc_subaccount_abap_service_channel" "scc_sc" {
  region_host            = scc_subaccount.scc_sa.region_host
  subaccount             = scc_subaccount.scc_sa.subaccount
  abap_cloud_tenant_host = var.abap_cloud_tenant_host
  instance_number        = var.abap_instance_number
  connections            = var.abap_connections
  enabled                = var.abap_enabled
}

resource "scc_subaccount_k8s_service_channel" "scc_sc" {
  region_host      = scc_subaccount.scc_sa.region_host
  subaccount       = scc_subaccount.scc_sa.subaccount
  k8s_cluster_host = var.k8s_cluster
  k8s_service_id   = var.k8s_service
  local_port       = var.k8s_port
  connections      = var.k8s_connections
  enabled          = var.k8s_enabled
}

resource "scc_system_certificate_self_signed" "self_signed_cert" {
  key_size = 2048
  subject_dn = {
    cn = var.cert_cn
  }
}

resource "scc_ca_certificate_self_signed" "self_signed_cert" {
  key_size = 2048
  subject_dn = {
    cn = var.cert_cn
  }
}

resource "scc_ui_certificate_self_signed" "self_signed_cert" {
  key_size = 2048
  subject_dn = {
    cn = var.cert_cn
  }
}