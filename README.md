# RHDP GitOps Patterns

Catalog for the gitops-helper skill. Copy `skeleton/`, then add templates from ONE matching example. Do not mix overlapping operator installs.

## Architecture

- **bootstrap-infra/** — Cluster-scoped shared resources deployed once (operators, shared services, tenant-lifecycle). External deployer creates a single ArgoCD Application pointing here.
- **bootstrap-tenant/** — Per-user tenant environment deployed N times. External deployer creates one ArgoCD Application per user, passing `username` and `deployer.domain`.

## Example catalog

| Example | COPY WHEN | NOT FOR |
|---|---|---|
| sample-app-workshop | S2I nginx Deployment/Service/Route/ConfigMap tenant app | operators, git servers |
| pipelines-workshop | OpenShift Pipelines operator + Pipeline + PipelineRun + workspace PVC | Knative, other operators |
| gitea-devspaces | Gitea operator (CatalogSource+Subscription in openshift-operators, NO OperatorGroup) + shared Gitea CR + DevSpaces CheCluster | per-user Gitea, Gitea repo-migrate GOTCHAs, OpenVSX, per-user ArgoCD |
| gitops-workshop | per-user ArgoCD + Gitea user seeding + sample-repo Job (Ansible-in-Job) | Gitea operator install (use gitea-devspaces), DevSpaces |
| ocp-virt-lab | CNV operator + HyperConverged + simple per-user VirtualMachine | Gitea, GitLab, multi-VM travel app |
| modernize-ocp-virt | Istio Gateway + multi-VM travel tenant + per-user ArgoCD | GitLab/DevHub (ai-app-dev), simple VM (ocp-virt-lab) |
| ai-app-dev | GitLab + DevHub + per-user ArgoCD + VM/noVNC/LLM secret + shared VM DataSource | Istio Gateway/multi-VM (modernize-ocp-virt), CNV operator (ocp-virt-lab) |
| ai-dev-workshop | RHOAI DataScienceCluster + InferenceService/ServingRuntime + per-user Gitea CR + tenant pipeline using the model | Grafana/MLflow/notebooks (agentops-lab), Gitea operator (gitea-devspaces), Pipelines operator (pipelines-workshop) |
| agentops-lab | Grafana + MLflow + per-user notebooks/MinIO/DSPA + ServiceMonitor on inference | basic RHOAI+models (ai-dev-workshop), MAAS/quickstart sources |
| quickstart-sandbox-tour | MAAS credentials + QuickStart sources ConfigMap + Gitea CR repo-migrate GOTCHAs + bare DataScienceCluster | Gitea operator (gitea-devspaces), models/serving (ai-dev-workshop), notebooks (agentops-lab) |
| ansible-dev-tools | OpenVSX registry + image-sync + CheCluster wired to OpenVSX | vanilla DevSpaces (gitea-devspaces) |
| security-demo | RHACS Central/SecuredCluster + Quay + vulnerable demo workload | full TSSC platform (tssc-platform-showcase), Pipelines operator (pipelines-workshop) |
| tssc-platform-showcase | full TSSC composition (RHTAS/RHTPA/RHACS/RHDH/Gitea/Pipelines/demo PipelineRun) | individual operators — copy those from the dedicated example |
| serverless-workshop | Knative Serving/Eventing + knative-service tenant | Pipelines operator (pipelines-workshop) except as a dependency of the knative pipeline |
| service-mesh-lab | ServiceMesh/Istio + Kiali + VirtualService + frontend/backend + Web Terminal operator | Istio Gateway (modernize-ocp-virt), GitLab/DevHub (ai-app-dev) |
