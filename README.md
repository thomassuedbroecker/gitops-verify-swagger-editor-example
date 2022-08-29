# gitops-verify-swagger-editor-example
This project verifies the swagger-editor-example implementation(https://github.com/cloud-native-toolkit/terraform-tools-swaggereditor)

# Understanding the module

## Tools used by the module

  * [IBM Cloud Garage CLI](https://github.com/cloud-native-toolkit/ibm-garage-cloud-cli)
    * That tool support CI/CD in a Kubernetes environment using Tekton and Argo CD projects configured with helm. ([Example blog post](https://suedbroecker.net/2021/03/24/start-with-cicd-using-the-cloud-native-toolkit/)) The following list contains possible commands.

    ```sh
    ...
    Commands:
  igc console                               Launch the IKS or OpenShift admin
                                            console
  igc create-webhook                        Create a git webhook for a given
                                            Jenkins pipeline
  igc credentials                           Lists the urls and credentials for
                                            the tools deployed to the cluster
  igc dashboard                             Open the Developer Dashboard in the
                                            default browser
  igc enable                                Enable the current repository with
                                            pipeline logic
  igc endpoints                             List the current ingress hosts for
                                            deployed apps in a namespace
                                         [aliases: ingress, endpoint, ingresses]
  igc git-secret [name]                     Create a kubernetes secret that
                                            contains the url, username, and
                                            personal access token for a git repo
  igc git [remote]                          Launches a browser to the git repo
                                            url specified by the remote. If not
                                            provided remote defaults to origin
  igc gitops-module [name] [contentDir]     Populates the gitops repo with the
                                            provided module contents and
                                            configures the ArgoCD application
  igc gitops-namespace [name] [contentDir]  Populates the gitops repo with the
                                            configuration for a namespace
  igc gitops [gitUrl]                       Registers the git repository in the
                                            kubernetes cluster as the gitops
                                            repository for the given namespace
  igc install-plugins                       Install igc commands as plugins to
                                            the kubectl and oc clis
    ...
    ```

    The relevant command for us is `gitops-module`:
    
    ```sh
    igc gitops-module [name] [contentDir]     Populates the gitops repo with the
                                            provided module contents and
                                            configures the ArgoCD application
    ```

## Verify the input for the swagger-editor module?

  * OpenShift
  * VPC
  * Argo CD configuation

## Can the swagger-editor module be instantiated reusing the existing environment/infrasture already created?

  * If yes, what are the needed entries in a BOM?
  * If no, what are the needed entries in a BOM?

## How is the implementation of the swagger-editor module organized?

  * Which input does it has?
    * Parameters?
  * What does it create?
  * Which automation (bash scripts) does it use and what is realized in that automations?
  * Do we need to know some on special terraform functionaly used?



# Setup the module on a OpenShift cluster

## Step 1: XXX