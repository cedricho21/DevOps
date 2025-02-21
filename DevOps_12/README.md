# Helm и Kustomization

💡 [Tap here](https://new.oprosso.net/p/4cb31ec3f47a4596bc758ea1861fb624) **to leave your feedback on the project**. It's anonymous and will help our team make your educational experience better. We recommend completing the survey immediately after the project.

## Contents

1. [Chapter I](#chapter-i) 
2. [Chapter II](#chapter-ii) \
   2.1. [Deploying an application using Kustomize](#part-1-deploying-an-application-using-Kustomize) \
   2.2. [Deploying an application using Helm](#part-2-deploying-an-application-using-Helm) \

## Chapter I

Kubernetes is one of the fastest growing technologies, and all companies are now deploying it. When you run any application in Kubernetes, you need to deploy a lot of objects, such as deployment, configuration map, secrets, etc. You need to define all these objects in the manifest.yml file and send these files to the Kubernetes API server. Kubernetes reads these manifest files and creates the necessary objects.

Deploying an application once is fine, but if you want to deploy the application over and over again, you need to send all the manifest files to the Kubernetes API server again and again. Helm is a tool that solves this problem.

Helm is a package manager for Kubernetes that provides a solution for package management, security, and configuration when deploying applications to Kubernetes. Helm simplifies your work with Kubernetes. 

At the same time, Kustomize is becoming an increasingly popular tool for managing Kubernetes manifests. Instead of using templates, as Helm does, Kustomize works by relying on existing manifests. Using this template, it provides various features, including resource namespace, metadata modification, and Kubernetes secret creation, all without editing the  source manifests.

## Chapter II

The result of the work must be a report with detailed descriptions of the implementation of each of the points with screenshots. The report is prepared as a markdown file in the `src` directory named `REPORT.MD`.

## Part 1. Deploying an application using Kustomize

**== Task ==**

1) Get a set of virtual machines with a deployed cluster

2) Copy the manifests from the previous blocks

3) Install *kustomize* on the local machine

4) Create a deployment project skeleton with one base configuration and one overlay configuration (production):

```
├── base
│   ├── deployment.yaml
│   ├── kustomization.yaml
│   ├── service.yaml
│   └── ...
├── overlays
│   └── production
│       ├── kustomization.yaml
│       ├── configMap.yaml
│       ├── secret.yaml
│       └── ...
├── kustomization.yaml
└── ...
```

5) Write base and overlay configurations for kustomize. Specify services and deployments in the base, and add specific secrets and configuration values in the production.

6) Create `replicas-patch.yaml` for the production overlay, which modifies the number of replicas for the gateway service deployment to 3 replicas.

7) Build the resulting configuration file, taking into account the `production` overlay.

8) Run postman functional tests and make sure that the application works.


## Part 2. Deploying an application using Helm

**== Task ==**

1) Get a set of virtual machines with a deployed cluster

2) Copy the manifests from the previous blocks

3) Install *helm* on the local machine and make sure that this tool has a valid connection to the resulting remote Kubernetes cluster

4) Create *helm* charts and templates for your application with the `helm create` command. This command will create a basic chart structure with templates for the resources: deployment, service and ingress.

5) Edit the `values.yaml` file in the chart to specify the configuration parameters for your application needed to create Kubernetes manifests for the specified deployments. Describe the deployment objects and services in the templates directory. 

6) Pack the *helm* chart using the `helm package` command to create a `*.tgz` file containing the chart and its dependencies.

7) Deploy *helm* chart in the Kubernetes cluster using the `helm install` command. Specify an arbitrary `namespace` and `release-name`.

8) Check the status of the deployed application with the `kubectl get` command. Add the results in the report.

9) Make at least one change to `values.yaml` and run the `helm upgrade` command. 

10) Run postman functional tests and make sure that the application works.
