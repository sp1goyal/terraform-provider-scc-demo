variable "region_host" {
  type        = string
  description = "The host of the Cloud Connector region that specifies the SAP BTP region where the subaccount will be connected."
  default     = "cf.eu12.hana.ondemand.com"
}

variable "subaccount" {
  type        = string
  description = "The unique ID (GUID) of the SAP BTP subaccount to be connected via the Cloud Connector."
}

variable "cloud_user" {
  type        = string
  description = "The user ID for the specified SAP BTP subaccount and region, used to authenticate with the Cloud Connector."
}

variable "cloud_password" {
  type        = string
  description = "The password associated with the cloud user for authenticating with the Cloud Connector."
}

variable "virtual_host" {
  type        = string
  description = "The virtual host name as exposed to consumers of the Cloud Connector mapping."
  default     = "s4h"
}

variable "virtual_port" {
  type        = string
  description = "The virtual port number exposed for the mapped system."
  default     = "500"
}

variable "internal_host" {
  type        = string
  description = "The actual IP or hostname of the internal system behind the Cloud Connector."
  default     = "34.32.203.52"
}

variable "internal_port" {
  type        = string
  description = "The port number of the internal system to which the Cloud Connector connects."
  default     = "50000"
}

variable "virtual_domain" {
  type        = string
  description = "The virtual domain name used by external consumers to reach the mapped system."
  default     = "www1.test-system.cloud"
}

variable "internal_domain" {
  type        = string
  description = "The internal domain name of the system as known within the private network."
  default     = "ecc60.mycompany.corp"
}

variable "k8s_cluster" {
  type        = string
  description = "The name of the Kubernetes cluster to connect to."
  default     = "my-k8s-cluster"
}

variable "k8s_service" {
  type        = string
  description = "The name of the Kubernetes service to connect to."
  default     = "my-k8s-service"
}

variable "k8s_port" {
  type        = number
  description = "The port number of the Kubernetes service to connect to."
  default     = 2000
}

variable "k8s_connections" {
  type        = number
  description = "The maximum number of connections allowed to the Kubernetes service."
  default     = 10
}

variable "k8s_enabled" {
  type        = bool
  description = "Flag to enable or disable the Kubernetes service channel."
  default     = false
}

variable "abap_cloud_tenant_host" {
  type        = string
  description = "The host name of the ABAP cloud tenant to connect to."
  default     = "my-abap-cloud-tenant.s4hana.cloud"
}

variable "abap_instance_number" {
  type        = string
  description = "The instance number of the ABAP system to connect to."
  default     = "00"
}

variable "abap_connections" {
  type        = number
  description = "The maximum number of connections allowed to the ABAP system."
  default     = 10
}

variable "abap_enabled" {
  type        = bool
  description = "Flag to enable or disable the ABAP service channel."
  default     = false
}

variable "cert_cn" {
  type        = string
  description = "The Common Name (CN) to be used in the subject of the self-signed certificates."
  default     = "my-cert"
}