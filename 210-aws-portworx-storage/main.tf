module "aws-portworx" {
  source = "github.com/cloud-native-toolkit/terraform-aws-portworx?ref=v0.2.0"

  access_key = var.access_key
  cluster_config_file = module.cluster.config_file_path
  default_block_storage_class = var.aws-portworx_default_block_storage_class
  default_file_storage_class = var.aws-portworx_default_file_storage_class
  default_rwo_storage_class = var.aws-portworx_default_rwo_storage_class
  default_rwx_storage_class = var.aws-portworx_default_rwx_storage_class
  disk_size = var.aws-portworx_disk_size
  enable_encryption = var.aws-portworx_enable_encryption
  kvdb_disk_size = var.aws-portworx_kvdb_disk_size
  portworx_spec = var.portworx_spec
  portworx_spec_file = var.portworx_spec_file
  provision = var.aws-portworx_provision
  px_enable_csi = var.aws-portworx_px_enable_csi
  px_enable_monitoring = var.aws-portworx_px_enable_monitoring
  region = var.region
  secret_key = var.secret_key
}
module "cluster" {
  source = "github.com/cloud-native-toolkit/terraform-ocp-login?ref=v1.6.2"

  ca_cert = var.cluster_ca_cert
  ca_cert_file = var.cluster_ca_cert_file
  cluster_version = var.cluster_cluster_version
  ingress_subdomain = var.cluster_ingress_subdomain
  login_password = var.cluster_login_password
  login_token = var.cluster_login_token
  login_user = var.cluster_login_user
  server_url = var.server_url
  skip = var.cluster_skip
  tls_secret_name = var.cluster_tls_secret_name
}
