# sample-service

Reference application for the `tssc-platform-showcase` GitOps pattern
(`rhdp-gitops-patterns/examples/tssc-platform-showcase`).

This repository is the "end state" — dependencies, Dockerfile, and CI wiring
are already correct. It is built, scanned, signed, and deployed automatically
by the platform's own Tekton pipeline the first time the environment
bootstraps; there is nothing to fix here.
