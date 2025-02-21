# Continuous integration and delivery 

💡 [Tap here](https://new.oprosso.net/p/4cb31ec3f47a4596bc758ea1861fb624) **to leave your feedback on the project**. It's anonymous and will help our team make your educational experience better. We recommend completing the survey immediately after the project.

## Contents

1. [Chapter I](#chapter-i) 
2. [Chapter II](#chapter-ii) \
   2.1. [CI and CD setup](#part-1-ci-and-Cd-setup)

## Chapter I

CI/CD is a set of practices that allow developers to establish and simplify the process of deploying the application they develop. Continuous integration allows the application development process to be presented as a sequence of small iterations, each of which tries to maintain continuity when it comes to integrating changes. This means that the code is modified in the version control system, automatically built and tested with each significant modification. Continuous delivery is responsible for deploying the built application to the target environment. In this way, CI/CD principles allow changes to reach production safely and continuously.

## Chapter II

The result of the work must be a report with detailed descriptions of the implementation of each of the points with screenshots. The report is prepared as a markdown file in the `src` directory named `REPORT.MD`.

## Part 1. CI and CD setup

**== Task ==**

1) Clone a working repository

2) Get access to a remote Kubernetes cluster

3) Create a separate namespace for the gitlab runner

4) Install a GitLab runner in a Kubernetes cluster: you can use the helm chart for the GitLab runner to install it in your Kubernetes cluster. The helm chart will automatically create a deployment for the runner, which will create one or more modules that execute application container jobs.

5) Create a secret to store the gitlab registration token.

6) Create a `config.toml` configuration file to use the kubernetes runner installed on the given cluster. There you must also specify the resource limits and the docker image (e.g.`docker:stable`). Register the installed runner using the written configuration file.

7) Develop the following Pipeline:

- build - building the application (run automatically for branches with the prefix `feature_`)
- test - running unit tests and postman functional tests via the newman utility (run automatically for branches with the prefix `feature_`)
- staging - running an application in a staging environment (run manually and only for tags)

8) Use secrets to pass private keys to services for authorization (application.properties file in services source code directory).

9) Make a change to the application code. Add a new dependency to the pom.xml file and commit the change.
