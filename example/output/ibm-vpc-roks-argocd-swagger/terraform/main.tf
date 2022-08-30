module "argocd-bootstrap" {
  source = "github.com/cloud-native-toolkit/terraform-tools-argocd-bootstrap?ref=v1.12.0"

  bootstrap_path = module.gitops-repo.bootstrap_path
  bootstrap_prefix = var.argocd-bootstrap_bootstrap_prefix
  cluster_config_file = module.ibm-ocp-vpc.config_file_path
  cluster_type = module.ibm-ocp-vpc.platform.type_code
  create_webhook = var.argocd-bootstrap_create_webhook
  git_token = module.gitops-repo.config_token
  git_username = module.gitops-repo.config_username
  gitops_repo_url = module.gitops-repo.config_repo_url
  ingress_subdomain = module.ibm-ocp-vpc.platform.ingress
  olm_namespace = module.olm.olm_namespace
  operator_namespace = module.olm.target_namespace
  sealed_secret_cert = module.sealed-secret-cert.cert
  sealed_secret_private_key = module.sealed-secret-cert.private_key
}
module "gitops-repo" {
  source = "github.com/cloud-native-toolkit/terraform-tools-gitops?ref=v1.20.2"

  branch = var.gitops-repo_branch
  gitea_host = var.gitops-repo_gitea_host
  gitea_org = var.gitops-repo_gitea_org
  gitea_token = var.gitops-repo_gitea_token
  gitea_username = var.gitops-repo_gitea_username
  gitops_namespace = var.gitops-repo_gitops_namespace
  host = var.gitops-repo_host
  org = var.gitops-repo_org
  project = var.gitops-repo_project
  public = var.gitops-repo_public
  repo = var.gitops-repo_repo
  sealed_secrets_cert = module.sealed-secret-cert.cert
  server_name = var.gitops-repo_server_name
  strict = var.gitops-repo_strict
  token = var.gitops-repo_token
  type = var.gitops-repo_type
  username = var.gitops-repo_username
}
module "gitops-swagger-editor" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-swagger-editor?ref=v0.0.1"

  cluster_ingress_hostname = var.gitops-swagger-editor_cluster_ingress_hostname
  cluster_type = var.gitops-swagger-editor_cluster_type
  enable_sso = var.gitops-swagger-editor_enable_sso
  git_credentials = module.gitops-repo.git_credentials
  gitops_config = module.gitops-repo.gitops_config
  kubeseal_cert = module.gitops-repo.sealed_secrets_cert
  namespace = module.namespace.name
  server_name = module.gitops-repo.server_name
  tls_secret_name = var.gitops-swagger-editor_tls_secret_name
}
module "ibm-object-storage" {
  source = "cloud-native-toolkit/object-storage/ibm"
  version = "4.0.3"

  label = var.ibm-object-storage_label
  name_prefix = var.name_prefix
  plan = var.ibm-object-storage_plan
  provision = var.ibm-object-storage_provision
  resource_group_name = module.resource_group.name
  resource_location = var.ibm-object-storage_resource_location
  tags = var.ibm-object-storage_tags == null ? null : jsondecode(var.ibm-object-storage_tags)
}
module "ibm-ocp-vpc" {
  source = "cloud-native-toolkit/ocp-vpc/ibm"
  version = "1.15.5"

  cos_id = module.ibm-object-storage.id
  disable_public_endpoint = var.ibm-ocp-vpc_disable_public_endpoint
  exists = var.ibm-ocp-vpc_exists
  flavor = var.ibm-ocp-vpc_flavor
  force_delete_storage = var.ibm-ocp-vpc_force_delete_storage
  ibmcloud_api_key = var.ibmcloud_api_key
  kms_enabled = var.ibm-ocp-vpc_kms_enabled
  kms_id = var.ibm-ocp-vpc_kms_id
  kms_key_id = var.ibm-ocp-vpc_kms_key_id
  kms_private_endpoint = var.ibm-ocp-vpc_kms_private_endpoint
  login = var.ibm-ocp-vpc_login
  name = var.ibm-ocp-vpc_name
  name_prefix = var.name_prefix
  ocp_entitlement = var.ibm-ocp-vpc_ocp_entitlement
  ocp_version = var.ocp_version
  region = var.region
  resource_group_name = module.resource_group.name
  sync = module.resource_group.sync
  tags = var.ibm-ocp-vpc_tags == null ? null : jsondecode(var.ibm-ocp-vpc_tags)
  vpc_name = module.ibm-vpc-subnets.vpc_name
  vpc_subnet_count = module.ibm-vpc-subnets.count
  vpc_subnets = module.ibm-vpc-subnets.subnets
  worker_count = var.worker_count
}
module "ibm-vpc" {
  source = "cloud-native-toolkit/vpc/ibm"
  version = "1.16.0"

