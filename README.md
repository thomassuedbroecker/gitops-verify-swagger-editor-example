# gitops-verify-swagger-editor-example

# Objective

The objective is to understand how to build new modules for the [`Technology Zone Accelerator Toolkit`](https://modules.cloudnativetoolkit.dev/).

# What does the project do?

In this project we inspect the implementation of following module:

* [terraform-gitops-swagger-editor](https://github.com/cloud-native-toolkit/terraform-gitops-swagger-editor) 

> The current project is related to the inspection of the project [gitops-create-software-everywhere-module](https://github.com/thomassuedbroecker/gitops-create-software-everywhere-module).

# Understanding the module

## 1. [gitops-create-software-everywhere-module](https://github.com/thomassuedbroecker/gitops-create-software-everywhere-module)

### a. Tools used by the module

  * [IBM Cloud Garage CLI](https://github.com/cloud-native-toolkit/ibm-garage-cloud-cli)
    * That tool support CI/CD in a Kubernetes environment using Tekton and Argo CD projects configured with helm. ([Example blog post](https://suedbroecker.net/2021/03/24/start-with-cicd-using-the-cloud-native-toolkit/)) 

The relevant command from `IBM Cloud Garage CLI` for us is the `gitops-module`:
    
```sh
igc gitops-module [name] [contentDir]

Populates the gitops repo with the provided module contents and configures the
ArgoCD application

Positionals:
  name  The name of the module that will be added to GitOps             [string]

Options:
      --version                Show version number                     [boolean]
      --help                   Show help                               [boolean]
  -c, --contentDir             The directory where the payload content has been
                               placed. If not provided defaults to current
                               working directory.                       [string]
  -n, --namespace              Namespace where the secret should be created
                                                             [string] [required]
  -l, --layer                  The gitops layer where the configuration will be
                               deployed (infrastructure, services, applications)
                         [choices: "infrastructure", "services", "applications"]
      --gitopsConfigFile       Name of yaml or json file that contains the
                               gitops config values                     [string]
      --bootstrapRepoUrl       Url of the bootstrap repo that contains the
                               gitops config yaml                       [string]
      --gitopsCredentialsFile  Name of yaml or json file that contains the
                               gitops credentials                       [string]
      --token                  Git personal access token to access gitops repo
                                                                        [string]
      --applicationPath        The path within the payload directory structure
                               where the payload config should be placed. If not
                               provided will default to `name`          [string]
      --branch                 The branch where the payload has been deployed
      --type                   The type of component added to the GitOps repo.
                   [choices: "base", "operators", "instances"] [default: "base"]
      --serverName             The name of the cluster. If not provided will use
                               `default`
      --valueFiles             Comma-separated list of value files that should
                               be applied to the Argo CD application if using a
                               helm chart
      --lock                   Git repo locking style
       [choices: "optimistic", "pessimistic", "branch", "o", "p", "b"] [default:
                                                                       "branch"]
      --autoMerge              Flag indicating that the branch/PR should be
                               automatically merged. Only applies if lock
                               strategy is branch      [boolean] [default: true]
      --rateLimit              Flag indicating that the calls to the git api
                               should be rate limited.[boolean] [default: false]
      --tmpDir                 The temp directory where the gitops repo should
                               be checked out
                                        [string] [default: "/tmp/gitops-module"]
      --debug                  Turn on debug logging                   [boolean]
```

### b. Verify the input for the swagger-editor module?

  * OpenShift
  * VPC
  * Argo CD configuation

### c. Can the swagger-editor module be instantiated reusing the existing environment/infrasture already created?

  * If yes, what are the needed entries in a BOM?
  * If no, what are the needed entries in a BOM?

### d. How is the implementation of the swagger-editor module organized?

  * Which input does it has?
    * Parameters?
  * What does it create?
  * Which automation (bash scripts) does it use and what is realized in that automations?
  * Do we need to know some on special terraform functionaly used?

### f. Setup the module on an OpenShift cluster

#### Step 1: Configure a `BOM` for the entire infrastructure and application

We will reuse the BOM structure from [lab 3 operate](https://operate.cloudnativetoolkit.dev/getting-started/lab3/) and just add following lines and changing the some variable names to create different instances.

```yaml
# Install Swagger editor
    - name: gitops-swagger-editor
      alias: gitops-swagger-editor
      version: v0.0.1
```

```yaml
apiVersion: cloudnativetoolkit.dev/v1alpha1
kind: BillOfMaterial
metadata:
  name: ibm-vpc-roks-argocd-swagger
spec:
  modules:
    # Virtual Private Cloud - related
    # - subnets
    # - gateways
    - name: ibm-vpc
      alias: ibm-vpc
      version: v1.16.0
      variables:
      - name: name
        value: "tsued-gitops-swagger"
      - name: tags
        value: ["tsuedro"]
    - name: ibm-vpc-subnets
      alias: ibm-vpc-subnets
      version: v1.13.2
      variables:
        - name: _count
          value: 1
        - name: name
          value: "tsued-gitops-swagger"
        - name: tags
          value: ["tsuedro"]
    - name: ibm-vpc-gateways
    # ROKS - related
    # - objectstorage
    - name: ibm-ocp-vpc
      alias: ibm-ocp-vpc
      version: v1.15.5
      variables:
        - name: name
          value: "tsued-gitops-swagger"
        - name: worker_count
          value: 2
        - name: tags
          value: ["tsuedro"]
    - name: ibm-object-storage
      alias: ibm-object-storage
      version: v4.0.3
      variables:
        - name: name
          value: "cos_tsued_swagger"
        - name: tags
          value: ["tsuedro"]
        - name: label
          value: ["cos_tsued"]
    # Install OpenShift GitOps and Bootstrap GitOps (aka. ArgoCD) - related
    # - argocd
    # - gitops
    - name: argocd-bootstrap
      alias: argocd-bootstrap
      version: v1.12.0
      variables:
        - name: repo_token
    - name: gitops-repo
      alias: gitops-repo
      version: v1.20.2
      variables:
        - name: host
          value: "github.com"
        - name: type
          value: "GIT"
        - name: org
          value: "thomassuedbroecker"
        - name: username
          value: "thomassuedbroecker"
        - name: project
          value: "iascable-gitops-swagger"
        - name: repo
          value: "iascable-gitops-swagger"
    # Install Swagger editor
    - name: gitops-swagger-editor
      alias: gitops-swagger-editor
      version: v0.0.1
```

#### Step 2: Follow the steps written in [lab 3 operate](https://operate.cloudnativetoolkit.dev/getting-started/lab3/) just with the change BOM

