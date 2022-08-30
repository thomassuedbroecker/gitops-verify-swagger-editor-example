variable "gitops-repo_host" {
  type = string
  description = "The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used."
  default = "github.com"
}
variable "gitops-repo_type" {
  type = string
  description = "[Deprecated] The type of the hosted git repository."
  default = "GIT"
}
variable "gitops-repo_org" {
  type = string
  description = "The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used."
  default = "thomassuedbroecker"
}
variable "gitops-repo_project" {
  type = string
  description = "The project that will be used for the git repo. (Primarily used for Azure DevOps repos)"
  default = "iascable-gitops-swagger"
}
variable "gitops-repo_username" {
  type = string
  description = "The username of the user with access to the repository"
  default = "thomassuedbroecker"
}
variable "gitops-repo_token" {
  type = string
  description = "The personal access token used to access the repository"
  default = ""
}
variable "gitops-repo_gitea_host" {
  type = string
  description = "The host for the default gitea repository."
  default = ""
}
variable "gitops-repo_gitea_org" {
  type = string
  description = "The org/group for the default gitea repository. If not provided, the value will default to the username org"
  default = ""
}
variable "gitops-repo_gitea_username" {
  type = string
  description = "The username of the default gitea repository"
  default = ""
}
variable "gitops-repo_gitea_token" {
  type = string
  description = "The personal access token used to access the repository"
  default = ""
}
variable "gitops-repo_repo" {
  type = string
  description = "The short name of the repository (i.e. the part after the org/group name)"
  default = "iascable-gitops-swagger"
}
variable "gitops-repo_branch" {
  type = string
  description = "The name of the branch that will be used. If the repo already exists (provision=false) then it is assumed this branch already exists as well"
  default = "main"
}
variable "gitops-repo_public" {
  type = bool
  description = "Flag indicating that the repo should be public or private"
  default = false
}
variable "gitops-repo_gitops_namespace" {
  type = string
  description = "The namespace where ArgoCD is running in the cluster"
  default = "openshift-gitops"
}
variable "gitops-repo_server_name" {
  type = string
  description = "The name of the cluster that will be configured via gitops. This is used to separate the config by cluster"
  default = "default"
}
variable "gitops-repo_strict" {
  type = bool
  description = "Flag indicating that an error should be thrown if the repo already exists"
  default = false
}
variable "argocd-bootstrap_bootstrap_prefix" {
  type = string
  description = "The prefix used in ArgoCD to bootstrap the application"
  default = ""
}
variable "argocd-bootstrap_create_webhook" {
  type = bool
  description = "Flag indicating that a webhook should be created in the gitops repo to notify argocd of changes"
  default = false
}
variable "gitops-swagger-editor_enable_sso" {
  type = bool
  description = "Flag indicating if oauth should be applied (only available for OpenShift)"
  default = true
}
variable "gitops-swagger-editor_tls_secret_name" {
  type = string
  description = "The name of the secret containing the tls certificate values"
  default = ""
}
variable "gitops-swagger-editor_cluster_ingress_hostname" {
  type = string
  description = "Ingress hostname of the cluster."
  default = ""
}
variable "gitops-swagger-editor_cluster_type" {
  type = string
  description = "The cluster type (openshift or kubernetes)"
  default = "openshift"
}
variable "ibm-object-storage_resource_location" {
  type = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
  default = "global"
}
variable "ibm-object-storage_tags" {
  type = string
  description = "Tags that should be applied to the service"
  default = "[\"tsuedro\"]"
}
variable "name_prefix" {
  type = string
  description = "The prefix name for the service. If not provided it will default to the resource group name"
  default = ""
}
variable "ibm-object-storage_plan" {
  type = string
  description = "The type of plan the service instance should run under (lite or standard)"
  default = "standard"
}
variable "ibm-object-storage_provision" {
  type = bool
  description = "Flag indicating that cos instance should be provisioned"
  default = true
}
variable "ibm-object-storage_label" {
  type = string
  description = "The name that should be used for the service, particularly when connecting to an existing service. If not provided then the name will be defaulted to {name prefix}-{service}"
  default = "cos_tsued"
}
variable "ibmcloud_api_key" {
  type = string
  description = "the value of ibmcloud_api_key"
}
variable "region" {
  type = string
  description = "the value of region"
}
variable "ibm-ocp-vpc_name" {
  type = string
  description = "The name of the cluster that will be created within the resource group"
  default = "tsued-gitops-swagger"
}
variable "worker_count" {
  type = number
  description = "The number of worker nodes that should be provisioned for classic infrastructure"
  default = 2
}
variable "ibm-ocp-vpc_flavor" {
  type = string
  description = "The machine type that will be provisioned for classic infrastructure"
  default = "bx2.4x16"
}
variable "ocp_version" {
  type = string
  description = "The version of the OpenShift cluster that should be provisioned (format 4.x)"
  default = "4.10"
}
variable "ibm-ocp-vpc_exists" {
  type = bool
  description = "Flag indicating if the cluster already exists (true or false)"
  default = false
}
variable "ibm-ocp-vpc_disable_public_endpoint" {
  type = bool
  description = "Flag indicating that the public endpoint should be disabled"
  default = false
}
variable "ibm-ocp-vpc_ocp_entitlement" {
  type = string
  description = "Value that is applied to the entitlements for OCP cluster provisioning"
  default = "cloud_pak"
}
variable "ibm-ocp-vpc_force_delete_storage" {
  type = bool
  description = "Attribute to force the removal of persistent storage associtated with the cluster"
  default = false
}
variable "ibm-ocp-vpc_tags" {
  type = string
  description = "Tags that should be added to the instance"
  default = "[\"tsuedro\"]"
}
variable "ibm-ocp-vpc_kms_enabled" {
  type = bool
  description = "Flag indicating that kms encryption should be enabled for this cluster"
  default = false
}
variable "ibm-ocp-vpc_kms_id" {
  type = string
  description = "The crn of the KMS instance that will be used to encrypt the cluster."
  default = null
}
variable "ibm-ocp-vpc_kms_key_id" {
  type = string
  description = "The id of the root key in the KMS instance that will be used to encrypt the cluster."
  default = null
}
variable "ibm-ocp-vpc_kms_private_endpoint" {
  type = bool
  description = "Flag indicating that the private endpoint should be used to connect the KMS system to the cluster."
  default = true
}
variable "ibm-ocp-vpc_login" {
  type = bool
  description = "Flag indicating that after the cluster is provisioned, the module should log into the cluster"
  default = false
}
variable "ibm-vpc_name" {
  type = string
  description = "The name of the vpc instance"
  default = "tsued-gitops-swagger"
}
variable "ibm-vpc_provision" {
  type = bool
  description = "Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up"
  default = true
}
variable "ibm-vpc_address_prefix_count" {
  type = number
  description = "The number of ipv4_cidr_blocks"
  default = 0
}
variable "ibm-vpc_address_prefixes" {
  type = string
  description = "List of ipv4 cidr blocks for the address prefixes (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default = "[]"
}
variable "ibm-vpc_base_security_group_name" {
  type = string
  description = "The name of the base security group. If not provided the name will be based on the vpc name"
  default = ""
}
variable "ibm-vpc_internal_cidr" {
  type = string
  description = "The cidr range of the internal network"
  default = "10.0.0.0/8"
}
variable "ibm-vpc_tags" {
  type = string
  description = "Tags that should be added to the instance"
  default = "[\"tsuedro\"]"
}
variable "ibm-vpc-gateways_provision" {
  type = bool
  description = "Flag indicating that the gateway must be provisioned"
  default = true
}
variable "ibm-vpc-gateways_tags" {
  type = string
  description = "Tags that should be added to the instance"
  default = "[]"
}
variable "ibm-vpc-subnets_zone_offset" {
  type = number
  description = "The offset for the zone where the subnet should be created. The default offset is 0 which means the first subnet should be created in zone xxx-1"
  default = 0
}
variable "ibm-vpc-subnets__count" {
  type = number
  description = "The number of subnets that should be provisioned"
  default = 1
}
variable "ibm-vpc-subnets_label" {
  type = string
  description = "Label for the subnets created"
  default = "default"
}
variable "ibm-vpc-subnets_ipv4_cidr_blocks" {
  type = string
  description = "List of ipv4 cidr blocks for the subnets that will be created (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value."
  default = "[]"
}
variable "ibm-vpc-subnets_ipv4_address_count" {
  type = number
  description = "The size of the ipv4 cidr block that should be allocated to the subnet. If {ipv4_cidr_blocks} are provided then this value is ignored."
  default = 256
}
variable "ibm-vpc-subnets_provision" {
  type = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default = true
}
variable "ibm-vpc-subnets_acl_rules" {
  type = string
  description = "List of rules to set on the subnet access control list"
  default = "[]"
}
variable "ibm-vpc-subnets_tags" {
  type = string
  description = "Tags that should be added to the instance"
  default = "[\"tsuedro\"]"
}
variable "sealed-secret-cert_cert" {
  type = string
  description = "The public key that will be used to encrypt sealed secrets. If not provided, a new one will be generated"
  default = ""
}
variable "sealed-secret-cert_private_key" {
  type = string
  description = "The private key that will be used to decrypt sealed secrets. If not provided, a new one will be generated"
  default = ""
}
variable "sealed-secret-cert_cert_file" {
  type = string
  description = "The file containing the public key that will be used to encrypt the sealed secrets. If not provided a new public key will be generated"
  default = ""
}
variable "sealed-secret-cert_private_key_file" {
  type = string
  description = "The file containin the private key that will be used to encrypt the sealed secrets. If not provided a new private key will be generated"
  default = ""
}
variable "namespace_name" {
  type = string
  description = "The value that should be used for the namespace"
}
variable "namespace_ci" {
  type = bool
  description = "Flag indicating that this namespace will be used for development (e.g. configmaps and secrets)"
  default = false
}
variable "namespace_create_operator_group" {
  type = bool
  description = "Flag indicating that an operator group should be created in the namespace"
  default = true
}
variable "namespace_argocd_namespace" {
  type = string
  description = "The namespace where argocd has been deployed"
  default = "openshift-gitops"
}
variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}
variable "resource_group_sync" {
  type = string
  description = "Value used to order the provisioning of the resource group"
  default = ""
}
variable "purge_volumes" {
  type = bool
  description = "Flag indicating that any volumes in the resource group should be automatically destroyed before destroying the resource group. If volumes exist and the flag is false then the destroy will fail."
  default = false
}
