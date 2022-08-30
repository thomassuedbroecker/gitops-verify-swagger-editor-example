## gitops-repo_host: The host for the git repository. The git host used can be a GitHub, GitHub Enterprise, Gitlab, Bitbucket, Gitea or Azure DevOps server. If the host is null assumes in-cluster Gitea instance will be used.
#gitops-repo_host="github.com"

## gitops-repo_org: The org/group where the git repository exists/will be provisioned. If the value is left blank then the username org will be used.
#gitops-repo_org="thomassuedbroecker"

## gitops-repo_project: The project that will be used for the git repo. (Primarily used for Azure DevOps repos)
#gitops-repo_project="iascable-gitops-swagger"

## gitops-repo_username: The username of the user with access to the repository
#gitops-repo_username="thomassuedbroecker"

## gitops-repo_token: The personal access token used to access the repository
#gitops-repo_token=""

## ibmcloud_api_key: the value of ibmcloud_api_key
#ibmcloud_api_key=""

## region: the value of region
#region=""

## worker_count: The number of worker nodes that should be provisioned for classic infrastructure
#worker_count="2"

## ibm-ocp-vpc_flavor: The machine type that will be provisioned for classic infrastructure
#ibm-ocp-vpc_flavor="bx2.4x16"

## ibm-vpc-subnets__count: The number of subnets that should be provisioned
#ibm-vpc-subnets__count="1"

## namespace_name: The value that should be used for the namespace
#namespace_name=""

## resource_group_name: The name of the resource group
#resource_group_name=""

