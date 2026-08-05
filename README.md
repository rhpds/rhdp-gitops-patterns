# RHDP GitOps Patterns

Reference repository for GitOps automation patterns used in Red Hat Demo Platform (RHDP) lab and demo environments.

## Architecture

All labs follow a two-chart model:

- **`bootstrap-infra/`** — Cluster-scoped shared resources deployed once (operators, shared services, tenant-lifecycle namespace). An external deployer creates a single ArgoCD `Application` pointing here.
- **`bootstrap-tenant/`** — Per-user tenant environment deployed N times. The external deployer creates one ArgoCD `Application` per user, passing `username` and `deployer.domain` as helm values.

## Getting Started

Copy the `skeleton/` directory into your project's `automation/` directory and populate it with your lab-specific resources.

## Structure

```
skeleton/          Minimal starting point for new labs
examples/          Real-world lab automation for reference
```

## Skeleton

The skeleton provides:

- **bootstrap-infra**: tenant-lifecycle namespace and optional ApplicationSet for bulk tenant deployment (disabled by default)
- **bootstrap-tenant**: namespace creation from a configurable list, automatic `edit` RBAC per namespace for the tenant user

## Examples

Each subdirectory under `examples/` is a complete working lab automation. Use them as reference when building similar patterns.
