# Helm and Kustomize

*Helm* and *Kustomize* are tools for managing the Kubernetes configuration.

*Helm* is a package manager for **Kubernetes** that allows you to pack applications and their dependencies into *charts* that can be easily installed and managed in **Kubernetes**. Each chart contains **Kubernetes** manifests that describe the objects you need to deploy the application. *Helm* also allows you to manage and update versions of the charts.

In *Helm*, a *chart* is a package that contains everything you need to install and configure an application or service in a **Kubernetes** cluster. A chart can contain **Kubernetes** manifests, application settings and other files.

*Templates* are the main part of the *Helm* chart and are files that contain a certain structure and are marked with {{}}. These brackets represent variables that will be filled when executing a *Helm* install or upgrade command. Templates may contain **Kubernetes** manifests and other files that will be filled with variable values during the installation or upgrade process.

So, the chart contains all the files and settings of the application, and the templates are the mechanism for filling variables within the manifests and other files in the chart.

An example of a simple Helm Chart for deploying a Node.js application on Kubernetes:

```
├── Chart.yaml          # chart metadata
├── templates           # Kubernetes resource templates
│   ├── deployment.yaml    # deployment template
│   ├── service.yaml       # service creation template
│   └── ingress.yaml       # Ingress creation template to access the application
└── values.yaml         # default values for the chart parameters
```

`Chart.yaml` contains chart metadata such as version, name, description and dependencies:

```yaml
apiVersion: v2
name: my-node-app
description: A Helm chart for deploying a Node.js application
version: 0.1.0
appVersion: 1.0.0
dependencies:
  - name: mongodb
    version: 9.x.x
    repository: https://charts.bitnami.com/bitnami
```

`values.yaml` contains the default values for the chart parameters:

```yaml
# Number of replicas in Deployment
replicaCount: 1

# The Docker image used for the application
image:
  repository: my-node-app
  tag: latest
  pullPolicy: IfNotPresent

# Ports on which the application runs
service:
  name: my-node-app
  type: ClusterIP
  port: 3000

# Ingress parameters
ingress:
  enabled: false
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/rewrite-target: /
  path: /
  hosts:
    - my-node-app.example.com
```

**Kubernetes** resource templates are stored in the *templates* directory. For example, `deployment.yaml` contains a *Deployment* template for a Node.js application:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "my-node-app.fullname" . }}
  labels:
    app: {{ include "my-node-app.name" . }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      app: {{ include "my-node-app.name" . }}
  template:
    metadata:
      labels:
        app: {{ include "my-node-app.name" . }}
    spec:
      containers:
        - name: {{ .Chart.Name }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - name: http
              containerPort: 3000
          livenessProbe:
            httpGet:
              path: /healthz
              port: http
          readinessProbe:
            httpGet:
              path: /
              port: http
```

`{{ .Values.replicaCount }}`, `{{ .Values.image.repository }}` and other variables in the templates are replaced by values from `values.yaml`.

`service.yaml` contains a template for creating a Service to access the application:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: {{ .Values.service.name }}
```

*Kustomize* is a **Kubernetes** manifest configuration tool that allows you to manage configuration parameters, such as name and ports, without having to change the manifests directly. Kustomize also allows you to manage different environments (dev, staging, prod) and automatically generate manifests based on basic templates. Kustomize works by applying patches to existing manifests rather than by creating new manifests from scratch. This makes the configuration update process more secure and prevents possible conflicts when merging changes.

Kustomize resources are Kubernetes objects, such as deployments, services, configuration maps, etc., that can be configured or modified with Kustomize.
Thus, Kustomize resources are Kubernetes objects that can be configured and modified with Kustomize to provide a flexible and customizable way to manage Kubernetes configuration.
