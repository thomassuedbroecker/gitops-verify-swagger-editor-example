# gitops-verify-swagger-editor-example

This project verifies the implementation of following modules:

* [terraform-tools-swaggereditor](https://github.com/cloud-native-toolkit/terraform-tools-swaggereditor) 
* [template-terraform-gitops](https://github.com/cloud-native-toolkit/template-terraform-gitops)

# Understanding the modules

## 1. [template-terraform-gitops](https://github.com/cloud-native-toolkit/template-terraform-gitops)

The [template-terraform-gitops](https://github.com/cloud-native-toolkit/template-terraform-gitops) is a part of the `How to` instructions of the [`Technology Zone Accelerator Toolkit`](https://modules.cloudnativetoolkit.dev/). 
The module covers the [GitOps topic](https://modules.cloudnativetoolkit.dev/#/how-to/gitops).

### TBD


## 2. [terraform-tools-swaggereditor](https://github.com/cloud-native-toolkit/terraform-tools-swaggereditor)

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

### f. Setup the module on a OpenShift cluster

#### Step 1: XXX