  address_prefix_count = var.ibm-vpc_address_prefix_count
  address_prefixes = var.ibm-vpc_address_prefixes == null ? null : jsondecode(var.ibm-vpc_address_prefixes)
  base_security_group_name = var.ibm-vpc_base_security_group_name
  internal_cidr = var.ibm-vpc_internal_cidr
  name = var.ibm-vpc_name
  name_prefix = var.name_prefix
  provision = var.ibm-vpc_provision
  region = var.region
  resource_group_name = module.resource_group.name
  tags = var.ibm-vpc_tags == null ? null : jsondecode(var.ibm-vpc_tags)
}
module "ibm-vpc-gateways" {
  source = "cloud-native-toolkit/vpc-gateways/ibm"
  version = "1.9.0"

  provision = var.ibm-vpc-gateways_provision
  region = var.region
  resource_group_id = module.resource_group.id
  tags = var.ibm-vpc-gateways_tags == null ? null : jsondecode(var.ibm-vpc-gateways_tags)
  vpc_name = module.ibm-vpc.name
}
module "ibm-vpc-subnets" {
  source = "cloud-native-toolkit/vpc-subnets/ibm"
  version = "1.13.2"

  _count = var.ibm-vpc-subnets__count
  acl_rules = var.ibm-vpc-subnets_acl_rules == null ? null : jsondecode(var.ibm-vpc-subnets_acl_rules)
  gateways = module.ibm-vpc-gateways.gateways
  ipv4_address_count = var.ibm-vpc-subnets_ipv4_address_count
  ipv4_cidr_blocks = var.ibm-vpc-subnets_ipv4_cidr_blocks == null ? null : jsondecode(var.ibm-vpc-subnets_ipv4_cidr_blocks)
  label = var.ibm-vpc-subnets_label
  provision = var.ibm-vpc-subnets_provision
  region = var.region
  resource_group_name = module.resource_group.name
  tags = var.ibm-vpc-subnets_tags == null ? null : jsondecode(var.ibm-vpc-subnets_tags)
  vpc_name = module.ibm-vpc.name
  zone_offset = var.ibm-vpc-subnets_zone_offset
}
module "namespace" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-namespace?ref=v1.11.2"

  argocd_namespace = var.namespace_argocd_namespace
  ci = var.namespace_ci
  create_operator_group = var.namespace_create_operator_group
  git_credentials = module.gitops-repo.git_credentials
  gitops_config = module.gitops-repo.gitops_config
  name = var.namespace_name
  server_name = module.gitops-repo.server_name
}
module "olm" {
  source = "github.com/cloud-native-toolkit/terraform-k8s-olm?ref=v1.3.2"

  cluster_config_file = module.ibm-ocp-vpc.config_file_path
  cluster_type = module.ibm-ocp-vpc.platform.type_code
  cluster_version = module.ibm-ocp-vpc.platform.version
}
module "resource_group" {
  source = "cloud-native-toolkit/resource-group/ibm"
  version = "3.3.3"

  ibmcloud_api_key = var.ibmcloud_api_key
  purge_volumes = var.purge_volumes
  resource_group_name = var.resource_group_name
  sync = var.resource_group_sync
}
module "sealed-secret-cert" {
  source = "github.com/cloud-native-toolkit/terraform-util-sealed-secret-cert?ref=v1.0.1"

  cert = var.sealed-secret-cert_cert
  cert_file = var.sealed-secret-cert_cert_file
  private_key = var.sealed-secret-cert_private_key
  private_key_file = var.sealed-secret-cert_private_key_file
}
