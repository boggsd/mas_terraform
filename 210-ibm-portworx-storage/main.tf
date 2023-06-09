module "gitops_repo" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitops?ref=v1.23.3"

  branch = var.gitops_repo_branch
  debug = var.debug
  gitea_host = var.gitops_repo_gitea_host
  gitea_org = var.gitops_repo_gitea_org
  gitea_token = var.gitops_repo_gitea_token
  gitea_username = var.gitops_repo_gitea_username
  gitops_namespace = var.gitops_repo_gitops_namespace
  host = var.gitops_repo_host
  org = var.gitops_repo_org
  project = var.gitops_repo_project
  public = var.gitops_repo_public
  repo = var.gitops_repo_repo
  sealed_secrets_cert = var.gitops_repo_sealed_secrets_cert
  server_name = var.gitops_repo_server_name
  strict = var.gitops_repo_strict
  token = var.gitops_repo_token
  type = var.gitops_repo_type
  username = var.gitops_repo_username
}
module "gitops-ibm-portworx" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-ibm-portworx?ref=v0.5.0"

  capacity = var.gitops-ibm-portworx_capacity
  default_block_storage_class = var.gitops-ibm-portworx_default_block_storage_class
  default_file_storage_class = var.gitops-ibm-portworx_default_file_storage_class
  default_rwo_storage_class = var.gitops-ibm-portworx_default_rwo_storage_class
  default_rwx_storage_class = var.gitops-ibm-portworx_default_rwx_storage_class
  encryption_key = var.gitops-ibm-portworx_encryption_key
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  ibmcloud_api_key = var.ibmcloud_api_key
  iops = var.gitops-ibm-portworx_iops
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  profile = var.gitops-ibm-portworx_profile
  region = var.region
  resource_group_id = module.resource_group.id
  server_name = module.gitops_repo.server_name
}
module "gitops-ibmcloud-operator" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-ibmcloud-operator?ref=v0.2.2"

  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  kubeseal_cert = module.gitops_repo.sealed_secrets_cert
  server_name = module.gitops_repo.server_name
}
module "portworx_namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.12.2"

  argocd_namespace = var.portworx_namespace_argocd_namespace
  ci = var.portworx_namespace_ci
  create_operator_group = var.portworx_namespace_create_operator_group
  git_credentials = module.gitops_repo.git_credentials
  gitops_config = module.gitops_repo.gitops_config
  name = var.portworx_namespace_name
  server_name = module.gitops_repo.server_name
}
module "resource_group" {
  source = "github.com/terraform-ibm-modules/terraform-ibm-toolkit-resource-group?ref=v3.3.5"

  ibmcloud_api_key = var.ibmcloud_api_key
  purge_volumes = var.purge_volumes
  resource_group_name = var.resource_group_name
  sync = var.resource_group_sync
}
module "util-clis" {
  source = "cloud-native-toolkit/clis/util"
  version = "1.19.0"

  bin_dir = var.util-clis_bin_dir
  clis = var.util-clis_clis == null ? null : jsondecode(var.util-clis_clis)
}
